//
//  MakeItSo_MandaApp.swift
//  MakeItSo-Manda
//
//  Created by uurdmandakh munkhbayar on 2026.11.05.
//

import SwiftUI

@main
struct MakeItSoApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        RemindersListView()
          .navigationTitle("Reminders")
      }
    }
  }
}
