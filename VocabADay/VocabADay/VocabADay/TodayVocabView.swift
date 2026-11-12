//
//  TodayVocabView.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

import SwiftUI

struct TodayVocabView: View {
    @Environment(VocabDocument.self) var document  // the shared document from VocabADayapp
    
    var body: some View {
        Text("Today's vocab goes here")
            .navigationTitle("Today")
    }
}
