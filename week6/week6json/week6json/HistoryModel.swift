//
//  HistoryModel.swift
//  week6json
//
//  Created by uurdmandakh munkhbayar on 2026.10.15.
//

import SwiftUI

struct HistoryModel: Codable {
    var items: [GameResult]
    
    init () {
        items = [];
    }
    
    mutating func addItem(item: GameResult) {
        items.append(item)
    }
}

//This file was heavily inspired by from 06-ImageEditDemoJSON model
