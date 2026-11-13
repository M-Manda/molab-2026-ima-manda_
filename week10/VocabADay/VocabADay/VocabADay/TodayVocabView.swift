//
//  TodayVocabView.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

import SwiftUI
import PhotosUI // photosPicker is here

struct TodayVocabView: View {
    @Environment(VocabDocument.self) var document  // the shared document from VocabADayapp
    
    let word = "Halcyon" // It's hardcoded only for now. I'll fix it later. I promise
    let meaning = "Peaceful, calm, or tranquil (often used to describe quiet, golden moments of respite)."
    
    @State private var selectedItem: PhotosPickerItem? // not a picture yet. Just a reference to a photo in the library.
    @State private var showCamera = false
    @State private var showEditor = false
    
    var body: some View {
        VStack {
            Text(word)
                .font(.largeTitle)
                .bold()
            Text(meaning)
            Spacer()
            // ask the document for today's picture. nil = no picture yet
            if let image = document.imageFor(date:Date()) { // asking for an image with today's date from document
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
            } else {
                Rectangle()
                    .fill(Color.green.opacity(0.15))
                    .frame(height: 400)
                    .overlay {
                        Text("No picture yet")
                            .foregroundStyle(.gray)
                    }
            }
            Spacer()
            // $selectedItem = binding. The picker writes the chosen photo into selectedItem
            HStack {
                Button {
                    showCamera = true
                } label: {
                    Label("Take a picture", systemImage: "camera")
                }
                .disabled(!UIImagePickerController.isSourceTypeAvailable(.camera)) // simulator has no camera, it would crash
                
                Spacer()
                Button {
                    showEditor = true
                } label: {
                    Label("Draw", systemImage: "pencil.tip")
                }
                .disabled(document.imageFor(date: Date()) == nil) // nothing to draw on yet

                Spacer()

                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Label("Add a picture", systemImage: "photo")
                }
                .onChange(of: selectedItem, loadImage) // when selectedItem changes, run loadImage
            }
        }
        .padding()
        .navigationTitle("Today")
        .fullScreenCover(isPresented: $showCamera) {
            CameraPicker { image in
                saveCameraPhoto(image)
            }
            .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $showEditor) { // covers the whole screen, like the real Camera app
            if let image = document.uiImageFor(date: Date()) {
                PhotoEditorView(image: image)
                    .environment(document)
            }
        }
    }

    func loadImage() {
        Task { // allows asynchronous work because loading image from the photo library can take time
            // loadTransferable = give me this photo as raw bytes (Data)
            // await = wait here until the bytes are ready
            guard let data = try? await selectedItem?.loadTransferable(type: Data.self) else { return } // await = Pause this asynchronous task here until the operation finishes. It doesn't freeze the entire app. Other work can continue.
            document.saveImage(data: data, date: Date(), word: word) // function in VocabDocument
        }
    }
    func saveCameraPhoto(_ image: UIImage) {
        // UIImage -> Data so it can go in the JSON. 0.8 = good quality, smaller file
        guard let data = image.jpegData(compressionQuality: 0.8) else { return }
        document.saveImage(data: data, date: Date(), word: word) // same function the PhotosPicker uses
    }
}

#Preview {
    NavigationStack {
        TodayVocabView()
            .environment(VocabDocument())
    }
}
