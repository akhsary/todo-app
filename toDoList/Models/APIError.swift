//
//  APIError.swift
//  toDoList
//
//  Created by Юрий Чекан on 27.05.2024.
//

import Foundation

enum APIError: Error {
    case jsonParsingFailure
    case requestFailed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .jsonParsingFailure: return "Failed to parse JSON"
        case let .requestFailed(description): return "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid status code: \(statusCode)"
        case let .unknownError(error): return "An unknown eror occured: \(error.localizedDescription)"
        }
    }
}
