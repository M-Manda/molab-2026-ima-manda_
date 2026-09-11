//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

//Excited to start!

// Young language - 2014
// Safe
// Codes are clear and understandable
// Supports all the languages

// Memorizing Let and Var:
// Let - Don't let it change
// Var - Variable that you can change - it can vary

// Storing data

import UIKit

// ; is only used when there are two lines of codes in one line

var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne"
// character = "Eloise" <- can't do this

var playName = "Roy"
print(playName)

playName = "Dani"
print(playName)

playName = "Sam"
print(playName)

let managerName = "Michael Scott"
let dogBreed = "Samoyed"

let actor = "Denzel Washington"
let filename = "picture.jpeg"
let result = "😀 happy"

let quote = "It has \" Double Quotes \" and ' single quotes '"
print(quote)

// \ is not ending strings

let movie = """
    This
    is
    multiline
    string.
    """
print(movie)

print(actor.count)

let nameLenght = actor.count
print(nameLenght)

print(result.uppercased())

print(movie.hasPrefix("A day")) // is it starts with something

print(filename.hasSuffix(".jpeg"))

// do work ()
// read no need for ()

let score = 10
let reallyBig = 100_000_000 // swift ignores _s
let crazyNumber = 1_00_000000_0_000_____0

let lowerScore = score - 1
let higherScore = score + 1
let doubleScore = score * 2
let squareScore = score * score
let halveScore = score / 2

var counter = 10
counter += 5
print(counter)
counter *= 2
counter /= 2

let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))

let fNumber = 0.1 + 0.2
print(fNumber)

// Decimals are not nearly as accurate
// Integers are really accurate

let a = 1
let b = 2.0
// let c = a + b Swift won't let us mix data

let c = Double(a) + b

let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3 // must always hold that same type of data

var nName = "Nicolas Cage"
// nName = 57 Can't do this

var double4 = 5.0
double4 *= 2 // Swift understands
double4 += 2

// Problem: No such module 'Cocoa'
// Fix: imported UIKit instead
