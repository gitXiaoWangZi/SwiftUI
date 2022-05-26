//
//  ContentView.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentIndex = 3
    var body: some View {
        NavigationView{
            TabView(selection: $currentIndex) {
                HomeVC()
                    .tabItem {
                        Image(currentIndex == 0 ? "标签栏_按钮_学习_选中" : "标签栏_按钮_学习_正常")
                        Text("传承")
                    }.tag(0)
                MessageVC()
                    .tabItem {
                        Image(currentIndex == 1 ? "标签栏_按钮_消息_选中" : "标签栏_按钮_消息_正常")
                        Text("消息")
                    }.tag(1)
                AddressVC()
                    .tabItem {
                        Image(currentIndex == 2 ? "标签栏_按钮_通讯录_选中" : "标签栏_按钮_通讯录_正常")
                        Text("通讯录")
                    }.tag(2)
                MeVC()
                    .tabItem {
                        Image(currentIndex == 3 ? "标签栏_按钮_我_选中" : "标签栏_按钮_我_正常")
                        Text("我的")
                    }.tag(3)
            }.accentColor(.purple)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
