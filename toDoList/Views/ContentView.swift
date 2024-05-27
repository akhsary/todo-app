//
//  ContentView.swift
//  toDoList
//
//  Created by Юрий Чекан on 27.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "pencil.circle")
                }
            AllTasksView()
                .tabItem {
                    Image(systemName: "folder")
                }
        }
    }
}

#Preview {
    ContentView()
}
