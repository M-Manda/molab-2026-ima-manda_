//
//  RemindersListViewModel.swift
//  MakeItSo-Manda
//
//  Created by uurdmandakh munkhbayar on 2026.11.06.
//

import Foundation
import Combine

class RemindersListViewModel: ObservableObject {
  @Published
  var reminders = Reminder.samples

  func addReminder(_ reminder: Reminder) {
    reminders.append(reminder)
  }

  func toggleCompleted(_ reminder: Reminder) {
    if let index = reminders.firstIndex(where: { $0.id == reminder.id} ) {
      reminders[index].isCompleted.toggle()
    }
  }
}

