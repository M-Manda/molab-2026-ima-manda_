//
//  ContentView.swift
//  FourSeason
//
//  Created by uurdmandakh munkhbayar on 2026.09.28.
//

import SwiftUI

let slides = ["spring", "summer", "autumn", "winter"]

struct week4: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Text("Select what you want to see")
                    .font(.largeTitle)
                    .italic()
                    .multilineTextAlignment(.center)
                
                NavigationLink (destination: SlidesAudioView()) {
                    Text("Four Season")
                        .padding()
                        .font(.system(size: 50))
                        .buttonStyle(.bordered)
                        .foregroundStyle(
                            .linearGradient(
                                colors: [.blue, .pink],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                }
                    
                NavigationLink (destination: FallingLeavesView()) {
                    Text("Autumn")
                        .padding()
                        .font(.system(size: 50))
                        .buttonStyle(.bordered)
                        .foregroundStyle(
                            .linearGradient(
                                colors: [.yellow, .red],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }

                Spacer()
            }
        }
    }
}

#Preview {
    week4()
        .environment(AudioDJ())
}

