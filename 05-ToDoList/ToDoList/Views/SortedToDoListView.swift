//
//
// ToDoList
// SortedToDoListView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//


import SwiftUI
import SwiftData

struct SortedToDoListView: View {
    
    // MARK: - SwiftData
    
    @Query var toDos : [ToDo]
    
    // MARK: - Properties
    
    @Environment(\.modelContext) var modelContext
    let sortSelection: SortOption
    
    // MARK: - Initializer
    
    init(sortSelection: SortOption) {
        self.sortSelection = sortSelection
        
        switch sortSelection {
        case .asEntered:
            _toDos = Query()
            
        case .alphabetically:
            _toDos = Query(sort: \.item)
            
        case .chronologically:
            _toDos = Query(sort: \.dueDate)
            
        case .completed:
            _toDos = Query(filter: #Predicate {$0.isCompleted == false})
        }
    }
    
    var body: some View {
        List {
            ForEach(toDos) { toDo in
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDo.isCompleted.toggle()
                                guard let _ = try? modelContext.save() else {
                                    print("ERROR: Failed to save after toggle")
                                    return
                                }
                            }
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                    }
                    .font(.title2)
                    
                    HStack {
                        Text(toDo.dueDate.formatted(date: .abbreviated, time: .shortened))
                            .foregroundStyle(.secondary)
                        
                        if toDo.reminderIsOn {
                            Image(systemName: "calendar.badge.clock")
                                .symbolRenderingMode(.multicolor)
                        }
                    }
                }
            }
            .onDelete { indexSet in
                indexSet.forEach({modelContext.delete(toDos[$0])})
                guard let _ = try? modelContext.save() else {
                    print("ERROR: Failed to save after delete")
                    return
                }
            }
        }
        .listStyle(.plain)
    }
}
