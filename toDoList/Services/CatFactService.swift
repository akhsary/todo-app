//
//  CatFactManager.swift
//  toDoList
//
//  Created by Юрий Чекан on 27.05.2024.
//

import Foundation

final class CatFactService {
    
    private let stringUrl = "https://catfact.ninja/fact?max_length="
    private let max_length = "300"
    
    
    func fetchCatFuct() async throws -> Result<String, APIError> {
        guard let url = URL(string: stringUrl + max_length) else { return .failure(.requestFailed(description: "Wrong URL"))}
        
        let urlRequest = URLRequest(url: url)
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse else {
                print("DEBUG: Failure1")
                return .failure(.requestFailed(description: "Request failed"))
            }
            guard httpResponse.statusCode == 200 else {
                print("DEBUG: Failure2")
                return .failure(.invalidStatusCode(statusCode: httpResponse.statusCode))
            }
            let decoder = JSONDecoder()
            guard let decodedData = try? decoder.decode(CatFactModel.self, from: data) else {
                print("DEBUG: Failure3")
                return .failure(.jsonParsingFailure)
            }
            return .success(decodedData.fact)
        }
        catch {
            print("DEBUG: Failure4")
            return .failure(.unknownError(error: error))
        }
        
    }
    
    init() {}
}
