//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// I should be good at this

let score = 85
if score > 80 {
    print("Great job!")
}

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {
    print("Where we're going,w e don't need roads.")
}

if percentage < 85 {
    print("Sorry, you failed the test.")
}

if age >= 18 {
    print("You're eligible to vote.")
}

let ourName = "Dave Lister"
let friendName = "Arnold Rinmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}
if ourName > friendName {
    print("It's \(friendName) vs \(ourName)")
}

var numbers = [1, 2, 3]
numbers.append(4)
if numbers.count > 3{
    numbers.remove(at: 0)
}

print(numbers)

let country = "Canada"

if country == "Australia"{
    print("Hi")
}

if country != "Australia"{
    print("Hello")
}

var username = "taylorswift13"

if username.isEmpty == true {
    username = "Anonymous"
}

// Counting is inneficient. Is empty is better

print("Welcome, \(username)")
    
let temp = 25

if temp > 20 && temp < 30{
    print("It's nice day.")
}

// && = and

let userAge = 14
let hasParentalConsent = true

if age >= 18 || hasParentalConsent {
    print(" You can buy the game")
}

// || = or

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
    print("Let's fly")
} else if transport == .bicycle {
    print("I hope there's a bike path")
} else if transport == .car{
    print("car ride")
} else {
    print("scooter time")
}

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day")
} else if forecast == .rain {
    print("Pack an umbrella")
} else if forecast == .wind {
    print ("Wear something warm")
} else {
    print("Our forecast generator is broken")
} // <-  this code is not that good. You're doing the same thing over and over again

switch forecast{
case .sun:
    print("...")
case .rain:
    print("...")
case .wind:
    print("...")
case .snow:
    print("...")
case .unknown:
    print("...")
} // <- only does the bit that actually matches. Swift must be exaustive
let place = "Metropolis"

switch place {
case "Gotham":
    print("...")
case "London":
    print("...")
default:
    print("Who are you")
} // <- if default is not in the end, it'll never run the rest of the code that coems after default.

let day = 5
print("My true love gave to me...")

switch day {
case 5:
    print("5 golden rings")
    fallthrough // it makes the next part run
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    ("A partidge in a pear tree")
}

// Ternary conditional operator

let canVote = age >= 18 ? "Yes" : "No" // True - yes, False - no

// WTF - What, True, False

let hour = 23

print(hour < 12 ? "It's before noon" : "It's after noon")

let names = ["Jayne", "Kayles", "Mal"]
let crewCount = names.isEmpty ? "No one" : "\(names.count) people"
print(crewCount)

enum Theme {
    case light, dark
}

let theme = Theme.dark

let background = theme == .dark ? "black" : "white"
print(background)

// Note: Switch is very clever. I'm surprised that it's my first time seeing anything like this. Also love fallthrough
