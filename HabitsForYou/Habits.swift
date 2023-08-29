//
//  Habits.swift
//  HabitTracking
//
//  Created by Eugene on 29/08/2023.
//

import Foundation

class Habits: ObservableObject {
    @Published var habits = [HabitItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "habits") {
            if let decodedItems = try? JSONDecoder().decode([HabitItem].self, from: savedHabits) {
                habits = decodedItems
                return
            }
        }
        
        habits = []
    }
    
    
}
