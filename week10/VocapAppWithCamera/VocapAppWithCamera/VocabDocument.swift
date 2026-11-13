//
//  VocabDocument.swift
//  week7
//
//  Created by uurdmandakh munkhbayar on 2026.10.19.
//

import SwiftUI

@Observable
class VocabDocument {
    var model: VocabModel

    let saveFileName = "vocab.json"

    init() {
        print("VocabDocument init")

        model = VocabModel(JSONfileName: saveFileName)
    }

    func addItem(item: DayEntry) {
        model.addItem(item: item)
        saveModel()
    }

    func updateItem(item: DayEntry) {
        model.updateItem(item: item)
        saveModel()
    }

    // save a picture for a day. If that day already has an entry, replace its picture. If not, make a new entry.
    func saveImage(data: Data, date: Date, word: String) {
        if var entry = model.findEntry(date: date) {
            entry.imageData = data
            entry.filteredData = nil
            entry.date = date
            updateItem(item: entry)
        } else {
            let entry = DayEntry(date: date, word: word, imageData: data)
            addItem(item: entry)
        }
    }
    
    // save filtered photo
    func saveFilteredImage(data: Data, date: Date) {
        if var entry = model.findEntry(date: date) {
            entry.filteredData = data
            updateItem(item: entry)
        }
    }

    // save whether the time is shown for a day
    func saveShowTime(_ showTime: Bool, date: Date) {
        if var entry = model.findEntry(date: date) {
            entry.showTime = showTime
            updateItem(item: entry)
        }
    }
    
    func uiImageFor(date: Date) -> UIImage? {
        guard let entry = model.findEntry(date: date) else { return nil }
        var data = entry.imageData
        if entry.filteredData != nil { // use the filtered photo if there is one, otherwise the original
            data = entry.filteredData
        }
        guard let finalData = data else { return nil }
        return UIImage(data: finalData)
    }

    func imageFor(date: Date) -> Image? {
        guard let uiImage = uiImageFor(date: date) else { return nil }
        return Image(uiImage: uiImage)
    }

    func saveModel() {
        print("VocabDocument saveModel")
        model.saveAsJSON(fileName: saveFileName)
    }
}
