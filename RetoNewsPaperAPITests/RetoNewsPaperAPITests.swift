//
//  RetoNewsPaperAPITests.swift
//  RetoNewsPaperAPITests
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import XCTest
@testable import RetoNewsPaperAPI

/// Pruebas de modelos y del comportamiento del view model.
final class RetoNewsPaperAPITests: XCTestCase {

    private struct TestError: Error {}

    /// Verifica que el modelo Article se construye con los datos esperados.
    func testArticleCreation() {
        let article = Article(
            id: 1,
            title: "Test title",
            url: "https://test.com",
            imageUrl: "https://test.com/image.jpg",
            newsSite: "Test Site",
            publishedAt: "2025-01-01",
            summary: "Test summary"
        )

        XCTAssertEqual(article.title, "Test title")
    }

    @MainActor
    /// Escenario exitoso al cargar articulos desde el servicio.
    func testLoadArticlesSuccess() async {
        let article = Article(
            id: 99,
            title: "Success title",
            url: "https://success.com",
            imageUrl: "https://success.com/image.jpg",
            newsSite: "Success Site",
            publishedAt: "2025-01-01",
            summary: "Success summary"
        )

        let service = MockArticleService(result: .success([article]))
        let viewModel = ArticleViewModel(service: service)

        await viewModel.loadArticles()

        XCTAssertEqual(viewModel.articles, [article])
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertFalse(viewModel.isLoading)
    }

    @MainActor
    /// Error de red conocido que se transforma en mensaje al usuario.
    func testLoadArticlesNetworkError() async {
        let service = MockArticleService(result: .failure(NetworkError.noInternet))
        let viewModel = ArticleViewModel(service: service)

        await viewModel.loadArticles()

        XCTAssertEqual(viewModel.errorMessage, NetworkError.noInternet.localizedDescription)
        XCTAssertTrue(viewModel.articles.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }

    @MainActor
    /// Error inesperado que usa el mensaje generico de fallback.
    func testLoadArticlesUnknownError() async {
        let service = MockArticleService(result: .failure(TestError()))
        let viewModel = ArticleViewModel(service: service)

        await viewModel.loadArticles()

        XCTAssertEqual(viewModel.errorMessage, "An unexpected error occurred.")
        XCTAssertTrue(viewModel.articles.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
}
