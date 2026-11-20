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
                    Text("Today's Vocab")
                }
                NavigationLink {
                    CalendarView()
                } label: {
                    Text("Calendar")
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
