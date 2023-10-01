//
//  ActivityView.swift
//  HabitTracker
//
//  Created by Maciej Wiącek on 28/09/2023.
//

import SwiftUI

struct ActivityView: View {
    @State var activity: ActivityItem
    @ObservedObject var activities: Activities
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 30) {
                VStack(alignment: .leading) {
                    Text("Description")
                        .font(.headline.bold())
                    
                    Text(activity.description.isEmpty ? "No description" : "\(activity.description)")
                        .font(.subheadline)
                        .foregroundStyle(activity.description.isEmpty ? .gray : .primary)
                }
                
                VStack(alignment: .leading) {
                    Text("Goal completion count")
                        .font(.headline.bold())
                    
                    HStack {
                        Text("\(activity.completionCount)")
                            .font(.subheadline)
                        
                        Button {
                            if let index = activities.items.firstIndex(of: activity) {
                                var newActivity = activities.items[index]
                                newActivity.completionCount += 1
                                activities.items[index] = newActivity
                                activity = newActivity
                            } else {
                                fatalError("Something went wrong!")
                            }
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.white)
                                .frame(width: 30, height: 30)
                                .background(.black)
                                .clipShape(RoundedRectangle(cornerRadius: 3))
                        }
                    }
                }
            }
            .navigationTitle(activity.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ActivityView(activity: ActivityItem(name: "Test", description: "Some very very very very very looo ooooo oooo oong description", completionCount: 3), activities: Activities())
}
