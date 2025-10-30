//
//  Chapter5-button.swift
//  mastering-swiftui
//
//  Created by User on 9/10/25.
//

import SwiftUI

struct Chapter5_button: View {
    @State private var rotation = Angle.zero
    
    var body: some View {
        ScrollView(content: {
            Button(action: {
                print("hello")
            }, label: {
                Text("Hello World")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding()
                    .background(.purple)
                    .cornerRadius(40)
                    .foregroundStyle(.white)
                    .padding(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.purple, lineWidth: 5)
                    
                    )
            })
            
            Button(action: {
                print("Delete")
            }, label: {
                HStack {
                    Image(systemName: "trash")
                    Text("Delete")
                }
                .padding()
                .background(.red)
                .foregroundStyle(.white)
                .cornerRadius(40)
                .font(.largeTitle)
                
            })
            
            Button{
                withAnimation {rotation += .degrees(45)}
            } label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            .padding()
            .foregroundStyle(.white)
            .background(.green)
            .clipShape(Circle())
            .padding()
            .rotationEffect(rotation)
            
            Button {
                print("edit")
            } label: {
                Label(
                    title: {
                        Text("Edit")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    },
                    icon: {
                        Image(systemName: "pencil")
                            .font(.largeTitle)
                    }
                )
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .cornerRadius(40)
            }
            
            Button {
                print("Create")
            } label : {
                Label(
                    title: {
                        Text("Create")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    },
                    icon: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                )
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [.green,.yellow]), startPoint: .top, endPoint: .bottom))
                .foregroundStyle(.white)
                .cornerRadius(40)
                
            }
            
            Button {
                print("Create")
            } label : {
                Label(
                    title: {
                        Text("Create")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    },
                    icon: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                )
            }.buttonStyle(GradientBackgroundStyle())
            
            Button {
                print("Create")
            } label : {
                Label(
                    title: {
                        Text("Create")
                            .fontWeight(.semibold)
                            .font(.largeTitle)
                    },
                    icon: {
                        Image(systemName: "plus")
                            .font(.largeTitle)
                    }
                )
            }.buttonStyle(GradientBackgroundStyle())
            
            Button {
                print("ABC")
            } label: {
                Text("Buy me a coffee")
            }
            .tint(.purple)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 5))
            .controlSize(.extraLarge)
            Button {
                print("Buy me a coffee")
            } label: {
                Text("Buy me a coffee")
            }
            .tint(.purple)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.extraLarge)
            VStack {
                Button(action: {}) {
                    Text("Add to Cart")
                        .font(.headline)
                }
                
                Button(action: {}) {
                    Text("Discover")
                        .font(.headline)
                        .frame(maxWidth: 300)
                }
                
                Button {
                    
                } label: {
                    Text("Check out")
                        .font(.headline)
                }
            }
            .tint(.purple)
            .buttonStyle(.bordered)
            .controlSize(.large)
            
            VStack {
                HStack {
                    Button("Delete", role: .destructive) {
                        print("delete")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.extraLarge)
                    VStack(alignment: .leading) {
                        Text(".destructive")
                        Text(".borderedProminent")
                    }
                }
                
                HStack {
                    Button("Delete", role: .destructive) {
                        print("delete")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    VStack(alignment: .leading) {
                        Text(".destructive")
                        Text(".borderedProminent")
                    }
                }
                
                HStack {
                    Button("Cancel", role: .cancel) {
                        print("cancel")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.extraLarge)
                    VStack(alignment: .leading) {
                        Text(".cancel")
                        Text(".borderedProminent")
                    }
                }
                
                HStack {
                    Button("Cancel", role: .cancel) {
                        print("delete")
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.extraLarge)
                    VStack(alignment: .leading) {
                        Text(".delete")
                        Text(".borderedProminent")
                    }
                }
            }
        })
        
    }
}

#Preview {
    Chapter5_button()
}
