//
//  ContentView.swift
//  WeSplit
//
//  Created by uurdmandakh munkhbayar on 2026.09.24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentates: [Int] = [10, 15, 20, 25, 0]
    
    var totalPerPerson: [Double] {
        let poeoleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / poeoleCount
        return [amountPerPerson, grandTotal]
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How mych do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentates, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                }
                .pickerStyle(.segmented)
                
                Section("Total amount:") {
                    Text(totalPerPerson[1], format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("One person owes:") {
                    Text(totalPerPerson[0], format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSlit")
            .toolbar {
                if amountIsFocused{
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
// Following is day 16
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//struct ContentView: View {
//    let students = ["Harry", "Hermione", "Ron"]
//    @State private var selectedStudent = "Harry"
//    @State private var name = ""
//    @State var tapCount = 0
//    var body: some View {
//        NavigationStack {
//            Form {
//                Picker("Slect your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
//            .navigationTitle("Select a Student")
//        }
//        Form {
//            ForEach(0..<100) {
//                Text("Row \($0)")
//            }
//        }
//        Form {
//            TextField("Enter your name", text: $name) // $name is two way
//            Text("Your name is \(name)") // name is one way
//        }
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
//        NavigationStack {
//            Form{ // gives list of data
//                Section {
//                    Text("Hello, World!")
//                }
//                Section {
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                }
//                //
//                Section {
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                    Text("Hello, World!")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//#Preview { // gives the phone here ->
//    ContentView()
//}
