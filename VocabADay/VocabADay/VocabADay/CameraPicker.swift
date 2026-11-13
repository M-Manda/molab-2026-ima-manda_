//
//  CameraPicker.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.12.
//

import SwiftUI
import UIKit

struct CameraPicker: UIViewControllerRepresentable { // lets SwiftUI show a UIKit screen
    var onCapture: (UIIMage) -> Void // what to do with the photo. TodayVocabView decides
    @Environment(\.dismiss) var dismiss // closes this screen
    
    // SwiftUI calls this once to make the UIKit screen
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera // camera, not photo library
        picker.delegate = context.coordinator // the coordinator hears photo taken and cancel
        return picker
    }
    
    // required, but nothing changes after it's made
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }
    
    // SwiftUI calls this before makeUIViewController
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    // UIKit talks through delegates. SwiftUI structs can't be delegates, so a class does it
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraPicker
        
        init(parent: CameraPicker) {
            self.parent = parent
        }
        
        // user pressed Use Photo
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage { // info is a dictionary. as? = try to treat it as UIImage
                parent.onCapture(image)
            }
            parent.dismiss()
        }
        
        // user pressed Cancel
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.dismiss()
        }
    }
    
}
