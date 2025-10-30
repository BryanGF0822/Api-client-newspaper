//
//  ArticleService.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 1/10/25.
//

import Foundation

class ArticleService {
    
    private let baseURL = "https://api.spaceflightnewsapi.net/v4/articles"
    
    func fetchArticles() async throws -> [Article] {
        guard let url = URL(string: baseURL) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let response = try JSONDecoder().decode(ArticlesReponse.self, from: data)
        return response.results
    }
}
