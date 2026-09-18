//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

for i in 1...5 {
    for j in 1...i {
        print("🌟", terminator: "")
    }
    print()
}
var a = 0
for i in 1...5 {
    a = 5 - i
    for j in 1...a {
        print("🌟", terminator: "")
    }
    print()
}
