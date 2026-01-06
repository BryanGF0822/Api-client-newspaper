//
//  MockArticleService.swift
//  RetoNewsPaperAPITests
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import Foundation
@testable import RetoNewsPaperAPI

/// Mock que devuelve un resultado predefinido para pruebas.
final class MockArticleService: ArticleServiceProtocol {
    private let result: Result<[Article], Error>

    init(result: Result<[Article], Error>) {
        self.result = result
    }

    func fetchArticles() async throws -> [Article] {
        try result.get()
    }
}
