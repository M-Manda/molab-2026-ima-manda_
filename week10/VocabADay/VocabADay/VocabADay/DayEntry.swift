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
    var imageFile: String? = nil // 2026-11-13.jpg
    var filteredFile: String? = nil // 2026-11-13-edited.jpg, nil = not edited
    var showTime: Bool = true
}
