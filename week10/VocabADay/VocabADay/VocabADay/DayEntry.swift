//
//  DayEntry.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

import Foundation

struct DayEntry: Identifiable, Codable {
    var id = UUID()
    var date = Date() // creates a value holding the exact moment the code runs
    var word: String = "" // the vocab word for that day
    var imageData: Data? = nil // the photo's raw bytes (original)
    var filteredData: Data? = nil // the photo after a filter, nil = no filter saved
    var showTime: Bool = true
}
