//
//  ContentView.swift
//  HabitTracking
//
//  Created by Eugene on 29/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var habits = Habits()
    
    @State private var showAddHabit = false
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(habits.habits) { habit in
                    Text(habit.title)
                }
                .onDelete(perform: removeRows)
            }
            .navigationTitle("Habits 4 U")
            .toolbar {
                if habits.habits.count > 0 {
                    EditButton()
                }
                Button {
                    showAddHabit.toggle()
                    
                } label : {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddHabit) {
                AddHabitView(habits: habits)
            }
            
        }

    }
    func removeRows(at offsets: IndexSet) {
        habits.habits.remove(atOffsets: offsets)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
