//
//  Article.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 1/10/25.
//

import Foundation

struct ArticlesReponse: Codable {
    let count: Int
    let next: String?
    let results: [Article]
}

struct Article: Codable, Identifiable {
    let id: Int
    let title: String
    let url: String
    let imageUrl: String
    let newsSite: String
    let publishedAt: String
    let summary: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, url, summary
        case imageUrl = "image_url"
        case newsSite = "news_site"
        case publishedAt = "published_at"
    }
}
