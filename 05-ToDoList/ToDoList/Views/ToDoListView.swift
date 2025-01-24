//
//
// ToDoList
// ToDoListView.swift
//
// Created by rbs-dev
// Copyright © Royal Blue Software
//


import SwiftUI
import SwiftData

struct ToDoListView: View {
    // MARK: - Properties
    
    @State private var sheetIsPresented = false
    @State var sortSelection: SortOption = .asEntered
    
    var body: some View {
        NavigationStack {
            SortedToDoListView(sortSelection: sortSelection)
                .navigationTitle("To-Do List")
                .sheet(isPresented: $sheetIsPresented) {
                    NavigationStack {
                        DetailView(toDo: ToDo())
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            sheetIsPresented.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    
                    ToolbarItem(placement: .bottomBar) {
                        Picker("", selection: $sortSelection) {
                            ForEach(SortOption.allCases, id:\.self) { sortOrder in
                                Text(sortOrder.rawValue)
                            }
                        }
                        .pickerStyle(.segmented)
                    }
                }
        }
    }
}

#Preview {
    ToDoListView()
        .modelContainer(ToDo.preview)
}
