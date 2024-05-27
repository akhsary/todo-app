//
//  ToDoModel.swift
//  toDoList
//
//  Created by Юрий Чекан on 27.05.2024.
//

import Foundation
import SwiftData

@Model final class ToDoModel: Identifiable {
    var title: String
    var body: String
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}
