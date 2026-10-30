//
//  MarkupEditor.swift
//  VocapAppWithCamera
//
//  Created by uurdmandakh munkhbayar on 2026.10.27.
//

import SwiftUI
import UIKit
import PaperKit
import PencilKit

class MarkupViewController: UIViewController {
    let image: UIImage // the photo to draw on
    var paperViewController: PaperMarkupViewController? // kept so the + button and Done can use it
    var toolPicker: PKToolPicker? // kept so it isn't thrown away
    var canvasBounds: CGRect = .zero // remembered so Done knows the canvas size

    let featureSet: FeatureSet = {
        var featureSet: FeatureSet = .latest
        featureSet.insert(.stickers)
        featureSet.insert(.loupes)
        featureSet.remove(.images)
        featureSet.remove(.links)
        return featureSet
    }()

    // IKit class needs these to be created with a photo
    init(image: UIImage) {
        self.image = image
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    // needed for becomeFirstResponder() to work
    override var canBecomeFirstResponder: Bool { true }

    // Apple uses viewDidLoad, but inside SwiftUI the screen size is still 0 there.
    // viewDidLayoutSubviews runs once the size is known, so we set up here (only once).
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if paperViewController == nil && view.bounds.width > 0 {
            setUpPaperKit()
        }
    }

    func setUpPaperKit() {
        // canvas size = the photo shrunk to fit the screen width
        let width = view.bounds.width
        let height = width * image.size.height / image.size.width
        let canvasBounds = CGRect(x: 0, y: 0, width: width, height: height)
        self.canvasBounds = canvasBounds

        let markupModel = PaperMarkup(bounds: canvasBounds)
        let paperViewController = PaperMarkupViewController(markup: markupModel, supportedFeatureSet: featureSet)

        let photoView = UIImageView(image: image)
        photoView.frame = canvasBounds // photo the same size as the canvas
        paperViewController.contentView = photoView

        view.addSubview(paperViewController.view)
        addChild(paperViewController)
        paperViewController.didMove(toParent: self)
        becomeFirstResponder()
        paperViewController.view.frame = view.bounds // fill the screen
        self.paperViewController = paperViewController

        let toolPicker = PKToolPicker()
        toolPicker.addObserver(paperViewController)
        pencilKitResponderState.activeToolPicker = toolPicker
        pencilKitResponderState.toolPickerVisibility = .visible
        toolPicker.accessoryItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonPressed(_:)))
        self.toolPicker = toolPicker
    }

    // this menu must use the same featureSet as the canvas
    @objc func plusButtonPressed(_ button: UIBarButtonItem) {
        let markupEditViewController = MarkupEditViewController(supportedFeatureSet: featureSet)
        markupEditViewController.delegate = paperViewController
        markupEditViewController.modalPresentationStyle = .popover
        markupEditViewController.popoverPresentationController?.barButtonItem = button
        present(markupEditViewController, animated: true)
    }
}

// Same pattern as ImagePicker.swift
struct MarkupEditor: UIViewControllerRepresentable {
    let image: UIImage
    let model: MarkupEditorModel

    func makeUIViewController(context: Context) -> MarkupViewController {
        let controller = MarkupViewController(image: image)
        model.controller = controller     // Glue: so the Done button can reach the drawing
        return controller
    }

    func updateUIViewController(_ uiViewController: MarkupViewController, context: Context) {
    }
}

@MainActor
class MarkupEditorModel {
    weak var controller: MarkupViewController?

    func finishedImage(photo: UIImage) async -> UIImage {
        guard let controller,
              let paperViewController = controller.paperViewController,
              let cgPhoto = photo.cgImage else { return photo }

        guard let markupModel = paperViewController.markup else { return photo }

        let photoWidth = CGFloat(cgPhoto.width) // W
        let photoHeight = CGFloat(cgPhoto.height) // H
        let canvasBounds = controller.canvasBounds // w

        guard let context = CGContext(data: nil,
                                      width: cgPhoto.width,
                                      height: cgPhoto.height,
                                      bitsPerComponent: 8,
                                      bytesPerRow: 0,
                                      space: CGColorSpaceCreateDeviceRGB(),
                                      bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
        else { return photo }

        // the photo, at full size
        context.draw(cgPhoto, in: CGRect(x: 0, y: 0, width: photoWidth, height: photoHeight))

        // turn the context into canvas coordinates
        let s = photoWidth / canvasBounds.width // enlargement
        context.translateBy(x: 0, y: photoHeight) // start measuring from the top
        context.scaleBy(x: s, y: -s) // enlarge, and flip y so it points down

        // the drawing, in its own canvas size. The context does the enlarging and flipping
        await markupModel.draw(in: context, frame: canvasBounds)

        guard let result = context.makeImage() else { return photo }
        return UIImage(cgImage: result)
    }
}
