//
//  HistoryModelJSON.swift
//  week6json
//
//  Created by uurdmandakh munkhbayar on 2026.10.15.
//

import SwiftUI

extension HistoryModel {
    
    func saveAsJSON(fileName: String) {
        do {
            try saveJSON(fileName: fileName, val: self);
        }
        catch {
            fatalError("HistoryModel saveAsJSON error \(error)")
        }
    }
    
    init(JSONfileName fileName: String) {
        items = []
        do {
            self = try loadJSON(HistoryModel.self, fileName: fileName)
        } catch {
            print("HistoryModel init JSONfileName error \(error)")
        }
    }
}

//This file was heavily inspired by from 06-ImageEditDemoJSON modelJSON
