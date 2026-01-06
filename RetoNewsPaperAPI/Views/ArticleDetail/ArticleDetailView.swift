//
//  ArticleDetailView.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 5/01/26.
//

import SwiftUI

/// Vista de detalle que muestra el articulo y su imagen (con placeholder).
struct ArticleDetailView: View {

    let article: Article

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                AsyncImage(url: URL(string: article.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                } placeholder: {
                    Image("no_image_available")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal)

                VStack(alignment: .leading, spacing: 12) {

                    Text(article.title)
                        .font(.title)
                        .fontWeight(.bold)

                    Text("From: \(article.newsSite)")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    Divider()

                    Text(article.summary)
                        .font(.body)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ArticleDetailView(article: .mockArticle)
    }
}
