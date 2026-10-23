//
//  VocabModelJSON.swift
//  week7
//
//  Created by uurdmandakh munkhbayar on 2026.10.19.
//

//  Based on ModelJSON.swift from 06-ImageEditDemoJSON. Only names changed

import SwiftUI

extension VocabModel {

    func saveAsJSON(fileName: String) {
        do {
            try saveJSON(fileName: fileName, val: self)
        }
        catch {
            fatalError("VocabModel saveAsJSON error \(error)")
        }
    }

    init(JSONfileName fileName: String) {
        items = []
        do {
            self = try loadJSON(VocabModel.self, fileName: fileName)
        } catch {
            print("VocabModel init JSONfileName error \(error)")
        }
    }
}
