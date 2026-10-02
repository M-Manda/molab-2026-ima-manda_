//
//  SlidesAudioView.swift
//  FourSeason
//
//  Created by uurdmandakh munkhbayar on 2026.09.28.
//

import Combine
import SwiftUI

struct SlidesAudioView: View {
    @State var slideIndex = 0
    @State var isPlaying = false
    // Timer gets called every 7 second.
    let timer = Timer.publish(every: 7, on: .main, in: .common).autoconnect()

    @Environment(AudioDJ.self) var audioDJ

    var body: some View {
        VStack {
            Text("Four season")
                .font(Font.system(size: 30, weight: .bold))
                .padding()
                .buttonStyle(.bordered)
                .foregroundStyle(
                .linearGradient(
                    colors: [.blue, .pink],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            // slides is defined in ContentView
            let name = slides[slideIndex]
            ZStack {
                SingleSlideView(name: name)
                    .id(slideIndex)
                    .transition(.opacity)
            }
            HStack {
                Button(action: previousItemAction) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()
                Spacer()
                Button(action: playPauseAction) {
                    Image(systemName: isPlaying ? "pause" : "play")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                Spacer()
                Button(action: nextItemAction) {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()
            }
        }
        .onReceive(timer) { _ in
            // Block gets called when timer updates.
            if isPlaying {
                nextItemAction()
            }
        }
        .onAppear {

        }
        .onDisappear {
            isPlaying = false
            audioDJ.stop()
        }
    }

    func playPauseAction() {
        isPlaying.toggle()
        if isPlaying {
            audioDJ.choose(slideIndex)
            audioDJ.play()
        } else {
            audioDJ.stop()
        }
    }
    func previousItemAction() {
        withAnimation(.easeInOut(duration: audioDJ.fadeTime)) {
            slideIndex = (slideIndex - 1 + slides.count) % slides.count
        }
        if isPlaying {
            audioDJ.choose(slideIndex)
            audioDJ.play()
        }
    }
    func nextItemAction() {
        withAnimation(.easeInOut(duration: audioDJ.fadeTime)) {
            slideIndex = (slideIndex + 1) % slides.count
        }
        if isPlaying {
            audioDJ.choose(slideIndex)
            audioDJ.play()
        }
    }
}

// AudioDJ must be established here to avoid crash in preview
// Can not use var property
#Preview {
    SlidesAudioView()
        .environment(AudioDJ())
}
