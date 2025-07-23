//
//  CommonHelpers.swift
//  List App
//
//  Created by Lalana Thanthirigama on 2025-07-23.
//

import Foundation

public class CommonHelpers {
    public static let shared = CommonHelpers()
    
    public func handleResponse(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard 200...299 ~= httpResponse.statusCode else {
            throw NetworkError.serverError(httpResponse.statusCode)
        }
        
        guard !data.isEmpty else {
            throw NetworkError.noData
        }
        
        return data
    }
    
    public func mapError(_ error: Error) -> NetworkError {
        if let networkError = error as? NetworkError {
            return networkError
        }
        
        if error is DecodingError {
            return NetworkError.decodingError(error)
        }
        
        if let urlError = error as? URLError {
            switch urlError.code {
            case .badURL:
                return NetworkError.invalidURL
            case .notConnectedToInternet, .networkConnectionLost:
                return NetworkError.networkError(urlError)
            default:
                return NetworkError.networkError(urlError)
            }
        }
        
        return NetworkError.networkError(error)
    }
    
}
