//
//  NetworkError.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import Foundation

/// Errores de red con mensajes listos para mostrar al usuario.
enum NetworkError: LocalizedError {
    case badURL
    case invalidResponse
    case decodingError
    case noInternet
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return "Bad URL"
        case .invalidResponse:
            return "Invalid Response"
        case .decodingError:
            return "Decoding Error"
        case .noInternet:
            return "No Internet Connection"
        case .unknown:
            return "Unknown Error"
        }
    }
}
