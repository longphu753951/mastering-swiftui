//
//  Chapter9_Transition.swift
//  mastering-swiftui
//
//  Created by User on 22/10/25.
//

import SwiftUI

struct Chapter9_Transition: View {
    @State private var show = false
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.lightGreen)
                .overlay(
                    Text("Show Detail")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                )
                .onTapGesture {
                    withAnimation(.default) {
                        self.show.toggle()
                    }
                }
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.purple)
                    .overlay(
                        Text("Well, here is the details")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                    )
                    .transition(.synmmetric)
                    /*.transition(.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
                    )*/
                    //.transition(.offset(x: -600, y: 0).combined(with: .scale))
                    //.transition(.scale(scale: 0, anchor: .bottom))
                    //.transition(.offset(x: -600, y: 0))
            }
        }
    }
}

extension AnyTransition {
    static var scaleAndOffset: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .scale(scale: 0, anchor: .bottom),
            removal: .offset(x: -600, y: 00)
        )
    }
    
    static var synmmetric: AnyTransition {
    AnyTransition.offset(x: -600, y: 0).combined(with: .scale).combined(with: .opacity)
    }
}

#Preview {
    Chapter9_Transition()
}
