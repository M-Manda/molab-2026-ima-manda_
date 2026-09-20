//
//  ContentView.swift
//  IMA-week3-demo
//
//  Created by uurdmandakh munkhbayar on 2026.09.18.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    var body: some View {
        VStack {
            Text("count \(count)")
                .font(.system(size: 40, weight: .light, design: .serif))
                    .italic()
            switch count {
            case 0 :
                Image(systemName: "globe")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case 1:
                Image(systemName: "fish")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case 2 :
                Image(systemName: "apple.logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            default: Text("")
            }
//            Image(systemName: count == 0 ? "apple.logo" : "fish")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .foregroundStyle(.tint)
//            if count > 2 {
//                HStack {
//                    Image(systemName: "globe")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundStyle(
//                            .linearGradient(
//                                colors: [.yellow, .blue],
//                                startPoint: .top,
//                                endPoint: .bottom
//                            )
//                        )
//                    Image(systemName: "dog")
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .foregroundStyle(.tint)
//                }
//            }
            Spacer()
            Text("Hello, world!")
                .font(.system(size: 80, weight: .light, design: .serif))
                    .italic()
            Spacer()
            HStack {
                Button("<"){
                    count = (count - 1) % 3
                    print("I'm tapped up")
                }
                .font(.system(size: 50))
                .buttonStyle(.bordered)
                .foregroundStyle(
                    .linearGradient(
                        colors: [.blue, .pink],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                Button(">"){
                    count = (count + 1) % 3
                    print("I'm tapped down")
                }
                .font(.system(size: 50))
                .buttonStyle(.bordered)
                .foregroundStyle(
                    .linearGradient(
                        colors: [.blue, .pink],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }

        }
        .padding()
    }
}

#Preview {
    ContentView()
}


// modifier
// property wrapper - keep state seperate from view and manage state
// sf symbol
// enum
