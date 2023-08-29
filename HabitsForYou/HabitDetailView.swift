//
//  HabitDetail.swift
//  HabitsForYou
//
//  Created by Eugene on 29/08/2023.
//

import SwiftUI

struct HabitDetailView: View {
    
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
struct HabitDetailView_Previews: PreviewProvider {
    
    var habits = Habits()
    
    static var previews: some View {
        HabitDetailView(habitItem: Habits().habits[0], habits: Habits())
    }
}
