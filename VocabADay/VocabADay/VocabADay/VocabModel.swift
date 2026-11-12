//
//  VocabModel.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

import SwiftUI

struct VocabModel: Codable {
    var items: [DayEntry] = [] // declaring a variable named items that stores array of DayEntry objects
    
    init() {
        items = [] // innitialize items as empty array when object is created
    } // I feel like this is unnecessary. I feel like I can just make an object when there is something to add, so it's never empty, an it always has something
    
    mutating func addItem(item: DayEntry) {
        items.append(item)
    }
    
    mutating func updateItem(item: DayEntry) {
        if let index = findIndex(item.id) { // find the object with same id
            items[index] = item // update to the new version
        }
    }
    
    func findIndex(_ id: UUID) -> Int? {
        return items.firstIndex { item in item.id == id}
    } // Give me a UUID. Search through items array. Find the first item whose ID matches that UUID. Return its index. If no matching item exists, return nil.
    
    // Finds the entry for a given day. Nil if there isn't one
    func findEntry(date: Date) -> DayEntry? {
        return items.first { item in Calendar.current.isDate(item.date, inSameDayAs: date) }
    }
    
}
