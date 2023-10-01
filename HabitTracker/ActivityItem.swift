//
//  ActivityItem.swift
//  HabitTracker
//
//  Created by Maciej Wiącek on 28/09/2023.
//

import Foundation

struct ActivityItem: Identifiable, Codable, Equatable {
    let id = UUID()
    let name: String
    let description: String
    var completionCount: Int
}
