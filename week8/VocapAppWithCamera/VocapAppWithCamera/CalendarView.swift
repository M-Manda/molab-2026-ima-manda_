//
//  CalendarView.swift
//  week7
//
//  Created by uurdmandakh munkhbayar on 2026.10.19.
//

import SwiftUI

struct CalendarView: View {
    @Environment(VocabDocument.self) var document

    var body: some View {
        VStack {
            Text("The calendar is coming soon..")
                .font(.title2)
                .bold()
            Text("I hope~~")
                .font(.title2)
                .bold()
            Text("For now, here's today's picture. Enjoy ^-^")

            Spacer()

            if let pickedImage = document.imageFor(date: Date()) {
                pickedImage
                    .resizable()
                    .scaledToFit()
                    .overlay { dayLabels() }
                    .overlay(alignment: .bottomTrailing) { timeLabel() }
                    .frame(height: 400)
            } else {
                Rectangle()
                    .fill(Color.green.opacity(0.15))
                    .frame(height: 400)
                    .overlay {
                        Text("No picture yet")
                            .foregroundStyle(.gray)
                    }
            }

            Spacer()
        }
        .padding()
    }

    func dayLabels() -> some View {
        VStack {
            if let entry = document.model.findEntry(date: Date()) {
                Text(entry.caption)
                Text(entry.location)
            }
        }
        .font(.title2)
        .bold()
        .foregroundStyle(.white)
        .shadow(radius: 3)
    }

    @ViewBuilder
    func timeLabel() -> some View {
        if let entry = document.model.findEntry(date: Date()), entry.showTime {
            Text(entry.date.formatted(date: .omitted, time: .shortened))
                .bold()
                .foregroundStyle(.white)
                .shadow(radius: 3)
                .padding(8)
        }
    }
}

#Preview {
    CalendarView()
        .environment(VocabDocument())
}
