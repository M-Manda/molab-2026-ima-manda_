//
//  StarsApp.swift
//  Stars
//
//  Created by uurdmandakh munkhbayar on 2026.10.07.
//

import SwiftUI

@main
struct SlideShowDemoApp: App {
    @State var audioDJ = AudioDJ()
    @State var historyDocument = HistoryDocument()
    var body: some Scene {
        WindowGroup {
            Navbar()
                .environment(audioDJ)
                .environment(historyDocument)
        }
    }
}
