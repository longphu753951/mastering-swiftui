//
//  Card.swift
//  mastering-swiftui
//
//  Created by User on 30/10/25.
//

import SwiftUI

struct CardFullSize: View {
    var cardData: CardData
    
    var body: some View {
        VStack(alignment:.leading) {
            Image(cardData.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .clipped()
            VStack(alignment:.leading, spacing: 5){
                Text(cardData.category)
                    .font(.system(.title3,design: .rounded))
                    .foregroundStyle(.gray)
                Text(cardData.title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.heavy)
                Text(cardData.author)
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                HStack{
                    ForEach(1...cardData.rating, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                }
                Text(cardData.content)
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(.secondary)
            }.padding()
        }.padding()
    }
}

struct CardData: Identifiable, Hashable {
    let id = UUID()
    let image: String
    let title: String
    let category: String
    let author: String
    let rating: Int
    let content: String
}


#Preview {
    CardFullSize(cardData: CardData(
        image: "swiftui-button", title: "Draw a border with Rounded Corners", category: "SwiftUI", author: "Simon NG", rating: 4, content: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier."
    ))
}
