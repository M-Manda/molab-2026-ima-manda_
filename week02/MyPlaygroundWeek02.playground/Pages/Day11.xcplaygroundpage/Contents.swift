//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// How to limit access to internal data using access control


struct BankAccount {
    var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

//Use private for “don’t let anything outside the struct use this.”
//Use fileprivate for “don’t let anything outside the current file use this.”
//Use public for “let anyone, anywhere use this.”
//Use private(set) for “let anyone read this property, but only let my methods write it.”

// Static properties and methods

//struct School {
//    static var studentCount = 0
//
//    static func add(student: String) {
//        print("\(student) joined the school.")
//        studentCount += 1
//    }
//}
//
//School.add(student: "Taylor Swift")
//print(School.studentCount)

// Static -> Non-static - impossible
// Non-static -> Static - can happend

// self - The current value of a struct - true
// Self - The current type of struct - Int

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}
