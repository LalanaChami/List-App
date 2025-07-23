//
//  NetworkError.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import Foundation

public enum NetworkError: LocalizedError {
    case invalidURL
    case noData
    case decodingError(Error)
    case networkError(Error)
    case invalidResponse
    case serverError(Int)
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received in the response"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response received"
        case .serverError(let code):
            return "Server error with code: \(code)"
        }
    }
}
