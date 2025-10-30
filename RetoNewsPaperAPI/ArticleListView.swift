//
//  ArticleListView.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 1/10/25.
//

import SwiftUI

struct ArticleListView: View {
    
    @StateObject private var viewModel = ArticleViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Cargando noticias...")
                } else if let error = viewModel.errorMessage {
                    Text(error).foregroundStyle(Color.red)
                } else {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.headline)
                                Text(article.newsSite)
                                    .font(.subheadline)
                                    .foregroundStyle(Color.gray)
                            }
                        }
                    }
                }
            }
            .task {
                await viewModel.loadArticles()
            }
            .navigationTitle("Noticias Espaciales")
        }
    }
}

#Preview {
    ArticleListView()
}
