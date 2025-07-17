//
//  ContentView.swift
//  Memorize
//
//  Created by mart S on 2025/7/15.
//

import SwiftUI

//函数式编程：只是封装行为
struct ContentView: View {  // :behave like a View
    // View 不是 struct 是 protocol 协议
    // var i: Int // Int 是 struct
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
        .padding()  //
        
    }   // Computed Property
}

// 橙色描边的卡片
struct CardView: View {
    @State var isFaceUp = false // temporary state
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.foregroundColor(.white)
                base // 无法同时填充白色和描边
                    .stroke(lineWidth: 2)   //.stroke(style: StrokeStyle(lineWidth: 10, dash: [10,2]))
                Text("👻").font(.largeTitle)
            }   // ZStack的内容是一袋乐高积木: TupleView
                //实际上是ZStack的参数 <=> ZStack(content:{...})
            else {
                base // 没有指定颜色所以外面的颜色会渗透进来
            }
        }   // ZStack 初始化器的 content 参数用到了 @ViewBuilder 这个 “结果构建器”，将 Views 转换为 TupleView
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
