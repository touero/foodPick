//
//  Food.swift
//  foodPick
//
//  Created by weiensong on 2024/3/23.
//

import Foundation

struct Food: Equatable {
    var name: String
    var image: String
    var calorie: Double
    var carb: Double
    var fat: Double
    var protein: Double
    
    static let all = [
        Food(name: "葡萄", image: "🍇", calorie: 69, carb: 18, fat: 0.4, protein: 0.6),
        Food(name: "西瓜", image: "🍉", calorie: 30, carb: 8, fat: 0.2, protein: 0.6),
        Food(name: "菠萝", image: "🍍", calorie: 50, carb: 13.1, fat: 0.1, protein: 0.5),
        Food(name: "玉米", image: "🌽", calorie: 86, carb: 19, fat: 1.2, protein: 3.3),
        Food(name: "土豆", image: "🥔", calorie: 77, carb: 17, fat: 0.1, protein: 2),
        Food(name: "黄瓜", image: "🥒", calorie: 15, carb: 3.6, fat: 0.1, protein: 0.7),
        Food(name: "绿叶蔬菜", image: "🥬", calorie: 15, carb: 2.9, fat: 0.2, protein: 1.6),
        Food(name: "面包", image: "🍞", calorie: 265, carb: 49, fat: 3, protein: 9),
        Food(name: "披萨", image: "🍕", calorie: 266, carb: 33, fat: 10, protein: 11),
        Food(name: "煎蛋", image: "🍳", calorie: 196, carb: 1.3, fat: 14.8, protein: 13.6),
        Food(name: "爆米花", image: "🍿", calorie: 375, carb: 77, fat: 4.3, protein: 9.2),
        Food(name: "排骨", image: "🍖", calorie: 250, carb: 0, fat: 18, protein: 22),
        Food(name: "米饭", image: "🍚", calorie: 130, carb: 28.2, fat: 0.3, protein: 2.6),
        Food(name: "月饼", image: "🥮", calorie: 135, carb: 22, fat: 4, protein: 3),
        Food(name: "饺子", image: "🥟", calorie: 250, carb: 35, fat: 10, protein: 8),
        Food(name: "面条", image: "🍜", calorie: 138, carb: 27, fat: 1.5, protein: 4.3),
        Food(name: "啤酒", image: "🍺", calorie: 43, carb: 3.6, fat: 0, protein: 0.5)
    ]
}
