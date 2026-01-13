//
//  ArticleListView.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import SwiftUI

/// Vista raiz: lista articulos, maneja estados y navega al detalle.
struct ArticleListView: View {

    @StateObject private var viewModel: ArticleViewModel
    
    init(viewModel: ArticleViewModel = ArticleViewModel(service: ArticleService())) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading News...")
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundStyle(.red)
                } else {
                    List(viewModel.articles, id: \.self) { article in
                        NavigationLink(value: article) {
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.headline)

                                Text("From: \(article.newsSite)")
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Science News")
            .task {
                
                await viewModel.loadArticles()
            }
            .navigationDestination(for: Article.self) { article in
                ArticleDetailView(article: article)
            }
        }
    }
}

#Preview {
    ArticleListView(viewModel: ArticleViewModel(service: MockArticleService()))
}
