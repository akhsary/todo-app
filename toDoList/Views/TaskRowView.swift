//
//  TaskRowView.swift
//  toDoList
//
//  Created by Юрий Чекан on 27.05.2024.
//

import SwiftUI

struct TaskRowView: View {
    @Environment (\.modelContext) private var modelContext
    var toDo: ToDoModel
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.yellow)
            VStack(alignment: .leading) {
                Text(toDo.title)
                    .fontWeight(.semibold)
                
                Text(toDo.body)
                
                Button {
                    modelContext.delete(toDo)
                } label: {
                    Image(systemName:"xmark.bin.fill")
                }
            }
            .padding()
        }
        .frame(height: 300)
        .padding()
    }
}

//#Preview {
//    TaskRowView(toDo: )
//}

