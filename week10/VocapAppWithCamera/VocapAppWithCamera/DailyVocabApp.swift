//
//  DailyVocabApp.swift
//  week7
//
//  Created by uurdmandakh munkhbayar on 2026.10.19.
//

import SwiftUI

@main struct DailyVocabApp: App {
    @State var document = VocabDocument()
    
    var body: some Scene {
        WindowGroup {
            NavigationBar()
                .environment(document)
        }
    }
}
