//
//  Chapter4-ZStackLayoutView.swift
//  mastering-swiftui
//
//  Created by User on 2/10/25.
//

import SwiftUI

struct Chapter4_ZStackLayoutView: View {
    var body: some View {
        ZStack {
            PriceCard(type: "Basic", price: "$9", bgColor: .purple, foreground: .white, icon: "burst.fill")
                .padding()
                .offset(x:0, y: 180)
            PriceCard(
                type: "Pro",
                price: "$19",
                bgColor: Color(red: 255/255, green: 183/255, blue: 37/255),
                foreground: .white,
                icon: "dial"
            ).padding()
                .scaleEffect(0.95)
            PriceCard(
                type: "Team",
                price: "$299",
                bgColor: Color(red:69/255, green: 69/255, blue: 69/255),
                foreground: .white,
                icon: "wand.and.rays",
)
            .padding()
            .scaleEffect(0.9)
            .offset(x:0, y: -170)
        }.padding(.horizontal)
    }
}

#Preview {
    Chapter4_ZStackLayoutView()
}
