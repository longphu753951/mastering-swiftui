//
//  Chapter9-Animation&Transition.swift
//  mastering-swiftui
//
//  Created by User on 22/10/25.
//

import SwiftUI

struct Chapter9_Animation: View {
    @State private var circleColorChanged = false
    @State private var heartColorChanged = false
    @State private var heartSizeChanged = false
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    @State private var recordBegin = false
    @State private var recording = false
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(circleColorChanged ? Color(.systemGray5): .red)
            
            Image(systemName: "heart.fill")
                .foregroundColor(heartColorChanged ? .red : .white)
                .font(.system(size: 50))
                .scaleEffect(heartSizeChanged ? 1.0 : 0.5)
                
        }
        /*/.animation(.default, value: heartSizeChanged)
        .animation(.spring(.bouncy, blendDuration: 1.0), value: circleColorChanged) */
        .onTapGesture {
            withAnimation(.spring(.bouncy, blendDuration: 3.0)) {
                self.circleColorChanged.toggle()
                self.heartColorChanged.toggle()
            }
            self.heartSizeChanged.toggle()
        }
        Spacer()
        
        ZStack {
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 14)
                .frame(width: 100)
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(.green, lineWidth: 10)
                .frame(width: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.default.repeatForever(autoreverses: true), value: isLoading)
                .onAppear() {
                    isLoading = true
                }
        }
        Spacer()
        VStack(alignment: .center) {
            Text("Loading ...")
                .font(.system(.body, design: .rounded))
                .bold()
            ZStack {
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color(.systemGray5), lineWidth: 3)
                    .frame(width: 250, height: 3)
                RoundedRectangle(cornerRadius: 3)
                    .stroke(Color(.green), lineWidth: 3)
                    .frame(width: 30, height: 3)
                    .offset(x: isLoading ? 110 : -110, y: 0)
                    .onAppear() {
                        withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)){}
                        isLoading = true
                    }
            }
            Spacer()
            ZStack {
                Text("\(Int(progress * 100))%")
                
                Circle()
                    .stroke(Color(.systemGray5), lineWidth: 10)
                    .frame(width: 150, height: 150)
                
                Circle()
                    .trim(from: 0,to: progress)
                    .stroke(Color(.green), lineWidth: 10)
                    .frame(width: 150, height: 150)
                    .rotationEffect(Angle(degrees: -90))
            }.onAppear() {
                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: true) { timer in
                    self.progress += 0.005
                    if(self.progress >= 1.0) {
                        timer.invalidate() // Stop the interval
                    }
                }
            }
            
            Spacer()
            HStack {
                ForEach(1...4, id:\.self) { index in
                      Circle()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(.green)
                        .scaleEffect(self.isLoading ? 0: 1)
                        .animation(.linear(duration: 0.6).repeatForever().delay(0.2 *  Double(index)), value: isLoading)
                }
            }
            .onAppear() {
                self.isLoading = true
            }
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: recordBegin ? 30:5)
                    .frame(width: recordBegin ? 60:250, height: 60)
                    .foregroundStyle(recordBegin ? .red : .green)
                    .overlay(
                            Image(systemName: "mic.fill")
                                .font(.system(.title))
                                .foregroundStyle(.white)
                                .scaleEffect(recording ? 0.7 : 1)
                    )
                RoundedRectangle(cornerRadius: recordBegin ? 35: 10)
                    .trim(from: 0, to: recordBegin ? 0.0001 : 1)
                    .stroke(lineWidth: 5)
                    .frame(width: recordBegin ? 70 : 260, height: 70)
                    .foregroundStyle(recordBegin ? .red : .green)
            }.onTapGesture {
                withAnimation(.default) {
                    self.recordBegin.toggle()
                }
                
                withAnimation(.default.repeatForever().delay(0.5)) {
                    self.recording.toggle()
                }
            }
        }
        
    }
}

#Preview {
    Chapter9_Animation()
}
