//
//  Navbar.swift
//  Stars
//
//  Created by uurdmandakh munkhbayar on 2026.10.07.
//

import SwiftUI

struct Navbar: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Pattern()
                } label: {
                    Text("Pattern")
                }
                NavigationLink {
                    week4()
                } label: {
                    Text("Four seasons")
                }
                NavigationLink {
                    SimonSays()
                } label: {
                    Text("simonSays")
                }
                NavigationLink {
                    HistoryView()
                } label: {
                    Text("History")
                }
            }
        }
        .navigationTitle("Menu")
    }
}

#Preview {
    Navbar()
        .environment(AudioDJ())
        .environment(HistoryDocument())
}
