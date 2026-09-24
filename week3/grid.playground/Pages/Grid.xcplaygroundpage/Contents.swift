// create 8x8 random ascii art using gradient emoji
import Foundation

// inspired by:
// https://github.com/wl3512-lab/molab-2026-ima-wl3512-lab
let palette = "░▒▓█"          // light -> dark, so density reads as shading
print("palette.count \(palette.count)")

//var charScreen: Array<Array<String>>
typealias Screen = [[String]]

func randomScreen() -> Screen {
  var charScreen:Screen = []
  for y in 0 ..< 8 {
    var line = [String]();
    for x in 0 ..< 8 {
      line.append(Bool.random() ? "░" : "▓");
    }
    charScreen.append(line)
  }
  return charScreen
}

func displayScreen() {
  var charScreen = randomScreen()
  for line in charScreen {
    for item in line {
      // print twice for square-ish aspect ratio
      print(item, terminator:"");
      print(item, terminator:"");
    }
    print("");
  }
}
displayScreen()

// TRY: create checkerboard
// TRY: change Screen to [String]
typealias newScreen = [String]

print("-- Checkerboard with newScreen = [String]")
func checkerboard() -> newScreen {
  var charScreen:newScreen = []
  for y in 0 ..< 8 {
    for x in 0 ..< 8 {
        if x%2 == y%2 {
            charScreen.append("░")
        }
        else {
            charScreen.append("▓")
        }
    }
  }
  return charScreen
}

func checkerDisplayScreen() {
  var charScreen = checkerboard()
    for y in 0 ..< 8 {
        for x in 0 ..< 8 {
      // print twice for square-ish aspect ratio
      print(charScreen[y*8+x], terminator:"");
      print(charScreen[y*8+x], terminator:"");
    }
    print("");
  }
}
checkerDisplayScreen()

// TRY: use 8x8 bit font here render characters
//  source: https://github.com/dhepper/font8x8
