//
//  SlideShowDemoApp.swift
//  FourSeason
//
//  Created by uurdmandakh munkhbayar on 2026.09.28.
//

import SwiftUI

@main
struct SlideShowDemoApp: App {
    @State var audioDJ = AudioDJ()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(audioDJ)
        }
    }
}
