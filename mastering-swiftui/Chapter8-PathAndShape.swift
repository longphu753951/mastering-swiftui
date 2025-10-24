//
//  Chapter8-PathAndShape.swift
//  mastering-swiftui
//
//  Created by User on 13/10/25.
//

import SwiftUI

struct Chapter8_PathAndShape: View {
    var body: some View {
        
        /*Path() { path in
            path.move(to: CGPoint(x: 20, y:20))
            path.addLine(to: CGPoint(x:300, y: 20))
            path.addLine(to: CGPoint(x: 300, y: 200))
            path.addLine(to: CGPoint(x: 20, y: 200))
            path.closeSubpath()
        }.stroke(.green, lineWidth: 10)*/
        /*Path() { path in
            path.move(to: CGPoint(x:20, y: 60))
            path.addLine(to: CGPoint(x: 40, y: 60))
            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
            path.addLine(to: CGPoint(x: 230, y: 60))
            path.addLine(to: CGPoint(x: 230, y: 100))
            path.addLine(to: CGPoint(x: 20, y: 100))
            path.closeSubpath()
        }.fill(.purple)
            .stroke(.black, lineWidth: 5)*/
        /*ZStack {
            Path() {path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)
            }.fill(.green)
            
            Path() {path in
                path.move(to: CGPoint(x: 200, y: 200))
                path.addArc(center: .init(x: 200, y: 200), radius: 150, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: false)
            }.fill(.red)
        }
        
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(0), endAngle: .degrees(190), clockwise: true)
            }
            .fill(.yellow)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(190), endAngle: .degrees(110), clockwise: true)
            }
            .fill(.green)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(110), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.red)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(90), endAngle: .degrees(40), clockwise: true)
            }
            .fill(.blue)
            
            Path { path in
                path.move(to: CGPoint(x: 187, y: 187))
                path.addArc(center: .init(x: 187, y: 187), radius: 150, startAngle: .degrees(40), endAngle: .degrees(0), clockwise: true)
            }
            .fill(.purple)
            .offset(x: 19, y: 7)
            
        }*/
        /*Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to: CGPoint(x:200, y: 0), control: CGPoint(x: 100, y: -20))
            path.addLine(to: CGPoint(x: 200, y: 40))
            path.addLine(to: CGPoint(x: 0, y: 40))
        }.fill(.lightGreen)
        
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addQuadCurve(to:CGPoint(x: 200, y: 0), control: CGPoint(x:100, y: -20))
            path.addRect(CGRect(x: 0, y: 0, width: 200, height: 40))
        }*/
        
        /*Button {
            
        } label: {
            Text("Label")
                .font(.system(.title, design: .rounded))
                .bold()
                .foregroundColor(.white)
                .frame(width: 250, height: 50)
                .background(
                    Dome().fill(.red)
                )
        }
        
        Circle()
            .frame(width: 200, height: 200)
            .foregroundColor(.green)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
            )*/
        
        var purpleGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255,blue: 179/255)]), startPoint: .trailing, endPoint: .leading)
        
        ZStack {
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 20)
                .frame(width: 300, height: 300)
            
            Circle()
                .trim(from: 0, to: 0.85)
                .stroke(purpleGradient, lineWidth: 20)
                .frame(width: 300, height: 300)
                .overlay(
                    VStack{
                        Text("85%")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundStyle(.gray)
                        
                    }
                )
        }
        Spacer()
        ZStack {
            
        }
    }
}

struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0),control: CGPoint(x: rect.size.width/2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        return path
    }
}

#Preview {
    Chapter8_PathAndShape()
}
