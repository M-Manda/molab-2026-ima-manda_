//
//  Reminder.swift
//  MakeItSo-Manda
//
//  Created by uurdmandakh munkhbayar on 2026.11.05.
//

import FirebaseFirestore
import Foundation

// Definine model for reminder
struct Reminder: Identifiable, Codable {
    @DocumentID
    var id: String?
    var title: String
    var isCompleted = false
}

extension Reminder {
    static let collectionName = "reminders"
}

extension Reminder {
    static let samples = [
        Reminder(
            title:
                "Resplendent – Shining brightly and dazzlingly; full of splendor.",
            isCompleted: true
        ),
        Reminder(
            title:
                "Pulchritudinous – (Formal/humorous) Having great physical beauty and grace."
        ),
        Reminder(
            title:
                "Beauteous – A more poetic, classic variation of the word beautiful."
        ),
        Reminder(
            title:
                "Comely – Pleasant to look at; attractive (often used for appearance or a person's face)."
        ),
    ]
}
