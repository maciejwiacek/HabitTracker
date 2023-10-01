//
//  ContentView.swift
//  HabitTracker
//
//  Created by Maciej Wiącek on 22/09/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(activities.items) { activity in
                        NavigationLink {
                            ActivityView(activity: activity, activities: activities)
                        } label: {
                            HStack {
                                Text(activity.name)
                            }
                        }
                        .listRowBackground(Color.clear)
                        .padding(.horizontal)
                    }
                }
                .listStyle(.plain)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        showingAddExpense.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                            .frame(width: 50, height: 50)
                            .background(.blue)
                            .clipShape(Circle())
                    }
                    .padding(.horizontal, 35)
                }
            }
            .navigationTitle("Test")
            .sheet(isPresented: $showingAddExpense, content: {
                AddActivityView(activities: activities)
            })
        }
    }
}

#Preview {
    ContentView()
}
