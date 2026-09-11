//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

func showWelcome() {
    print("...")
}

showWelcome()

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) * \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20) // <- the ones that are baing passed are called argument

func rollDice() -> Int { // will and must return back integer
    return Int.random(in: 1...6)
}

let result = rollDice()
print(result)

func two(string1: String, string2: String) -> Bool{
    var set1 = Set<Character>()
    var set2 = Set<Character>()
    for i in string1 {
        set1.insert(i)
    }
    for i in string2 {
        set2.insert(i)
    }
    for i in set1 {
        for j in set2 {
            if i == j {
                return true
            }
        }
    }
    return false
}

var answer = two(string1: "hello", string2: "orange")

func areLettersIdentical(string1: String, string2: String) -> Bool {
    let first = string1.sorted()
    let second = string2.sorted()
    return first ==  second
}

answer = two(string1: "hello", string2: "olleh")

// you can still use return without ->

func getUser() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let user = getUser()
print("Name : \(user.0) \(user.1)")

func rollDice(sides: Int, count: Int) -> [Int] {
    var rolls = [Int]()
    
    for _ in 1...count {
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }
    return rolls
}

let rolls = rollDice(sides: 6, count: 4) // <- Very easy to understand

// Must repeat this lesson tomorrow
// This one is very content rich
