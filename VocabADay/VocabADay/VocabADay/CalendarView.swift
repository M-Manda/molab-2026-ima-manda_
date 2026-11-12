//
//  CalendarView.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

import SwiftUI

struct CalendarView: View {
    @Environment(VocabDocument.self) var document
    
    var body: some view {
        Text("Calendar goes here")
            .navigationTitle("Calendar")
    }
}
