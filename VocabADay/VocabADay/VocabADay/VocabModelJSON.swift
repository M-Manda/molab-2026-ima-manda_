//
//  VocabModelJSON.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

import Foundation

// Connects VocabModel to SaveLoadJSON.swift
extension VocabModel { // extension = allows you to add new functionality to an existing type without changing its original declaration
    
    // saves VocabModel -> saveJSON -> vocab.json
    func saveAsJSON(fileName: String) {
        do {
            try saveJSON(fileName: fileName, val: self) // self = this whole VocabModel
        } catch  {
            print("saveAsJSON error", error)
        }
    }
    
    // loads vocab.json -> loadJSON -> VocabModel
    init(JSONfileName fileName: String) {
        self.init() // start empty (items = []). This calls another initializer of VocabModel to initialize the instanse.
        do {
            self = try loadJSON(VocabModel.self, fileName: fileName) // replace with the saved data if the file exists
        } catch { // if file doesn't exist
            print("no saved file yet", error)
        }
    }
}
