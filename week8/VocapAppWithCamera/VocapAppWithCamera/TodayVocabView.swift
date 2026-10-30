//
//  TodayVocabView.swift
//  week7
//
//  Created by uurdmandakh munkhbayar on 2026.10.19.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import SwiftUI
import AVFoundation

struct TodayVocabView: View {

    @Environment(VocabDocument.self) var document

    let word = "Halcyon"
    @State private var selectedItem: PhotosPickerItem?  // The photo the user chose. It’s not a picture yet, just a reference to a photo in the library.
    @State private var processedUIImage: UIImage?  // live preview of the filter, not saved yet
    @State private var filterIntensity = 0.5  // slider value, 0 to 1
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var caption = ""
    @State private var location = ""
    @State private var showTime = true
    @State private var showCamera = false
    @State private var showEditor = false
    let context = CIContext()  // does the actual image processing
    var body: some View {
        VStack {
            Text(word)  // It has only one word for now. I'll fix it in the future.
                .font(.largeTitle)
                .bold()
            Text(
                "Peaceful, calm, or tranquil (often used to describe quiet, golden moments of respite)."
            )

            Spacer()

            if let processedUIImage {  // live filter preview
                Image(uiImage: processedUIImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .overlay { photoLabels() }
                    .overlay(alignment: .bottomTrailing) { timeLabel() }
                    .frame(height: 400)
            } else if let pickedImage = document.imageFor(date: Date()) {
                pickedImage
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .overlay { photoLabels() }
                    .overlay(alignment: .bottomTrailing) { timeLabel() }
                    .frame(height: 400)
            } else {
                // Gray box is shown when there is no picture yet
                Rectangle()
                    .fill(Color.green.opacity(0.15))  // would be cool if this was a same color as your iphone~
                    .frame(height: 400)
                    .overlay {
                        Text("No picture yet")
                            .foregroundStyle(.gray)
                    }
            }

            Spacer()

            if processedUIImage != nil
                && currentFilter.inputKeys.contains(kCIInputIntensityKey)
            {
                HStack {  // intensity slider
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity, applyProcessing)
                }
            }

            HStack {  // filters row
                Button("Sepia") { setFilter(CIFilter.sepiaTone()) }
                Button("Blk&Wht") { setFilter(CIFilter.photoEffectNoir()) }
                Spacer()
                Button("Save Filter", action: saveFilter)
                Button("Draw") { showEditor = true }
            }

            TextField("Text on photo", text: $caption)
            TextField("Location", text: $location)

            HStack {  // time + save row
                Button(showTime ? "Hide time" : "Show time") {
                    showTime.toggle()
                }
                Spacer()
                Button("Save Text") {
                    document.saveText(
                        caption: caption,
                        location: location,
                        showTime: showTime,
                        date: Date()
                    )
                }
            }
            
            Button("Take a picture") { showCamera = true }

            // from 07-Instafilter
            PhotosPicker(selection: $selectedItem) {
                Text("Add a picture")
            }
            .onChange(of: selectedItem, loadImage)  // when a photo is chosen, run loadImage
        }
        .padding()
        // when the page opens, put the saved text back in the boxes
        .onAppear {  // learned from https://www.hackingwithswift.com/quick-start/swiftui/how-to-respond-to-view-lifecycle-events-onappear-and-ondisappear
            if let entry = document.model.findEntry(date: Date()) {
                caption = entry.caption
                location = entry.location
                showTime = entry.showTime
            }
        }
        .fullScreenCover(isPresented: $showCamera) {
            CameraView { image in
                saveCameraPhoto(image)
            }
        }
        .fullScreenCover(isPresented: $showEditor, onDismiss: { processedUIImage = nil }) {
            if let image = processedUIImage ?? document.uiImageFor(date: Date()) {
                PhotoEditorView(image: image)
                    .environment(document)
            }
        }
    }

    func loadImage() {
        Task {
            guard
                let imageData = try? await selectedItem?.loadTransferable(
                    type: Data.self
                )
            else { return }
            document.saveImage(data: imageData, date: Date(), word: word)
            processedUIImage = nil
        }
    }
    func saveCameraPhoto(_ image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return }  // from your saveFilter()
        document.saveImage(data: data, date: Date(), word: word)                  // from your loadImage()
        processedUIImage = nil                                                    // from your loadImage()
    }

    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        setFilterInput()
    }

    // give the filter today's original photo
    func setFilterInput() {
        guard let entry = document.model.findEntry(date: Date()) else { return }
        guard let data = entry.imageData else { return }
        guard let inputImage = UIImage(data: data) else { return }

        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }

    // from 07-Instafilter applyProcessing()
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        // Only Sepia has an intensity. Vintage skips this line.
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(
                filterIntensity,
                forKey: kCIInputIntensityKey
            )
        }

        guard let outputImage = currentFilter.outputImage else { return }
        guard
            let cgImage = context.createCGImage(
                outputImage,
                from: outputImage.extent
            )
        else { return }

        processedUIImage = UIImage(cgImage: cgImage)
    }

    // save the filtered preview as today's picture
    func saveFilter() {
        guard let processedUIImage else { return }
        guard let data = processedUIImage.jpegData(compressionQuality: 0.8)
        else { return }
        document.saveFilteredImage(data: data, date: Date())
        self.processedUIImage = nil  // preview done, now the saved version shows
    }

    func photoLabels() -> some View {
        VStack {
            Text(caption)
            Text(location)
        }
        .font(.title2)
        .bold()
        .foregroundStyle(.white)
        .shadow(radius: 3)  // dark edge so white text shows on light photos
    }
    @ViewBuilder
    func timeLabel() -> some View {
        if showTime {
            Text(timeText())
                .bold()
                .foregroundStyle(.white)
                .shadow(radius: 3)
                .padding(8)
        }
    }

    // today's photo time as text
    func timeText() -> String {
        guard let entry = document.model.findEntry(date: Date()) else {
            return ""
        }
        return entry.date.formatted(date: .omitted, time: .shortened)
    }

}

#Preview {
    TodayVocabView()
        .environment(VocabDocument())
}
