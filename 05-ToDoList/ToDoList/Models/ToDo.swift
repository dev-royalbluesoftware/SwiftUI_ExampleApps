//
//
// ToDoList
// ToDo.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
// 

import Foundation
import SwiftData

@MainActor
@Model
class ToDo: Identifiable {
    var item: String = ""
    var reminderIsOn = false
    var dueDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    var notes = ""
    var isCompleted = false
    
    init(item: String = "", reminderIsOn: Bool = false, dueDate: Foundation.Date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!, notes: String = "", isCompleted: Bool = false) {
        self.item = item
        self.reminderIsOn = reminderIsOn
        self.dueDate = dueDate
        self.notes = notes
        self.isCompleted = isCompleted
    }
}

extension ToDo {
    
    // MARK: - Mock Data
    
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        // add mock data
        container.mainContext.insert(ToDo(item: "Macedonian Educators Talk", reminderIsOn: true, dueDate: Date.now + 60*60*44, notes: "They want to learn about entrepreneurship", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Create SwiftData Lessons", reminderIsOn: true, dueDate: Date.now + 60*60*24, notes: "Now with iOS 16 & Xcode 18", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Prepare old iPhone for repair", reminderIsOn: true, dueDate: Date.now + 60*60*12, notes: "May have to buy a new one", isCompleted: false))
        container.mainContext.insert(ToDo(item: "Post flyers for Swift in Santiago", reminderIsOn: true, dueDate: Date.now + 60*60*72, notes: "To be held at UAH Chile", isCompleted: false))
        
        return container
    }
}
