//
//  NetworkService.swift
//  ShapesApp
//
//  Created by Jason Sanchez on 7/6/25.
//

import Foundation

// MARK: - NetworkError
enum NetworkError: Error {
    case badUrl
    case inavalidServerResponse
    case decodingError(Error)
}

// MARK: - Service Network Async/Await
class NetworkService {
    func load(url: URL?) async throws -> [Buttons] {
        guard let url = url else {
            throw NetworkError.badUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.inavalidServerResponse
        }
        do {
            let response = try JSONDecoder().decode(ButtonResponse.self, from: data)
            return response.buttons
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
