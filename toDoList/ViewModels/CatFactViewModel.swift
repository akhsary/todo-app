//
//  CatFactViewModel.swift
//  toDoList
//
//  Created by Юрий Чекан on 27.05.2024.
//

import Foundation
import SwiftUI

@Observable class CatFactViewModel {
    var catFactService = CatFactService()
    var fact: String?
    var error: String?
    
    
    
    func loadFact() async throws {
        let result = try await catFactService.fetchCatFuct()
            switch result {
            case .success(let success):
                print("DEBUG: Sucsess")
                self.fact = success
            case .failure(let failure):
                self.error = failure.localizedDescription
            }
    }
    
    init(){
        Task {
            try await loadFact()
        }
    }
}
