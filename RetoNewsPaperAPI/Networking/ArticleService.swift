//
//  ArticleService.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import Foundation

/// Servicio real que consulta la API de Spaceflight News.
class ArticleService: ArticleServiceProtocol {

    private let baseURL = "https://api.spaceflightnewsapi.net/v4/articles"

    /// Realiza la solicitud HTTP y decodifica la respuesta.
    func fetchArticles() async throws -> [Article] {

        guard let url = URL(string: baseURL) else {
            throw NetworkError.badURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw NetworkError.invalidResponse
            }

            do {
                let decoded = try JSONDecoder().decode(ArticlesResponse.self, from: data)
                return decoded.results
            } catch {
                throw NetworkError.decodingError
            }

        } catch let error as URLError {
            if error.code == .notConnectedToInternet {
                throw NetworkError.noInternet
            }
            throw NetworkError.unknown
        }
    }
}
