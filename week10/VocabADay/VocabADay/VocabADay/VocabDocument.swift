//
//  VocabDocument.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

// changes the model and save4s after every change

import SwiftUI

@Observable // it makes SwiftUI watch the class properties. When model changes, any view that read model redraws automatically.
class VocabDocument { // struct gets copied and drifts appart. class is shared so all views can see the same data.
    var model: VocabModel // model changes
    let saveFileName = "vocab.json" // never changes
    
    
    // app starts -> VocabDocument.init -> VocabModel(JSONfileName:) -> loadJSON -> reads vocab.json
    init() {
        model = VocabModel(JSONfileName: saveFileName) // It is the initializer in VocabModelJSON.swift. It calls loadJSON. If the files exists, get saved entries back.
    }
    
    func saveModel() {
        model.saveAsJSON(fileName: saveFileName)
    }
    
    func addItem(item: DayEntry) {
        model.addItem(item: item) // change the data
        saveModel() // save it
    }
    
    func updateItem(item: DayEntry) {
        model.updateItem(item: item)
        saveModel()
    }
    
    func saveImage(data: Data, date: Date, word: String) {
        let name = fileName(for: date) + ".jpg"
        saveImageFile(data: data, fileName: name) // the photo goes to its own file
        if var entry = model.findEntry(date: date) { // if this day already has an entry, replace its photo
            entry.imageFile = name
            entry.filteredFile = nil // old filter no longer matches the new photo
            entry.date = date // update the time stamp
            updateItem(item: entry)
        } else { // if there is no entry for this day yet, make a new one
            let entry = DayEntry(date: date, word: word, imageFile: name)
            addItem(item: entry)
        }
    }
    
    // makes sence only when entry already exists
    func saveFilteredImage(data: Data, date: Date) {
        if var entry = model.findEntry(date: date) {
            let name = fileName(for: date) + "-edited.jpg"
            saveImageFile(data: data, fileName: name)
            entry.filteredFile = name
            updateItem(item: entry)
        }
    }
    
    // makes sence only when entry already exists
    func saveShowTime(_ showTime: Bool, date: Date) { // _ showTime means no label when calling
        if var entry = model.findEntry(date: date) {
            entry.showTime = showTime
            updateItem(item: entry)
        }
    }
    
    // Get a picture back out
    func uiImageFor(date: Date) -> UIImage? {
        guard let entry = model.findEntry(date: date) else { return nil } // guard = make sure this exists. If it doesn't leave the function now
        guard let name = entry.filteredFile ?? entry.imageFile else { return nil } // edited one if it exists, else original
        guard let data = loadImageFile(fileName: name) else {return nil} // read the file
        return UIImage(data: data)
    }
    
    func imageFor(date: Date) -> Image? {
        guard let uiImage = uiImageFor(date: date) else { return nil }
        return Image(uiImage: uiImage)
    }
    
    func fileName(for date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd" // mm = minutes, so it must be capital
        return formatter.string(from: date)
    }
}
