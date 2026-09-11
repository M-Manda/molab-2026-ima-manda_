//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

let surname: String = "Lasso"
var score: Double = 0

let playerName: String = "Roy"
let luckyNumber: Int = 13
let pi: Double = 3.14159
var isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"]
var user: [String: String] = ["name": "Roy", "surname": "Lasso"]
var books: Set<String> = Set([
    "The Bluest Eye",
    "Foundation",
    "Girl, Woman, Other"
])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]
var teams: [String] = [String]()
var cities = [String]()

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

// Use it when you don't have value yet

let ar = ["a", "b", "c", "d", "a", "c"]
print(ar.count)
var s = Set<String>()
s.insert(ar[0])
s.insert(ar[1])
s.insert(ar[2])
s.insert(ar[3])
s.insert(ar[4])
s.insert(ar[5])
print(s.count)


// Challenge: Those things are gonna be hard to memorize
