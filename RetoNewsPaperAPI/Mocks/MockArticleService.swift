//
//  MockArticleService.swift
//  RetoNewsPaperAPITests
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import Foundation

/// Mock que devuelve un resultado predefinido para pruebas.
final class MockArticleService: ArticleServiceProtocol {

    func fetchArticles() async throws -> [Article] {
        return [
            Article(
                id: 1,
                title: "Avio Reveals More Hardware for its FD1 Rocket Demonstrator",
                url: "https://europeanspaceflight.com/avio-reveals-more-hardware-for-its-fd1-rocket-demonstrator/",
                imageUrl: "https://europeanspaceflight.com/wp-content/uploads/2025/10/Avio-Reveals-More-Hardware-for-its-FD1-Rocket-Demonstrator.webp",
                newsSite: "European Spaceflight",
                publishedAt: "2025-10-29T15:44:17Z",
                summary: "As part of its nine-month 2025 financial report, Italian rocket builder Avio shared images of several flight components for its FD1 rocket demonstrator, including the fairing, propellant tanks, avionics, and interstage. In early October, Avio announced the successful completion of a static fire test of its MR10 DMX2 LOX-methane rocket engine. According to the company, […]\nThe post Avio Reveals More Hardware for its FD1 Rocket Demonstrator appeared first on European Spaceflight."
            ),
            Article(
                id: 1,
                title: "Avio Reveals More Hardware for its FD1 Rocket Demonstrator",
                url: "https://europeanspaceflight.com/avio-reveals-more-hardware-for-its-fd1-rocket-demonstrator/",
                imageUrl: "https://europeanspaceflight.com/wp-content/uploads/2025/10/Avio-Reveals-More-Hardware-for-its-FD1-Rocket-Demonstrator.webp",
                newsSite: "European Spaceflight",
                publishedAt: "2025-10-29T15:44:17Z",
                summary: "As part of its nine-month 2025 financial report, Italian rocket builder Avio shared images of several flight components for its FD1 rocket demonstrator, including the fairing, propellant tanks, avionics, and interstage. In early October, Avio announced the successful completion of a static fire test of its MR10 DMX2 LOX-methane rocket engine. According to the company, […]\nThe post Avio Reveals More Hardware for its FD1 Rocket Demonstrator appeared first on European Spaceflight."
            ),
            Article(
                id: 1,
                title: "Avio Reveals More Hardware for its FD1 Rocket Demonstrator",
                url: "https://europeanspaceflight.com/avio-reveals-more-hardware-for-its-fd1-rocket-demonstrator/",
                imageUrl: "https://europeanspaceflight.com/wp-content/uploads/2025/10/Avio-Reveals-More-Hardware-for-its-FD1-Rocket-Demonstrator.webp",
                newsSite: "European Spaceflight",
                publishedAt: "2025-10-29T15:44:17Z",
                summary: "As part of its nine-month 2025 financial report, Italian rocket builder Avio shared images of several flight components for its FD1 rocket demonstrator, including the fairing, propellant tanks, avionics, and interstage. In early October, Avio announced the successful completion of a static fire test of its MR10 DMX2 LOX-methane rocket engine. According to the company, […]\nThe post Avio Reveals More Hardware for its FD1 Rocket Demonstrator appeared first on European Spaceflight."
            ),
            Article(
                id: 1,
                title: "Avio Reveals More Hardware for its FD1 Rocket Demonstrator",
                url: "https://europeanspaceflight.com/avio-reveals-more-hardware-for-its-fd1-rocket-demonstrator/",
                imageUrl: "https://europeanspaceflight.com/wp-content/uploads/2025/10/Avio-Reveals-More-Hardware-for-its-FD1-Rocket-Demonstrator.webp",
                newsSite: "European Spaceflight",
                publishedAt: "2025-10-29T15:44:17Z",
                summary: "As part of its nine-month 2025 financial report, Italian rocket builder Avio shared images of several flight components for its FD1 rocket demonstrator, including the fairing, propellant tanks, avionics, and interstage. In early October, Avio announced the successful completion of a static fire test of its MR10 DMX2 LOX-methane rocket engine. According to the company, […]\nThe post Avio Reveals More Hardware for its FD1 Rocket Demonstrator appeared first on European Spaceflight."
            ),
            Article(
                id: 1,
                title: "Avio Reveals More Hardware for its FD1 Rocket Demonstrator",
                url: "https://europeanspaceflight.com/avio-reveals-more-hardware-for-its-fd1-rocket-demonstrator/",
                imageUrl: "https://europeanspaceflight.com/wp-content/uploads/2025/10/Avio-Reveals-More-Hardware-for-its-FD1-Rocket-Demonstrator.webp",
                newsSite: "European Spaceflight",
                publishedAt: "2025-10-29T15:44:17Z",
                summary: "As part of its nine-month 2025 financial report, Italian rocket builder Avio shared images of several flight components for its FD1 rocket demonstrator, including the fairing, propellant tanks, avionics, and interstage. In early October, Avio announced the successful completion of a static fire test of its MR10 DMX2 LOX-methane rocket engine. According to the company, […]\nThe post Avio Reveals More Hardware for its FD1 Rocket Demonstrator appeared first on European Spaceflight."
            )
        ]
    }
}
