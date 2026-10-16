//
//  HistoryDocument.swift
//  week6json
//
//  Created by uurdmandakh munkhbayar on 2026.10.15.
//

import SwiftUI

@Observable
class HistoryDocument {
    var model: HistoryModel
    
    // file name to store JSON for model items
    let saveFileName = "history.json"
    
    init() {
        print("HistoryDocument init")
        
        // For testing:
        // remove(fileName: saveFileName)
        
        model = HistoryModel(JSONfileName: saveFileName);
    }
    
    func addItem(item: GameResult) {
        model.addItem(item: item);
        saveModel();
    }
    
    func saveModel() {
        print("HistoryDocument saveModel")
        model.saveAsJSON(fileName: saveFileName)
    }
}

//This file was heavily inspired by from 06-ImageEditDemoJSON Document.swift
