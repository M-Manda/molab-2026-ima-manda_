//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// How to create and use closures

func greetUser() {
    print("Hi there!")
}

let copiedGreeting = greetUser

copiedGreeting()



let sayHello1 = {
    print("Hi there!")
}

sayHello1()



let sayHello = { (name: String) -> String in // makrs end of parameters and start of body of closure
    "Hi \(name)!"
}



var greetCopy: () -> Void = greetUser
// () is a function that accepts no parameters
// -> is return type
// Void means no value



func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)
// When copy is called, name information is lost (for)



sayHello("Taylor")



let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted() // sorted() allows us tp pass in custom sorting function
print(sortedTeam)



func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true // name1 should be before name2
    } else if name2 == "Suzanne" {
        return false // name2 should be before name1
    }

    return name1 < name2 // otherwise directly sort
}



let captainFirstTeam = team.sorted(by: captainFirstSorted)
print(captainFirstTeam)



let sayHello2 = {
    print("Hi there!")
}

sayHello2()



let captainFirstTeam1 = team.sorted(by: captainFirstSorted)



let captainFirstTeam2 = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})


// How to use trailing closures and shorthand syntax

let sorted = team.sorted { a, b in
    if a == "Suzanne" {
        return true
    } else if b == "Suzanne" {
        return false
    }

    return a < b
}

print(captainFirstTeam2)

let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }

    return $0 < $1
}
// a, b is gone and it has become $0, $1

let reverseTeam = team.sorted { $0 > $1 }
// the whole code becomes single line of code

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)
// can return different type than the input

// How to accept functions as parameters

func greetUser1() {
    print("Hi there!")
}

greetUser1()

var greetCopy1: () -> Void = greetUser1
greetCopy1()



func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)



func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("Done!")
}

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}
