//
//  SaveLoadJSON.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

// this file is heavily inspired by 06-ImageEditDemoJSON

import Foundation

// Convert my swift value (a VocabModel) into JSON bytes = encoding
// Write those bytes to a file on the phone.
// Reading bytes from the file, and converting them back to VocabModel = decoding

// File needs a location
func documentPath(fileName: String) throws -> URL { // throws = function can trhow an error while executing
    let directory = try FileManager.default.url( // directory will store the URL of the Document directory
        for: .documentDirectory, // specifies which directory I want
        in: .userDomainMask, // specifies where to look for that directory. Here it refers to the app's user level document directory, not a shared document folder accessible to every app.
        appropriateFor: nil,
        create: false) // specifies whether FileManager should create the directory if it doesn't exist. Here it doesn't create it. Just locates it.
    return directory.appendingPathComponent(fileName) // /Docuemnts/ + calendar.json = /Documents/calendar.json It constructs final URL
}

// swift data -> jsonEncoder -> json data -> saved in documents
func saveJSON<T: Encodable>(fileName: String, val: T) throws { // T =  generic type paramenter, val: T = the actual swift data you want to save
    let filePath = try documentPath(fileName: fileName) // where
    let encoder = JSONEncoder() // make a converter. It converst swift objects into json compatible data
    encoder.outputFormatting = .prettyPrinted // controls how the json is formatted. Basically makes it pretty to look at
    let jsonDATA = try encoder.encode(val) // turning swift value to json bytes. Uses the converter to convert data
    try jsonDATA.write(to: filePath) // writes bytes to file
    print("saved to", filePath.path)
}

// Load. Decodes json to swift
func loadJSON<T: Decodable>(_ type: T.Type, fileName: String) throws -> T { // pass the type itself. Function returns a value of that type.
    let filePath = try documentPath(fileName: fileName) // where
    let jsonData = try Data(contentsOf: filePath) // file -> bytes
    let decoder = JSONDecoder() // make a converter
    return try decoder.decode(type, from: jsonData) // bytes -> swift value
}


func remove(fileName: String) {
    do {
        let filePath = try documentPath(fileName: fileName)
        try FileManager.default.removeItem(at: filePath)
    } catch {
        print("remove error", error)
    }
}
