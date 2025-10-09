//
//  Chapter4-LayoutView.swift
//  mastering-swiftui
//
//  Created by User on 2/10/25.
//

import SwiftUI

struct Chapter4_LayoutView: View {
    var body: some View {
        VStack(alignment: .leading){
            Header()
            HStack {
                PriceCard(type: "Basic", price: "$9", bgColor: .purple, foreground: .white)
                PriceCard(type: "Pro", price: "$19", bgColor: Color(red: 240/255, green: 240/255, blue: 240/255), caption: "Best for designer")
            }.padding(.vertical)
            PriceCard(type: "Team", price: "$299", bgColor: Color(red:69/255, green: 69/255, blue: 69/255), foreground: .white, caption: "Perfect for teams with 20 members")
            Spacer()
        }.padding(.horizontal)
    }
}

struct Header: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
            Text("Your plan")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.black)
        }
    }
}

struct PriceCard: View {
    var type: String
    var price: String
    var bgColor: Color
    var foreground: Color = .black
    var caption: String? = nil
    var icon: String? = nil
    
    var body: some View {
        ZStack {
            VStack {
                if let icon {
                    Image(systemName: icon)
                        .font(.largeTitle)
                        .foregroundStyle(foreground)
                }
                
                Text(type)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(foreground)
                Text(price)
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                    .foregroundStyle(foreground)
                Text("per month")
                    .fontWeight(.black)
                    .foregroundStyle(foreground)
            }
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 120)
            .padding(40)
            .background(bgColor)
            .cornerRadius(10)
            
            
            
            if let caption {
                Text(caption)
                    .font(.system(.caption, design: .rounded))
                    .fontWeight(.bold)
                    .padding(5)
                    .background(Color(red: 255/255, green: 183/255, blue: 37/255))
                    .foregroundStyle(.white)
                    .offset(x:0, y:100)
            }

        }
    }
}

#Preview {
    Chapter4_LayoutView()
}
