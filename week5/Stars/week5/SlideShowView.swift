//
//  SlideShowView.swift
//  FourSeason
//
//  Created by uurdmandakh munkhbayar on 2026.09.28.
//


import SwiftUI


struct SlideShowView: View {
    @State var slideIndex = 0
    var body: some View {
        VStack {
            Text("Slide Show")
                .font(Font.system(size: 30, weight: .bold))
                .padding()
            let name = slides[slideIndex]
            SingleSlideView(name: name)
            HStack {
                Button(action: previousItemAction) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()
                Spacer()
                Button(action: nextItemAction) {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 40, height: 40)
                }
                .padding()
            }
        }
    }
    
    func previousItemAction() {
        if (slideIndex > 0) {
            slideIndex -= 1;
        }
    }
    func nextItemAction() {
        if (slideIndex < slides.count-1) {
            slideIndex += 1;
        }
    }
}

struct SingleSlideView: View {
    var name: String
    var body: some View {
        VStack {
            Image("winterTree")
                .resizable()
                .scaledToFit()
                .overlay {
                    LeafCanopy(season: name)
                }
            Text(name)
                .font(.largeTitle)
        }
    }
}

// got the shades of colors from AI tool
let seasonColors: [String: [Color]] = [
    "spring": [Color(red: 1.00, green: 0.78, blue: 0.84),   // light pink
               Color(red: 0.96, green: 0.52, blue: 0.70),   // pink
               Color(red: 0.85, green: 0.30, blue: 0.55)],  // deep pink
    "summer": [Color(red: 0.60, green: 0.82, blue: 0.38),   // light green
               Color("green"),   // green
               Color(red: 0.10, green: 0.40, blue: 0.16)],  // dark green
    "autumn": [Color(red: 1.00, green: 0.72, blue: 0.20),   // golden orange
               Color(red: 0.96, green: 0.50, blue: 0.10),   // orange
               Color(red: 0.80, green: 0.28, blue: 0.05)],  // burnt orange
]

let ncell = 35.0
var loc = CGPoint.zero
var nsize: CGSize = .zero

struct PathData {
    var path: Path
    var colorPick: Int
}

// Makes sure the leaves are the same
var leafPaths: [PathData] = []

struct LeafCanopy: View {
    var season: String

    var body: some View {
        Canvas { context, size in
            // Checks if there's a color, so winter doesn't get leaves
            if let colorSpecs = seasonColors[season] {

                if leafPaths.count == 0 {
                    nsize = CGSize(width: size.width/ncell, height: size.height/ncell)

                    while leafPaths.count < 900 {
                        // random spot instead of a grid
                        loc = CGPoint(x: Double.random(in: 0...size.width),
                                      y: Double.random(in: 0...size.height))
                        if isInsideTree(loc, size) {
                            let path = randomSlash(loc)
                            let colorPick = Int.random(in: 0...2)
                            leafPaths.append(PathData(path: path, colorPick: colorPick))
                        }
                    }
                }

                for p in leafPaths {
                    let style = StrokeStyle(lineWidth: 8, lineCap: .round)
                    context.stroke(p.path, with: .color(colorSpecs[p.colorPick]), style: style)
                }
            }
        }
    }
}

func randomSlash(_ p: CGPoint) -> Path {
    var path = Path()
    let x = loc.x
    let y = loc.y
    let xlen = Double.random(in: -nsize.width...nsize.width)
    let ylen = Double.random(in: -nsize.height...nsize.height)
    path.move(to: CGPoint(x: x, y: y))
    path.addLine(to: CGPoint(x: x+xlen, y: y+ylen))
    return path
}

// Round on top, flat at the bottom
func isInsideTree(_ p: CGPoint, _ size: CGSize) -> Bool {
    let dx = (p.x - size.width * 0.52) / (size.width * 0.42)
    let dy = (p.y - size.height * 0.68) / (size.height * 0.66)
    return dy <= 0 && dx*dx + dy*dy <= 1 // if it's >1 then it's past the edge
}

#Preview {
  SlideShowView()
}
