//
//  TodayVocabView.swift
//  week7
//
//  Created by uurdmandakh munkhbayar on 2026.10.19.
//

import PhotosUI
import SwiftUI

struct TodayVocabView: View {

    @Environment(VocabDocument.self) var document

    let word = "Halcyon"
    @State private var selectedItem: PhotosPickerItem?  // The photo the user chose. It's not a picture yet, just a reference to a photo in the library.
    @State private var showTime = true
    @State private var showCamera = false
    @State private var showEditor = false

    var body: some View {
        VStack {
            Text(word)  // It has only one word for now. I'll fix it in the future.
                .font(.largeTitle)
                .bold()
            Text(
                "Peaceful, calm, or tranquil (often used to describe quiet, golden moments of respite)."
            )

            Spacer()

            if let pickedImage = document.imageFor(date: Date()) {
                pickedImage
                    .resizable()
                    .scaledToFit()
                    .overlay(alignment: .bottomTrailing) { timeLabel() }
                    .frame(height: 400)
            } else {
                // Green box is shown when there is no picture yet
                Rectangle()
                    .fill(Color.green.opacity(0.15))  // would be cool if this was a same color as your iphone~
                    .frame(height: 400)
                    .overlay {
                        Text("No picture yet")
                            .foregroundStyle(.gray)
                    }
            }

            Spacer()

            HStack {  // time + draw row
                Button(showTime ? "Hide time" : "Show time") {
                    showTime.toggle()
                    document.saveShowTime(showTime, date: Date())  // saved right away now
                }
                Spacer()
                Button("Draw") { showEditor = true }
                    .disabled(document.imageFor(date: Date()) == nil)  // nothing to draw on yet
            }

            HStack {  // picture row
                Button("Take a picture") { showCamera = true }
                Spacer()
                // from 07-Instafilter
                PhotosPicker(selection: $selectedItem) {
                    Text("Add a picture")
                }
                .onChange(of: selectedItem, loadImage)  // when a photo is chosen, run loadImage
            }
        }
        .padding()
        // when the page opens, put the saved setting back
        .onAppear {  // learned from https://www.hackingwithswift.com/quick-start/swiftui/how-to-respond-to-view-lifecycle-events-onappear-and-ondisappear
            if let entry = document.model.findEntry(date: Date()) {
                showTime = entry.showTime
            }
        }
        .fullScreenCover(isPresented: $showCamera) {
            CameraView { image in
                saveCameraPhoto(image)
            }
        }
        .fullScreenCover(isPresented: $showEditor) {
            if let image = document.uiImageFor(date: Date()) {
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
        }
    }

    func saveCameraPhoto(_ image: UIImage) {
        guard let data = image.jpegData(compressionQuality: 0.8) else { return }
        document.saveImage(data: data, date: Date(), word: word)
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
