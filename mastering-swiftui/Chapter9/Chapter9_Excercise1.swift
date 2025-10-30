//
//  Chapter9_Excercise1.swift
//  mastering-swiftui
//
//  Created by User on 30/10/25.
//

import SwiftUI

struct Chapter9_Excercise1: View {
    @State private var loading = false
    @State private var completed = false
    @State private var rotation = 0.0
    @State private var timer: Timer? = nil
    
    var body: some View {
        Button{
            startLoading()
        } label: {
            
            HStack(alignment: .center) {
                if loading {
                    Circle()
                            .trim(from: 0, to: 0.8)
                            .stroke(.white, lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .rotationEffect(.degrees(rotation))

                }
                    
                Text(getName())
                    .font(.system(.title, design: .rounded))
                    .transition(.move(edge: .top))
            }
        }
        .frame(width: loading ? 250: 200,height: 60)
        .foregroundStyle(.white)
        .background(loading ? .yellow : completed ? .green : .blue)
        .cornerRadius(40)
        .animation(.spring, value: loading)
        .animation(.spring, value: completed)
        
    }
    
    private func getName() -> String {
        
        if loading && !completed {
            return "Loading"
        }
        
         else if !loading && completed {
            return "Completed"
        }
        else {
            return "Submit"
        }
    }
    
    private func startLoading() {
        self.loading = true
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            self.rotation += 10
            if self.rotation >= 360 { self.rotation -= 360 }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.loading = false
            self.completed = true
            
            self.timer?.invalidate()
            self.timer = nil
            
            self.endLoading()
        }
    }
    
    private func endLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.completed = false
            
            self.timer?.invalidate()
            self.timer = nil
        }
    }
}

#Preview {
    Chapter9_Excercise1()
}
