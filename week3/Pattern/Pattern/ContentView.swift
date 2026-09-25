//
//  ContentView.swift
//  Pattern
//
//  Created by uurdmandakh munkhbayar on 2026.09.24.
//

import SwiftUI

let ncell = 10.0
var loc = CGPoint.zero;
var nsize: CGSize = .zero;
struct PathData {
    var path: Path;
    var color: Color;
}

struct Canvas10print: View {
    var lineWidth = 10.0
    @State var colorSpecs = [Color.mint, Color.yellow, Color.teal, Color.blue, Color.cyan]
    
    var body: some View {
        Canvas { context, size in
            nsize = CGSize(width: size.width/ncell, height: size.height/ncell)
            
            loc = .zero
            var paths: [PathData] = []
            
            while loc.y < size.height {
                let path = randomSlash(loc);
                let color = colorSpecs.randomElement()!
                paths.append(PathData(path: path, color: color));
                
                loc.x += nsize.width;
                if loc.x > size.width {
                    loc.x = 0;
                    loc.y += nsize.height;
                }
            }
            
            for p in paths {
                let style = StrokeStyle(lineWidth: lineWidth, lineCap: .round);
                context.stroke(p.path, with: .color(p.color), style: style)
            }
        }
    }
}

struct Canvas10print__: View {
    var lineWidth = 10.0
    @State var colorSpecs = [Color.mint, Color.yellow, Color.teal, Color.blue, Color.cyan]
    
    var body: some View {
        Canvas { context, size in
            nsize = CGSize(width: size.width/ncell, height: size.height/ncell)
            
            loc = .zero
            var paths: [PathData] = []
            
            while loc.y < size.height {
                let path = randomSlash__(loc);
                let color = colorSpecs.randomElement()!
                paths.append(PathData(path: path, color: color));
                
                loc.x += nsize.width;
                if loc.x > size.width {
                    loc.x = 0;
                    loc.y += nsize.height;
                }
            }
            
            for p in paths {
                let style = StrokeStyle(lineWidth: lineWidth, lineCap: .round);
                context.stroke(p.path, with: .color(p.color), style: style)
            }
        }
    }
}


struct ContentView: View {
    let patterns = ["10print \\ /", "10print - |"]
    @State private var selectedPattern = "10print \\ /"
    @State private var lineWidth = 10.0
    @State private var drawCount = 0
    var body: some View {
        NavigationStack {
            VStack{
                Form {
                    Picker("Select what you want to see", selection: $selectedPattern) {
                        ForEach(patterns, id: \.self) {
                            Text($0)
                        }
                    }
                }
                .frame(height: 100)
                .navigationTitle("Select a Student")
                if selectedPattern == "10print \\ /" {
                    Canvas10print(lineWidth: lineWidth)
                        .id(drawCount)
                }
                if selectedPattern == "10print - |" {
                    Canvas10print__(lineWidth: lineWidth)
                        .id(drawCount)
                }
                Slider(value: $lineWidth, in: 1...30)
                Button("Again") {
                    drawCount += 1
                }
                .padding()
            }
        }
    }
}

func randomSlash(_ p: CGPoint) -> Path {
    var path = Path()
    let x = loc.x;
    let y = loc.y;
    let xlen = nsize.width;
    let ylen = nsize.height;
    if Bool.random() {
        path.move(to: CGPoint(x: x, y: y))
        path.addLine(to: CGPoint(x: x+xlen, y: y+ylen))
    }
    else {
        path.move(to: CGPoint(x:x+xlen, y:y))
        path.addLine(to: CGPoint(x: x, y: y+ylen))
    }
    return path;
}

func randomSlash__(_ p: CGPoint) -> Path {
    var path = Path()
    let x = loc.x;
    let y = loc.y;
    let xlen = nsize.width;
    let ylen = nsize.height;
    if Bool.random() {
        path.move(to: CGPoint(x: x, y: y + ylen/2))
        path.addLine(to: CGPoint(x: x + xlen, y: y + ylen/2))
    }
    else {
        path.move(to: CGPoint(x: x + xlen/2, y: y))
        path.addLine(to: CGPoint(x: x + xlen/2, y: y + ylen))
    }
    return path;
}

#Preview {
    ContentView()
}

// Canvas10print is based on https://github.com/molab-itp/03-Canvas-Explore
// sider was from Page7 of https://github.com/molab-itp/03-ImageUiDemo-1-symbols
