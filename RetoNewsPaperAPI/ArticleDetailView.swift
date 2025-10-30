//
//  ArticleDetailView.swift
//  RetoNewsPaperAPI
//
//  Created by Bryan Alexander Guapacha Florez on 29/10/25.
//

import SwiftUI

struct ArticleDetailView: View {
    
    let article: Article
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(article.title)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text(article.summary)
                    .font(.body)
                    .padding()
                
                Text(article.newsSite)
                    .font(.body)
                    .padding()
                
                GeometryReader { geometry in
                    AsyncImage(url: URL(string: article.imageUrl)) { image in
                        image
                            .image?.resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width, height: geometry.size.width * 0.6)
                            .clipped()
                            .cornerRadius(10)
                    }
                }
            }
        }
        .navigationTitle(article.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArticleDetailView(article: .mockArticle)
}
