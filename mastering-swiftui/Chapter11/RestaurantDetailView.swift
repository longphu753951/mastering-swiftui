//
//  RestaurantDetailView.swift
//  mastering-swiftui
//
//  Created by User on 5/11/25.
//

import SwiftUI

struct RestaurantDetailView: View {
    @State var restaurant: Restaurant
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Image("Restaurant/\(restaurant.image)")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Cafe Deadend")
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    RestaurantDetailView(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location:"Hong Kong", image: "cafedeadend", isFavorite: false))
}
