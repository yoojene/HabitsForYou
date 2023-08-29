//
//  HabitItem.swift
//  HabitTracking
//
//  Created by Eugene on 29/08/2023.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    
}
