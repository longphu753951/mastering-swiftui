//
//  Chap10_ExcerciseView.swift
//  mastering-swiftui
//
//  Created by User on 5/11/25.
//

import SwiftUI



struct Chap11_ExcerciseView: View {
   
    var body: some View {
        NavigationStack {
            List {
                ForEach(articles) { article in
                    NavigationLink(destination: ArticleDetailView(article: article)) {
                        ArticleView(article: article)
                    }
                    .listRowSeparator(.hidden)
                    .navigationLinkIndicatorVisibility(.hidden)
                }
            }
            .navigationTitle("Your Reading")
            .listStyle(.plain)
            .listRowSeparator(.hidden)
        }
        
    }
}

#Preview {
    Chap11_ExcerciseView()
}
