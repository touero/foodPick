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
    @State private var showInfo: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 30) {
                
                Group {
                    if pickedFood != .none {
                        Text(pickedFood!.image)
                            .font(.system(size: 200))
                            .minimumScaleFactor(0.1)
                            .lineLimit(1)
                    } else {
                        Image("icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                }.frame(height: 250)
                
                Text("选一个东西尝试一下吧！")
                    .font(.title)
                    .bold()
                
                if pickedFood != .none {
                    HStack {
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
                        Button {
                            showInfo.toggle()
                        } label: {
                            Image(systemName: "info.circle.fill")
                                .foregroundColor(.secondary)
                        }.buttonStyle(.plain)
                        
                    }
                    
                    Text("热量 \(pickedFood!.calorie.formatted())卡").font(.title2)
                    
                    VStack {
                        if showInfo {
                            Grid(horizontalSpacing: 12, verticalSpacing: 12){
                                GridRow{
                                    Text("蛋白质")
                                    Text("脂肪")
                                    Text("碳水")
                                }.frame(minWidth: 60)
                                
                                Divider()
                                    .gridCellUnsizedAxes(.horizontal)
                                    .padding(.horizontal)
                                
                                GridRow{
                                    Text("\(pickedFood!.protein.formatted())克")
                                    Text("\(pickedFood!.fat.formatted())克")
                                    Text("\(pickedFood!.carb.formatted())克")
                                }
                            }
                            .font(.title3)
                            .padding(.horizontal)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color(.systemBackground)))
                            .transition(.move(edge: .top).combined(with: .opacity))
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .clipped()
                }
                Spacer().layoutPriority(1)
                
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
                    showInfo = false
                } label: {
                    Text("重置").frame(width: 150)
                }
                .font(.title3)
                .buttonStyle(.bordered)
                
                
            }
            .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height - 120)
            .padding()
            .buttonBorderShape(.capsule)
            .animation(.easeInOut(duration: 0.6), value: pickedFood)
            .animation(.spring(dampingFraction: 0.5), value: showInfo)
        }
        .background(Color(.secondarySystemBackground))
        
    }
}

#Preview {
    ContentView()
}
