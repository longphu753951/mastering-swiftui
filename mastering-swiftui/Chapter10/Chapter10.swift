//
//  Chapter10.swift
//  mastering-swiftui
//
//  Created by User on 30/10/25.
//

import SwiftUI

struct Chapter10: View {
    
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location:"Hong Kong", image: "cafedeadend", isFavorite: false), Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isFavorite: false), Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isFavorite: false),Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isFavorite: false), Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isFavorite: false), Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false), Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isFavorite: false), Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isFavorite: false), Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isFavorite: false), Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isFavorite: false), Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isFavorite: false), Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isFavorite: false), Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isFavorite: false), Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isFavorite: false)]
    
    var body: some View {
        List(restaurants, id: \.id) { restaurant in
            RowItem(image: restaurant.image, name: restaurant.name)
        }.navigationTitle("List")
    }
}

struct RowItem: View {
    @State var image: String
    @State var name: String
    var body: some View {
        HStack {
            Image("Restaurant/\(image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .cornerRadius(5)
                .padding(.horizontal)
            Text(name)
        }
    }
}

struct FullImageRow: View {
    @State var image: String
    @State var name: String
    var body: some View {
        ZStack {
            Image("Restaurant/\(image)")
        }
    }
}

#Preview {
    Chapter10()
}

#Preview("FullImageRow",) {
    FullImageRow(image: "cafedeadend", name: "Cafe Deadend").previewLayout(.sizeThatFits#)
}
