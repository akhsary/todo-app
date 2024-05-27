//
//  toDoListApp.swift
//  toDoList
//
//  Created by Юрий Чекан on 27.05.2024.
//

import SwiftUI
import SwiftData

@main
struct toDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDoModel.self)
    }
}
