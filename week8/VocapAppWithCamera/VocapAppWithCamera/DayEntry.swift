//
//  DayEntry.swift
//  week7
//
//  Created by uurdmandakh munkhbayar on 2026.10.19.
//

import Foundation

struct DayEntry: Identifiable, Codable {
    var id = UUID()
    var date = Date() // the day this picture belongs to
    var word: String = "" // the vocab word for that day
    var imageData: Data? = nil // the photo's raw bytes (original)
    var filteredData: Data? = nil // the photo after a filter, nil = no filter saved
    var caption: String = ""
    var location: String = ""
    var showTime: Bool = true
}
