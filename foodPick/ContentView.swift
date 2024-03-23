//
//  ContentView.swift
//  foodPick
//
//  Created by weiensong on 2024/3/23.
//


import SwiftUI

struct ContentView: View {
    let food = ["麻辣烫", "煎饼果子", "豆腐脑", "炸酱面", "卤肉饭",
                 "生煎包", "臭豆腐", "小笼包", "扬州炒饭", "北京炸酱面",
                 "麻辣香锅", "锅盔", "肉夹馍", "烤冷面", "油条",
                 "糖火烧", "老北京炸酱面", "螺蛳粉","臭干子","黄焖鸡米饭",
                 "油泼面", "灌汤包", "羊肉泡馍", "大包子", "牛肉拉面",
                 "甜麻花", "米线", "酸辣粉", "肉饼", "花卷"]
    @State private var pickedFood: String?
    
    var body: some View {
        VStack(spacing: 30) {
            Text("今天吃什么？")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            if pickedFood != .none {
                Text(pickedFood ?? "")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.green)
            }
            
            Button {
                pickedFood = food.shuffled().filter{
                    $0 != pickedFood
                }.first
            } label: {
                Text("选一个").frame(width: 150)
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
        .frame(maxHeight: .infinity)
        .padding()
        .background(Color(.secondarySystemBackground))
        .buttonBorderShape(.capsule)
        .animation(.easeInOut, value: pickedFood)
        
    }
}

#Preview {
    ContentView()
}
