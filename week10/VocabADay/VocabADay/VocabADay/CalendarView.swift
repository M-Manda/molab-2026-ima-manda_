//
//  CalendarView.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

// calendar source: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-date-picker-and-read-values-from-it
// picture gried learned from: https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid

import SwiftUI

struct CalendarView: View {
    @Environment(VocabDocument.self) var document
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    @State private var today = Date.now
    let day = Calendar.current.range(of: .day, in: .month, for: date)
    let data = (1...day).map { "Item \($0)" }
    let firstDay = Calendar.current.dateInterval(of: .month, for: date)?.start
    let blankDay = Calendar.current.component(.weekday, from: firstDay)
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    var body: some View {
        VStack {
            DatePicker(
                selection: $today,
                in: ...Date.now,
                displayedComponents: .date
            ) {
                Text("Select a date")
            }
            .datePickerStyle(GraphicalDatePickerStyle())
            .frame(maxHeight: 400)
            Text("Date is \(today, formatter: dateFormatter)")

            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(data, id: \.self) {_ in
                        Text(Calendar.current.date(byAdding: .day, value: n, to: firstDay))
                    }
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: 300)
        }
    }
}

#Preview {
    CalendarView()
        .environment(VocabDocument())
}

