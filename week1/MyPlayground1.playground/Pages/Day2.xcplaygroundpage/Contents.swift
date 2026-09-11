//: [Previous](@previous)

import Foundation

//: [Next](@next)

// Is it True, or is it False

// George Boole

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
var gameOver = false
print("Printint gameOver")
print(gameOver)
gameOver.toggle() // <- same as !
print(gameOver)

let isMultiple = 120.isMultiple(of: 3)
print(isMultiple)

// can't true + true

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

// Joining strings

// string interpolation

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let luric = people + " gonna " + action

let luggageCode = "1" + "2" + "3" + "4" + "5"

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let xnumber = 11
let missionMessage = "Apollo \(xnumber) landed on the moon." // you cannot use + instead

print("5 x 5 is \(5*5)")

// Checkpoint

let c = 40
let f = c * 9 / 5 + 32

print("\(c) in Celsius is \(f) in Fahrenheit")
