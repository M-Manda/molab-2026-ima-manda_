//
//  GameResult.swift
//  week6json
//
//  Created by uurdmandakh munkhbayar on 2026.10.15.
//

import Foundation

struct GameResult : Identifiable, Codable {
    var id = UUID()
    var sequence: [Int] = []
    var tapped: [Int] = []
    var correct: Bool = false
}
