//
//  ArticleDetailView.swift
//  mastering-swiftui
//
//  Created by User on 5/11/25.
//

import SwiftUI

struct ArticleDetailView: View {
    @State var article : Article
    @State var isShow: Bool = false
    @State var showAlert: Bool = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("Article/\(article.image)")
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading) {
                    Text(article.title)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.heavy)
                    Text("By \(article.author)")
                        .font(.system(.title2))
                        .foregroundStyle(.secondary)
                    Text(article.content)
                }
                .padding(.horizontal)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.all, edges: .top)
        .overlay(
            isShow ?
                AnyView(
                    HStack {
                        Spacer()
                        VStack {
                            Button {
                                self.showAlert = true
                            } label: {
                                Image(systemName: "chevron.down.circle.fill")
                                    .font(.largeTitle)
                                    .foregroundStyle(.white)
                            }
                            .padding(.trailing, 20)
                            .padding(.top, 40)
                            Spacer()
                        }
                    }
                ) : AnyView(EmptyView())
        )
        .alert("Reminder", isPresented: $showAlert, actions: {
            Button {
                dismiss()
            } label: {
                Text("Yes")
            }
            
            Button(role: .cancel, action: {}) {
                Text("No")
            }
        })
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label : {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.largeTitle)
                }.tint(.white)
            }
        }
        
    }
}

#Preview {
    ArticleDetailView(article: articles[0])
}
