//
//  Chapter8-UnderstandingStateAndBuilding.swift
//  mastering-swiftui
//
//  Created by User on 13/10/25.
//

import SwiftUI

struct Chapter8_UnderstandingStateAndBuilding: View {
    @State private var isPlaying = false
    @State private var counting = 0
    @State private var number1 = 0
    @State private var number2 = 0
    @State private var number3 = 0
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Button {
                    isPlaying.toggle()
                } label: {
                    Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                        .font(.system(size: 150))
                        .foregroundStyle(isPlaying ? .red : .green)
                }
                CountingButton(color: .red, count: $counting)
                
                CountingButton(color: .blue, count: $counting)
                
                CountingButton(color: .yellow, count: $counting)
                VStack(alignment: .center, spacing: 20) {
                    Text("\(number1 + number2 + number3)")
                        .font(.system(size: 100))
                    HStack(spacing: 90) {
                        CountingButton(color: .red, count: $number1)
                        
                        CountingButton(color: .blue, count: $number2)
                        
                        CountingButton(color: .yellow, count: $number3)
                    }
                }
            }
        }.frame(maxWidth: .infinity)
    }
}

struct CountingButton: View {
    var color: Color
    @Binding var count: Int
    var body: some View {
        Button {
            count = count + 1
        } label: {
            Text("\(count)")
                .font(.system(size: 100))
                .foregroundStyle(.white)
                .background(
                    Circle()
                        .fill(color)
                        .frame(width: 300)
                )
        }
    }
}

#Preview {
    Chapter8_UnderstandingStateAndBuilding()
}
