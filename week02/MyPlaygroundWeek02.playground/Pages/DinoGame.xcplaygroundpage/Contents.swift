//: [Previous](@previous)

import Foundation

let dino1 = [
    "           ____   ",
    "          | @  ]  ",
    "   ,    ,;| ,==   ",
    "   \\‘- ‘    |''   ",
    "    \\   ,^,/      ",
    "      ^^  ^^      ",
    "                  "
]

let dino2 = [
    "                  ",
    "           ____   ",
    "          | @  ]  ",
    "   ,    ,;| ,==   ",
    "   \\‘- ‘    |''   ",
    "    \\   ,^,/      ",
    "      ^^  ^^      "
]

let cactus1 = [
    "                  ",
    "                  ",
    "                  ",
    "          _       ",
    "      _ \\| |      ",
    "    \\| | | |      ",
    "     | | | |/     "
]

let cactus2 = [
    "                  ",
    "                  ",
    "                  ",
    "     _  _         ",
    "    \\ \\| |        ",
    "      -| | _      ",
    "       | |//      "
]

let cactus3 = [
    "                   ",
    "                   ",
    "                   ",
    "        _  _       ",
    "       | |/ /      ",
    "     \\ | | /       ",
    "      -| |         "
]

let bird1 = [
    "                   ",
    "                   ",
    "          /        ",
    "        <<  -<     ",
    "          \\        ",
    "                   ",
    "                   "
]

let bird2 = [
    "                   ",
    "          /        ",
    "        <<  -<     ",
    "          \\        ",
    "                   ",
    "                   ",
    "                   "
]

let bird3 = [
    "          /        ",
    "        <<  -<     ",
    "          \\        ",
    "                   ",
    "                   ",
    "                   ",
    "                   "
]

let stars = [
    "          +              ,                          .                                                          ,          ",
    "                                     .                             *              x             .      ^ -             *  ",
    "      ,                                     +                                                          \\  \\               ",
    "                       *                                ,                                     *         |  |     +        ",
    "               .                        .                                    ,        .                /  /               ",
    "                                                                                                      '-             .    "
]
var lastOrder = [2, 7, 4, 5, 6, 3]
lastOrder.shuffle() // <- googled how to shuffle
lastOrder = [0] + lastOrder
for k in 1...60{
    for _ in 1...10 {
        print()
    }
    for i in stars {
        print(i)
    }
    let allShapes = [dino1, dino2, cactus1, cactus2, cactus3, bird1, bird2, bird3]
    
    var newOrder = [lastOrder[2], lastOrder[3], lastOrder[4], lastOrder[5]]
    var randomNum = Int.random(in: 2...7)
    if k % 2 == 0 {
        newOrder = [0, newOrder[0], newOrder[1], newOrder[2], newOrder[3], randomNum]
    }
    else{
        newOrder = [1, newOrder[0], newOrder[1], newOrder[2], newOrder[3], randomNum]
    }

    for i in 0...6{
        for n in newOrder {
            print(allShapes[n][i], terminator: "")
        }
        print()
    }
    lastOrder = newOrder
    for _ in 1...3 {
        print()
    }
    Thread.sleep(forTimeInterval: 1) // <- googled how to wait
}
