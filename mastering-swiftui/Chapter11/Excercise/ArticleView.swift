//
//  ArticleView.swift
//  mastering-swiftui
//
//  Created by User on 5/11/25.
//

import SwiftUI

struct ArticleView: View {
    @State var article: Article
    var body: some View {
        VStack(alignment:.leading) {
            Image("Article/\(article.image)")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: 250)
                .clipped()
            VStack(alignment:.leading) {
                Text(article.title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                Text("By \(article.author)")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                HStack {
                    ForEach(0...article.rating, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                }
                Text(article.content)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
            }
        }
    }
}

#Preview {
    ArticleView(article: articles[1])
}
