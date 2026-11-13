//
//  PhotoEditorView.swift
//  VocapAppWithCamera
//
//  Created by uurdmandakh munkhbayar on 2026.10.27.
//

import SwiftUI

struct PhotoEditorView: View {
    @Environment(VocabDocument.self) var document
    @Environment(\.dismiss) var dismiss
    let image: UIImage
    @State private var editorModel = MarkupEditorModel()

    var body: some View {
        NavigationStack {
            MarkupEditor(image: image, model: editorModel)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Cancel") { dismiss() }
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Done") {
                            Task {
                                let finished = await editorModel.finishedImage(photo: image)
                                if let data = finished.jpegData(compressionQuality: 0.8) { // saveFilter()
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
