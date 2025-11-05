//
//  Chap10_ExcerciseView.swift
//  mastering-swiftui
//
//  Created by User on 5/11/25.
//

import SwiftUI

struct Chap10_ExcerciseView: View {
    var listCardData = [
        CardData(image: "macos-programming",
                 title: "Reading List",
                 category: "Education",
                 author: "Jane Doe",
                 rating: 3,
                 content: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier."),
        CardData(image: "swiftui-button",
                 title: "SwiftUI Animations",
                 category: "Development",
                 author: "John Appleseed",
                 rating: 5,
                 content: "Learn how to create smooth and interactive animations using SwiftUI's built-in animation system."),
        CardData(image: "natural-language-api",
                 title: "Design Basics",
                 category: "UI/UX",
                 author: "Emily Smith",
                 rating: 4,
                 content: "Discover the core principles of designing harmonious and engaging interfaces for iOS apps.")
    ]
    var body: some View {
        List(listCardData) { data in
            DocItem(cardData: data)
        }
        .listStyle(.plain)
        .listRowSeparator(.hidden)
        .navigationTitle("Title")
    }
}

struct DocItem: View, Identifiable {
    let id = UUID()
    var cardData: CardData
    
    var body: some View {
        VStack(alignment:.leading) {
            Image(cardData.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 300)
                .clipped()
            VStack(alignment:.leading, spacing: 2) {
                Text(cardData.title)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                Text("By \(cardData.author)")
                    .font(.system(.title2, design: .rounded))
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                HStack {
                    ForEach(0...cardData.rating, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                    }
                }
                Text(cardData.content)
            }
        }
    }
}



#Preview {
    Chap10_ExcerciseView()
}

#Preview("DocItem") {
    DocItem(cardData: CardData(image: "macos-programming",
                               title: "Reading List",
                               category: "Education",
                               author: "Jane Doe",
                               rating: 3,
                               content: "With SwiftUI, you can easily draw a border around a button or text (and it actually works for all views) using the border modifier."))
}

