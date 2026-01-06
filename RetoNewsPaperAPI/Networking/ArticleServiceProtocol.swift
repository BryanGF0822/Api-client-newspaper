//
//  ArticleServiceProtocol.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import Foundation

/// Contrato para obtener articulos (implementacion real o mock).
protocol ArticleServiceProtocol {
    /// Devuelve la lista de articulos desde la fuente de datos.
    func fetchArticles() async throws -> [Article]
}
