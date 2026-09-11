//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// Data structures made me strongly dislike arrays. Hope it'll be better. T.T

var beatles = ["John", "Paul", "Ringo", "George"]
let numbers = [4, 8, 15, 16, 23, 42]
let temperatures = [25.3, 28.2, 26.5]

print(beatles[0])
print(numbers[1])
print(temperatures[2])

beatles.append("Pete")

// You cannot add string to int array
// You can + two int or two string, but can never mix them

var scores = Array<Int>() // array that holds speciffically int. specialized array
scores.append(100)
scores.append(80)
scores.append(85)
print(scores[1])

//var albums = Array<String>()
var albums = [String]() // <- shorter form
albums.append("Folklore")
albums.append("Fearless")
albums.append("Red")

print(albums.count)

var characters = ["H", "e", "l", "l", "o"]
print(characters.count)

characters.remove(at: 2) // third item is removed
print(characters.count)

characters.removeAll()
print(characters.count)

let bondMovies = ["Casino Royale", "Spectre", "No Time to Die"]
print(bondMovies.contains("Frozen"))

let cities = ["New York", "London", "Berlin", "Madrid"]
print(cities.sorted()) // returns new array with its items sorted

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

var employee = ["Talor Swift", "Singer", "Nashville"]

print("Name: \(employee[0])")
// employee.remove(at: 1) <- will make this method crash
print("Job title: \(employee[1])")
print("Location: \(employee[2])")

var employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]
// print(employee2["name"]) <- gives warning
// it might be there, or it might not
print(employee2["name", default: "Unknown"])

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

let olympics = [
    2012: "London",
    2016: "Rio",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neil"] = 216
heights["LeBron James"] = 206

var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Penguin" // it overwrites the previous

let newActors = Set([
    "Denzel Washington",
    "Tom Cruise",
    "Robert De Niro",
    "Nicolas Cage"
]) // it creates an array inside a set
print(newActors) // set does not care about order

var actors = Set<String>()
actors.insert("Denzel Washington") // we say insert instead of append. Because there is no order.
actors.insert("Tom Cruise")
actors.insert("Robert De Niro")
actors.insert("Nicolas Cage")
print(actors)

// enum is set of named vallues

var selected = "Monday"
selected = "Tuesday"
selected = "January" // <- problem
selected = "Friday " // <- problem

enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
} // all the possible cases we want support

enum Month {
    case January, February, March, April, May, June, July, August, September, October, November, December
}

var day = Weekday.monday // use enum rather than string
day = .tuesday // we can skip the name after the first assignment
day = .friday
//day = Weekday.January gives error

// Challenge: You must put : after default
// Challenge: we insert to array, we don't append it.
