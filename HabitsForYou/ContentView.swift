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
                    NavigationLink {
                        HabitDetail(habitItem: habit, habits: habits)
                    } label : {
                        Text(habit.title)
                    }
                   
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


struct HabitDetail: View {
    
    var habitItem: HabitItem
    @ObservedObject var habits: Habits


    @State private var timesDone = 0
    
    var body: some View {
        
        Section {
            List  {
                
                HStack{
                    VStack() {
                        Text("Title")
                            .font(.headline)
                        
                    }
                    Spacer()
                    Text(habitItem.title)
                    
                }
                HStack  {
                    VStack(alignment: .leading){
                        Text("Description")
                            .font(.headline)
                    }
                    Spacer()
                    Text(habitItem.description)

                }
                
                HStack  {
                    VStack {
                        Button("Add Completion") {
                            timesDone += 1
                            var habitsCopy = habitItem
                            habitsCopy.completionAmount = timesDone
                            if let i = habits.habits.firstIndex(of: habitItem) {
                                habits.habits[i] = habitsCopy
                            }
                            
                        }
                    }
                    
                    TextField("Times done", value: $timesDone, format: .number)
                        .multilineTextAlignment(.trailing)
                }
              
                
                
            }
            .navigationTitle("Habit Details")
            .onAppear {
                timesDone = habitItem.completionAmount
                
            }
            
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
