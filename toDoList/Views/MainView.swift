//
//  ContentView.swift
//  toDoList
//
//  Created by Юрий Чекан on 27.05.2024.
//

import SwiftUI

struct MainView: View {
    private let fact = CatFactViewModel()
    
    @Environment (\.modelContext) private var modelContext
    
    @State private var textFieldTitle: String = ""
    @State private var textFieldMain: String = ""
    
    @FocusState private var isFocuced: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
                Text("New tasks?")
                    .font(.largeTitle)
                    .bold()
            Divider()
            
            Text("What'll do?")
                .fontWeight(.semibold)
            
            TextEditor(text: $textFieldTitle)
                .textFieldStyle(PlainTextFieldStyle())
                .frame(height: 30)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.leading, .trailing], 5)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 9).stroke(Color.black))
                .onSubmit() {
                    self.isFocuced = true
                }
                .onChange(of: textFieldTitle) { value in
                        if value.last == "\n" {
                            textFieldTitle = String(value.dropLast())
                        }
                    }
                
            Divider()
            
            Text("A little more detail?")
                .fontWeight(.semibold)
            
            TextEditor(text: $textFieldMain)
                .focused($isFocuced)
                .frame(height: 150)
                .textFieldStyle(PlainTextFieldStyle())
                .padding([.leading, .trailing], 5)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16)
                .stroke(Color.black))
                .onChange(of: textFieldMain) { _ in
                    if !textFieldMain.filter({ $0.isNewline }).isEmpty {
                        let newTask = ToDoModel(title: textFieldTitle, body: textFieldMain)
                        modelContext.insert(newTask)
                        textFieldTitle = ""
                        textFieldMain = ""
                    }
                }
            
            Divider()
            HStack {
                Text("Here a fact about cats: ")
                    .fontWeight(.semibold)
                
            }
            if let catFact = fact.fact {
                Text(catFact)
                    .fontWeight(.light)
            } else {
                if let error = fact.error {
                    Text(error)
                }
            }
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    MainView()
//}
