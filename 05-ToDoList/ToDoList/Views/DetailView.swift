//
//
// ToDoList
// DetailView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    // MARK: - Properties
    
    @State var toDo: ToDo
    @State private var item = ""
    
    @State private var reminderIsOn = true
    @State private var dueDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    @State private var notes = ""
    @State private var isCompleted = false
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Model Context
    
    @Environment(\.modelContext) var modelContext
    
    
    var body: some View {
        List {
            TextField("Enter ToDo here...", text: $item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date", selection: $dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!reminderIsOn)
            
            Text("Notes:")
                .padding(.top)
            
            TextField("Add notes...", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed", isOn: $isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
            
        }
        .listStyle(.plain)
        .onAppear {
            item = toDo.item
            reminderIsOn = toDo.reminderIsOn
            dueDate = toDo.dueDate
            notes = toDo.notes
            isCompleted = toDo.isCompleted
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    // Add Save Code Here...
                    // move values from local variables to ToDo object
                    toDo.item = item
                    toDo.reminderIsOn = reminderIsOn
                    toDo.dueDate = dueDate
                    toDo.notes = notes
                    toDo.isCompleted = isCompleted
                    
                    // Swift Data
                    modelContext.insert(toDo)
                    guard let _ = try? modelContext.save() else {
                        print( "Failed to save changes." )
                        return
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(toDo: ToDo())
            .modelContainer(for: ToDo.self, inMemory: true)
    }
}
