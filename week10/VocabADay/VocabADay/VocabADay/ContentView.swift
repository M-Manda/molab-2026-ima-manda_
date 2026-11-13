//
//  ContentView.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    TodayVocabView()
                } label: {
                    Label("Today's Vocab", systemImage: "book")
                }
                NavigationLink {
                    CalendarView()
                } label: {
                    Label("Calendar", systemImage: "calendar")
                }
            }
            .navigationTitle("Vocab a Day")
        }
    }
}

#Preview {
    ContentView()
        .environment(VocabDocument())
}
