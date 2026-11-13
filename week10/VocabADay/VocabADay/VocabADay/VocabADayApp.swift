//
//  VocabADayApp.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

import SwiftUI

@main
struct VocabADayApp: App {
    @State var document = VocabDocument() // created once, when the app starts
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(document) // environment = Places an observable object in the view’s environment. Every view inside can now read it with @Environment
        }
    }
}
