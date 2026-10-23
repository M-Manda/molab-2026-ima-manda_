//
//  Navbar.swift
//  week7
//
//  Created by uurdmandakh munkhbayar on 2026.10.19.
//

import SwiftUI

struct NavigationBar: View {
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
    NavigationBar()
        .environment(VocabDocument())
}
