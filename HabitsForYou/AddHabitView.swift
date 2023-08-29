//
//  AddHabitView.swift
//  HabitTracking
//
//  Created by Eugene on 29/08/2023.
//

import SwiftUI

struct AddHabitView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var habits: Habits
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                
                TextField("Description", text: $description)
               
            }
            .navigationTitle("Add Habit")
            .toolbar {
                Button("Save") {
                    
                    
                    if title != "" || description != "" {
                        let habitItem = HabitItem(title: title, description: description)
                        habits.habits.append(habitItem)
                    }
              
                    dismiss()
                } 
            }
        }

        
    }
}


struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
