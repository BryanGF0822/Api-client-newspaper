//
//  ArticleViewModel.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 2/10/25.
//

import Foundation
internal import Combine

@MainActor
class ArticleViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let service = ArticleService()
    
    func loadArticles() async {
        
        isLoading = true
        errorMessage = nil
        
        do {
            articles = try await service.fetchArticles()
        } catch {
            errorMessage = "Failed to fetch articles."
        }
        isLoading = false
    }
}
