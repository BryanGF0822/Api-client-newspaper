//
//  ArticleViewModel.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import Foundation
internal import Combine


/// Maneja el estado de la lista y coordina la carga de articulos.
class ArticleViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    private let service: ArticleServiceProtocol

    init(service: ArticleServiceProtocol) {
        self.service = service
    }
    
    /// Carga articulos y actualiza el estado de la vista.
    func loadArticles() async {
        //print(Thread.current)
        isLoading = true
        errorMessage = nil
        
        do {
            articles = try await service.fetchArticles()
        } catch let error as NetworkError{
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "An unexpected error occurred."
        }
        isLoading = false
    }
}
