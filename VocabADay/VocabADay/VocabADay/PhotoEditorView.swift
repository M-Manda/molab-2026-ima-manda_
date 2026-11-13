//
//  PhotoEditorView.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.12.
//

import SwiftUI

// The screen around the drawing canvas cancel done buttons
struct PhotoEditorView: View {
    @Environment(VocabDocument.self) var document
    @Environment(\.dismiss) var dismiss
    let image: UIImage // the photo to draw on, from TodayVocabView
    @State private var editorModel = MarkupEditorModel() // lets Done reach the drawing (see MarkupEditor.swift)

    var body: some View {
        NavigationStack { // NavigationStack only so the toolbar has a bar to sit in
            MarkupEditor(image: image, model: editorModel)
                .ignoresSafeArea(edges: .bottom)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") { dismiss() } // close without saving
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            Task { // finishedImage is async (it awaits the drawing)
                                let finished = await editorModel.finishedImage(photo: image) // photo + drawing -> one image
                                if let data = finished.jpegData(compressionQuality: 0.8) {   // UIImage -> Data for the JSON
                                    document.saveFilteredImage(data: data, date: Date()) // VocabDocument
                                }
                                dismiss()
                            }
                        }
                        .bold()
                    }
                }
        }
    }
}
