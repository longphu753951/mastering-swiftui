//
//  Chapter9_Excercise2.swift
//  mastering-swiftui
//
//  Created by User on 30/10/25.
//

import SwiftUI


struct Chapter9_Excercise2: View {
    @State var listContent: [CardData] = [
        CardData(
            image: "swiftui-button",
            title: "CardFullSize",
            category: "SwiftUI",
            author: "Max Mustermann",
            rating: 5,
            content: "This is a full size card example showing all the details."
        ),
        CardData(
            image: "natural-language-api",
            title: "Starry Night",
            category: "Art",
            author: "Vincent Van Gogh",
            rating: 4,
            content: "A depiction of the night sky filled with swirling stars."
        ),
        CardData(
            image: "macos-programming",
            title: "Reading List",
            category: "Education",
            author: "Jane Doe",
            rating: 3,
            content: "A curated list of must-read books for developers."
        )
    ];
    @State var show = false
    @State var cardIndex = 0
    
    var body: some View {
        VStack(spacing: 20) {
            if show {
                CardFullSize(cardData: listContent[cardIndex])
                    .transition(.slideInAndOut)
            }
            
            if !show {
                CardFullSize(cardData: listContent[cardIndex])
                    .transition(.slideInAndOut)
            }
        }.onTapGesture {
            
            self.cardIndex = (self.cardIndex + 1) % listContent.count
            
            withAnimation(Animation.spring()) {
                self.show.toggle()
            }
        }
    }
}

extension AnyTransition {
    static var scaleDownAndUp: AnyTransition {
        AnyTransition.offset(y: 600).combined(with: .scale(scale: 0, anchor: .bottom)).combined(with: .opacity)
    }
    
    static var slideInAndOut: AnyTransition {
        AnyTransition.asymmetric(
            insertion: AnyTransition.offset(x: 800).combined(with: .opacity).combined(with: .scale(scale: 0, anchor: .trailing)),
            removal: AnyTransition.offset(x: -800).combined(with: .opacity).combined(with: .scale(scale: 0, anchor: .leading))
        )
    }
}

#Preview {
    Chapter9_Excercise2()
}
