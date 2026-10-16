//
//  ContentView.swift
//  Stars
//
//  Created by uurdmandakh munkhbayar on 2026.10.07.
//
import SwiftUI
import Combine

struct SimonSays: View {
    @State private var sequence: [Int] = []
    @State private var step = 0 // which item in the sequence we're on
    @State private var lit = -1 // which circle is lit
    @State private var playing = false
    @State private var tappedSequence: [Int] = []
    
    // Ticks every half second
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            Text("Tap in reversed order")
                .font(.largeTitle)
            Spacer()
            HStack {
                SimonCircle(color: .green, isLit: lit == 0, tap: 0, tappedSequence: $tappedSequence)
                SimonCircle(color: .red, isLit: lit == 1, tap: 1, tappedSequence: $tappedSequence)
            }
            HStack {
                SimonCircle(color: .yellow, isLit: lit == 2, tap: 2, tappedSequence: $tappedSequence)
                SimonCircle(color: .blue, isLit: lit == 3, tap: 3, tappedSequence: $tappedSequence)
            }
            if !playing && sequence.count > 0 && tappedSequence.count == sequence.count {
                if tappedSequence == sequence.reversed() {
                    Text("Correct!")
                        .font(.largeTitle)
                        .foregroundColor(.green)
                } else {
                    Text("Incorrect")
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
            }
            else if !playing && sequence.count > 0 && tappedSequence.count > sequence.count {
                Text("Incorrect")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            
            
            Spacer()
            PlayResetButton(animating: $playing) {
                // Reset everything
                tappedSequence = []
                step = 0
                lit = -1
                sequence = []
                
                if playing {
                    for _ in 1...5 {
                        sequence.append(Int.random(in: 0...3))
                    }
                    print("sequence", sequence)
                }
            }
        }
        .onReceive(timer) { _ in
            if playing {
                withAnimation(.easeInOut) {
                    if lit == -1 {
                        // Nothing lit: light up the next circle
                        lit = sequence[step]
                    } else {
                        // Something lit: turn it off and move to the next one
                        lit = -1
                        step += 1
                        if step == sequence.count {
                            playing = false
                            tappedSequence = []   // ignore taps made during the show
                        }
                    }
                }
            }
        }
    }
}


struct SimonCircle: View {
    var color: Color
    var isLit: Bool = false
    var tap: Int
    @Binding var tappedSequence: [Int] // googled Binding
    var action: () -> Void = { }
    
    var body: some View {
        Button {
            print("\(color) tapped")
            tappedSequence.append(tap)
            action()
        } label: {
            Circle()
                .fill(color)
                .frame(width: 160, height: 160)
                .scaleEffect(isLit ? 1.1 : 1.0)
                .shadow(color: isLit ? color : .white, radius: 20)
        }
    }
}
// button is from 05-Heart-Shapes
struct ShapesButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(minWidth: 125, minHeight: 60)
            .background(Color.blue.opacity(0.15))
            .foregroundColor(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding(.bottom, 30)
    }
}

struct PlayResetButton: View {
    @Binding var animating: Bool
    
    var resetOnly : Bool = false
    var action: () -> Void = { }
    var body: some View {
        Button() {
            animating.toggle()
            action()
        } label: {
            if resetOnly {
                Label("Reset", systemImage: "arrow.counterclockwise")
            } else {
                Label(animating ? "Reset": "Play", systemImage: animating ? "arrow.counterclockwise" : "play.fill")
            }
            
        }
        .buttonStyle(ShapesButton())
        
    }
}


#Preview {
    SimonSays()
}

// There's graph library for swiftui

//UU ID For example: "id": "EDCD038C-036F-4C40-826F-61C88CD84DDD"
// Object observable
// codable - it can be incoded and decoded - you don't have to do this
