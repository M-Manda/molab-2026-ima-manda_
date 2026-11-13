//
//  VocabModel.swift
//  week7
//
//  Created by uurdmandakh munkhbayar on 2026.10.19.
//

import SwiftUI

struct VocabModel: Codable {
    var items: [DayEntry]

    init() {
        items = []
    }

    mutating func addItem(item: DayEntry) {
        items.append(item)
    }

    mutating func updateItem(item: DayEntry) {
        if let index = findIndex(item.id) {
            items[index] = item
        }
    }

    func findIndex(_ id: UUID) -> Int? {
        return items.firstIndex { item in item.id == id }
    }

    // Finds the entry for a given day. Nil if there isn't one
    func findEntry(date: Date) -> DayEntry? {
        return items.first { item in Calendar.current.isDate(item.date, inSameDayAs: date) }
    }
}
