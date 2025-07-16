//
//  ContentView.swift
//  Memorize
//
//  Created by mart S on 2025/7/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
            // 也可循环实现
            // 不要让函数和计算变量的代码超过20行，最好12行
        }
        .foregroundColor(.orange)
        .padding()
        
    }
}

// 橙色描边的卡片
struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12) // 无法同时填充白色和描边
                    .stroke(lineWidth: 2)   //.stroke(style: StrokeStyle(lineWidth: 10, dash: [10,2]))
                Text("👻").font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12) // 没有指定颜色所以外面的颜色会渗透进来
            }
            
        }
    }
}

#Preview {
    ContentView()
}
