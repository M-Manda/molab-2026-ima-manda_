//
//  CalendarView.swift
//  VocabADay
//
//  Created by uurdmandakh munkhbayar on 2026.11.11.
//

// calendar source: https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-a-date-picker-and-read-values-from-it
// picture gried learned from: https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid
// DatePicker, .graphical style: https://developer.apple.com/documentation/swiftui/datepicker

import SwiftUI

struct CalendarView: View {
    @Environment(VocabDocument.self) var document
    @State private var selectedDate = Date.now // the tapped day. Its month is the month we show

    let calendar = Calendar.current
    let columns = [
        GridItem(.flexible()), // GridItem = one column or row in a grid
        GridItem(.flexible()), // .flexible() = can expand or srhink to share available space
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ] // 7 columns = 7 weekdays

    var body: some View {
        let monthStart = calendar.dateInterval(of: .month, for: selectedDate)!.start // first moment of the selected month
        let dayCount = calendar.range(of: .day, in: .month, for: selectedDate)!.count // calculating number of days
        let blanks = calendar.component(.weekday, from: monthStart) - 1 // calculating emtpy cells before day 1

        VStack {
            HStack { // < December 2026 >
                Button("<") { selectedDate = calendar.date(byAdding: .month, value: -1, to: selectedDate)! }
                // byAdding = tellc the calendar to add or subtract a date component
                // .month = the component is month
                // value: -1 = subtract one month
                // to: start from the currently selected date
                Spacer()
                Text(selectedDate.formatted(.dateTime.month(.wide).year())).font(.title2).bold()
                Spacer()
                Button(">") { selectedDate = calendar.date(byAdding: .month, value: 1, to: selectedDate)! }
            }

            LazyVGrid(columns: columns) {
                ForEach(calendar.shortWeekdaySymbols, id: \.self) { name in
                    Text(name).font(.caption).foregroundStyle(.gray)
                }
                ForEach(-blanks..<dayCount, id: \.self) { n in // -2, -1, 0, 1, ... 30
                    if n < 0 {
                        Color.clear // blank cell before day 1
                    } else {
                        let day = calendar.date(byAdding: .day, value: n, to: monthStart)! // Dec 1 + n
                        Color.green.opacity(0.15)
                            .frame(height: 44)
                            .overlay { document.imageFor(date: day)?.resizable().scaledToFill() } // thumbnail, if there is one
                            .overlay { Text("\(n + 1)").bold().foregroundStyle(.white).shadow(radius: 2) } // day number
                            .clipped() // cut off the part of the photo outside the square
                            .onTapGesture { selectedDate = day }
                    }
                }
            }

            // big photo of the tapped day
            if let image = document.imageFor(date: selectedDate) {
                image.resizable().scaledToFit().frame(maxHeight: 300)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Calendar")
    }
}

#Preview {
    NavigationStack {
        CalendarView()
            .environment(VocabDocument())
    }
}
