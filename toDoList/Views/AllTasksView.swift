//
//  AllTasksView.swift
//  toDoList
//
//  Created by Юрий Чекан on 27.05.2024.
//

import SwiftUI
import SwiftData

struct AllTasksView: View {
    @Query private var tasks: [ToDoModel]
    var body: some View {
        ScrollView {
            ForEach(tasks) {task in 
                TaskRowView(toDo: task)
            }
        }
    }
}

#Preview {
    AllTasksView()
}
