//
//  HistoryView.swift
//  week6json
//
//  Created by uurdmandakh munkhbayar on 2026.10.15.
//

import SwiftUI

struct HistoryRow: View {
    var item: GameResult
    
    var body: some View {
        HStack {
            Text(item.correct ? "Correct" : "Incorrect")
                .foregroundColor(item.correct ? .green : .red)
            Text("Level \(item.sequence.count)")
            Spacer()
            Text(verbatim: "\(item.tapped)") // there was a warning so I looked up and found out that verbatim: fixes that
        }
    }
}

struct HistoryView: View {
    @Environment(HistoryDocument.self) var historyDocument
    
    var body: some View {
        List {
            // Display in reverse order to see new additions first
            ForEach(historyDocument.model.items.reversed()) { item in
                HistoryRow(item: item)
            }
        }
        .navigationTitle("History")
    }
}

#Preview {
    HistoryView()
        .environment(HistoryDocument())
}
