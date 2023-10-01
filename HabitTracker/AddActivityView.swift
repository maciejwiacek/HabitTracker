//
//  AddActivityView.swift
//  HabitTracker
//
//  Created by Maciej Wiącek on 28/09/2023.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var activities: Activities
    
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                TextField("Description", text: $description, axis: .vertical)
                    .lineLimit(4, reservesSpace: true)
            }
            .navigationTitle("Add activity")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button {
                    let item = ActivityItem(name: name, description: description, completionCount: 0)
                    activities.items.append(item)
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

#Preview {
    AddActivityView(activities: Activities())
}
