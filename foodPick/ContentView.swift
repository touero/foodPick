//
//  ContentView.swift
//  foodPick
//
//  Created by weiensong on 2024/3/23.
//


import SwiftUI

struct ContentView: View {
    let food = Food.all
    @State private var pickedFood: Food?
    
    var body: some View {
        VStack(spacing: 30) {
            Text("选一个东西尝试一下吧！")
                .font(.title)
                .bold()
            
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            if pickedFood != .none {
                Text(pickedFood!.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
                    .id(pickedFood!.name)
                    .transition(.asymmetric(
                        insertion: .opacity
                            .animation(.easeInOut(duration: 0.5).delay(0.2)),
                        removal: .opacity
                            .animation(.easeInOut(duration: 0.4))))
//                    .transition(.scale.combined(with: .slide))
            }
            
            Button {
                pickedFood = food.shuffled().filter{
                    $0 != pickedFood
                }.first
            } label: {
                Text(pickedFood == .none ? "选一个" : "换一个")
                    .frame(width: 150)
                    .animation(.none, value: pickedFood)
                    .transformEffect(/*@START_MENU_TOKEN@*/.identity/*@END_MENU_TOKEN@*/)
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .buttonStyle(.borderedProminent)
            .padding(.bottom, -15)
            .controlSize(.large)
            
            Button {
                pickedFood = .none
            } label: {
                Text("重置").frame(width: 150)
            }
            .font(.title3)
            .buttonStyle(.bordered)
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color(.secondarySystemBackground))
        .buttonBorderShape(.capsule)
        .animation(.easeInOut(duration: 0.6), value: pickedFood)
        
    }
}

#Preview {
    ContentView()
}
