//
//  Article.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import Foundation

/// Respuesta principal de la API que contiene la lista de articulos.
struct ArticlesResponse: Codable {
    let count: Int
    let next: String?
    let results: [Article]
}

/// Modelo de articulo utilizado en la UI.
struct Article: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let url: String
    let imageUrl: String
    let newsSite: String
    let publishedAt: String
    let summary: String
    
    /// Mapea las claves snake_case del API a camelCase.
    enum CodingKeys: String, CodingKey {
        case id, title, url, summary
        case imageUrl = "image_url"
        case newsSite = "news_site"
        case publishedAt = "published_at"
    }
}
