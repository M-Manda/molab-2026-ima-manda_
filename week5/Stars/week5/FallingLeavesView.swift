//
//  UnderTheSeaView.swift
//  FourSeason
//
//  Created by uurdmandakh munkhbayar on 2026.09.28.
//

import SwiftUI
import Combine

struct FallingLeaf {
    var path: Path
    var colorPick: Int
    var ground: Double
    var drop = 0.0
    var falling = false
}

var fallingLeaves: [FallingLeaf] = []
var sway = 0.0

struct FallingLeavesView: View {
    @State var tick = 0
    // Timer gets called about 30 times a second
    let timer = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()

    @Environment(AudioDJ.self) var audioDJ

    var body: some View {
        VStack {
            Text("Falling Leaves")
                .font(Font.system(size: 30, weight: .bold))
                .padding()
                .buttonStyle(.bordered)
                .foregroundStyle(
                .linearGradient(
                    colors: [.yellow, .red],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            Image("winterTree")
                .resizable()
                .scaledToFit()
                .overlay {
                    Canvas { context, size in
                        let colorSpecs = seasonColors["autumn"]!

                        if fallingLeaves.count == 0 {
                            nsize = CGSize(width: size.width/ncell, height: size.height/ncell)

                            while fallingLeaves.count < 900 {
                                loc = CGPoint(x: Double.random(in: 0...size.width),
                                              y: Double.random(in: 0...size.height))
                                if isInsideTree(loc, size) {
                                    let path = randomSlash(loc)
                                    let colorPick = Int.random(in: 0...2)
                                    let ground = size.height * Double.random(in: 0.9...0.97) - loc.y
                                    fallingLeaves.append(FallingLeaf(path: path, colorPick: colorPick, ground: ground))
                                }
                            }
                        }

                        for leaf in fallingLeaves {
                            let path = leaf.path.offsetBy(dx: 0, dy: leaf.drop) // Asked AI how to move down the leaves
                            let style = StrokeStyle(lineWidth: 8, lineCap: .round)
                            context.stroke(path, with: .color(colorSpecs[leaf.colorPick]), style: style)
                        }
                    }
                    .id(tick)
                }
            Button("Again") {
                fallingLeaves = []
            }
            .padding()
        }
        .onReceive(timer) { _ in
            dropLeaves()
            tick += 1
        }
        .onAppear() {
            audioDJ.choose(2)
            audioDJ.play()
        }
        .onDisappear() {
            audioDJ.stop()
        }
    }

    func dropLeaves() {
        if fallingLeaves.count > 0 {
            let i = Int.random(in: 0..<fallingLeaves.count)
            if fallingLeaves[i].drop == 0 {
                fallingLeaves[i].falling = true
            }
        }

        // Move the falling leaves down
        for i in fallingLeaves.indices {
            if fallingLeaves[i].falling {
                fallingLeaves[i].drop += 3
                if fallingLeaves[i].drop >= fallingLeaves[i].ground {
                    fallingLeaves[i].drop = fallingLeaves[i].ground
                    fallingLeaves[i].falling = false
                }
            }
        }
    }
}

#Preview {
    FallingLeavesView()
        .environment(AudioDJ())
}
