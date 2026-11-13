//
//  CameraView.swift
//  VocapAppWithCamera
//
//  Created by uurdmandakh munkhbayar on 2026.10.27.
//

import SwiftUI
import AVFoundation

// Based on ContentView.swift from 08-CameraRecorder
struct CameraView: View {
    @State var model = Model()
    @Environment(\.dismiss) var dismiss
    var onCapture: (UIImage) -> Void

    var body: some View {
        ZStack {
            FrameView(image: model.previewImage)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button("Cancel") { dismiss() }
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding()
                Spacer()
                FilterSelectionView()
                ShutterButtonView()
            }
        }
        .onAppear {
            model.checkPermissions()
            model.setupSession()
        }
        .onDisappear {
            model.session.stopRunning()
        }
    }
    func FilterSelectionView() -> some View {
      // Effect selector
      return ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 5) {
          ForEach(VideoEffect.allCases, id: \.self) { effect in
            Button(action: {
              model.changeEffect(to: effect)
            }) {
              Text(effect.rawValue)
                .padding(8)
                .background(model.selectedEffect == effect ? Color.blue : Color.gray.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(8)
            }
          }
        }
        .padding()
      }
      .background(Color.black.opacity(0.5))
    }
    
    func ShutterButtonView() -> some View {
        Button {
            if let cgImage = model.previewImage {
                onCapture(UIImage(cgImage: cgImage))
                dismiss()
            }
        } label: {
            Circle()
                .fill(Color.white)
                .frame(width: 70, height: 70)
                .padding()
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 80, height: 80)
                )
        }
        .padding(.bottom, 5)
    }
}
