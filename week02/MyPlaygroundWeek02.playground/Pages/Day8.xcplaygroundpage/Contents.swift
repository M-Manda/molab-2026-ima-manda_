//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

// How to provide default values for parameters

func printTimesTables(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)
printTimesTables(for: 8)

var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)
characters.removeAll()  // remove all the items, free out memory -> size empty
characters.removeAll(keepingCapacity: true) // keeps capacity
print(characters.count)

// enough to hold those 4 items and plus little bit extra so you can grow overtime

// How to handle errors in functions

enum PasswordError: Error {
    case short, obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }

    if password == "12345" {
        throw PasswordError.obvious
    }

    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

// mark errors with throws
// throws mean it can throw errors, not that it must throw errors

// no errors -> go to next chunk and work normal

//do {
//    try someRiskyWork()
//} catch {
//    print("Handle errors here")
//}

let string = "12345"

do {
    let result = try checkPassword(string) // try means it might stop here
    print("Password rating: \(result)") // success
} catch PasswordError.short {               // handle every kind of error
    print("Please use a longer password.") // error
} catch PasswordError.obvious {
    print("I have the same combination on my luggage!")
} catch {
    print("There was an error.")
}

// try! is very rare
