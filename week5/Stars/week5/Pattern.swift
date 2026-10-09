//
//  Pattern.swift
//  Stars
//
//  Created by uurdmandakh munkhbayar on 2026.10.07.
//

import SwiftUI

let nncell = 10.0
var lloc = CGPoint.zero;
var nnsize: CGSize = .zero;
struct PPathData {
    var path: Path;
    var color: Color;
}

struct Canvas10print: View {
    var lineWidth = 10.0
    @State var colorSpecs = [Color.mint, Color.yellow, Color.teal, Color.blue, Color.cyan]
    
    var body: some View {
        Canvas { context, size in
            nnsize = CGSize(width: size.width/nncell, height: size.height/nncell)
            
            lloc = .zero
            var paths: [PPathData] = []
            
            while lloc.y < size.height {
                let path = rrandomSlash(lloc);
                let color = colorSpecs.randomElement()!
                paths.append(PPathData(path: path, color: color));
                
                lloc.x += nnsize.width;
                if lloc.x > size.width {
                    lloc.x = 0;
                    lloc.y += nnsize.height;
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
            nnsize = CGSize(width: size.width/nncell, height: size.height/nncell)
            
            lloc = .zero
            var paths: [PPathData] = []
            
            while lloc.y < size.height {
                let path = randomSlash__(lloc);
                let color = colorSpecs.randomElement()!
                paths.append(PPathData(path: path, color: color));
                
                lloc.x += nnsize.width;
                if lloc.x > size.width {
                    lloc.x = 0;
                    lloc.y += nnsize.height;
                }
            }
            
            for p in paths {
                let style = StrokeStyle(lineWidth: lineWidth, lineCap: .round);
                context.stroke(p.path, with: .color(p.color), style: style)
            }
        }
    }
}


struct Pattern: View {
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
                .navigationTitle("Select a Pattern")
                if selectedPattern == "10print \\ /" {
                    Canvas10print(lineWidth: lineWidth)
                        .id(drawCount)
                }
                if selectedPattern == "10print - |" {
                    Canvas10print__(lineWidth: lineWidth)
                        .id(drawCount)
                }
                Section("Slide to choose the width of the line"){
                    Slider(value: $lineWidth, in: 1...30)
                }
                Button("Again") {
                    drawCount += 1
                }
                .padding()
            }
        }
    }
}

func rrandomSlash(_ p: CGPoint) -> Path {
    var path = Path()
    let x = lloc.x;
    let y = lloc.y;
    let xlen = nnsize.width;
    let ylen = nnsize.height;
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
    let x = lloc.x;
    let y = lloc.y;
    let xlen = nnsize.width;
    let ylen = nnsize.height;
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
    Pattern()
}

// Canvas10print is based on https://github.com/molab-itp/03-Canvas-Explore
// sider was from Page7 of https://github.com/molab-itp/03-ImageUiDemo-1-symbols
// Add data structure to keep the pattern
