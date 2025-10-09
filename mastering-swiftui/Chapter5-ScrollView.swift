//
//  Chapter5-ScrollView.swift
//  mastering-swiftui
//
//  Created by User on 2/10/25.
//

import SwiftUI

struct Chapter5_ScrollView: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                Text("MONDAY, OCT 2th 2025")
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.secondary)
                Text("Your Reading")
                    .font(.system(.largeTitle, design:.rounded))
                    .fontWeight(.black)
                    .foregroundStyle(.primary)
            }.padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Group {
                        Card(image: "swiftui-button", category: "SwiftUI", title: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                            .frame(width: 300)
                        
                        Card(image: "flutter-app", category: "Flutter", title: "Building a simple app", author: "Truong Minh Tam")
                            .frame(width: 300)
                        
                        Card(image: "natural-language-api", category: "IOS", title: "What's New in Natural Language API", author: "Tram Minh Tuong")
                            .frame(width: 300)
                    }
                }
            }
            ScrollView {
                VStack {
                    Card(image: "swiftui-button", category: "SwiftUI", title: "Drawing a Border with Rounded Corners", author: "Simon Ng")
                    
                    Card(image: "flutter-app", category: "Flutter", title: "Building a simple app", author: "Truong Minh Tam")
                    
                    Card(image: "natural-language-api", category: "IOS", title: "What's New in Natural Language API", author: "Tram Minh Tuong")
                }
            }
        }
    }
}

struct Card: View {
    var image: String
    var category: String
    var title: String
    var author: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack{
                VStack(alignment: .leading) {
                    
                    Text(category)
                        .font(.system(.headline, design: .rounded))
                        .fontWeight(.black)
                        .foregroundStyle(.secondary)
                    Text(title)
                        .font(.system(.title, design: .rounded))
                        .lineLimit(2)
                        .fontWeight(.black)
                        .foregroundStyle(.primary)
                        .minimumScaleFactor(0.5)
                    Text("Written by \(author.uppercased())")
                        .font(.system(.caption))
                        .fontWeight(.bold)
                        .foregroundStyle(.secondary)
                }
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
    }
}

#Preview {
    Chapter5_ScrollView()
}

#Preview("Card", traits: .sizeThatFitsLayout) {
    Card(image: "swiftui-button", category: "SwiftUI", title: "Drawing a Border with Rounded Corners", author: "Simon Ng")
}
