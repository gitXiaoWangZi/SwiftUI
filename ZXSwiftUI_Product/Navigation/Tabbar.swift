//
//  Tabbar.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/29.
//

import SwiftUI

struct Tabbar: View {
    
    @AppStorage("currentTab") var currentTab : Tab = .book
    @State var currentColor : Color = Color("book")
    @State var tabItemWidth : CGFloat = 0
    
    var body: some View {
        
        HStack {
            buttons
        }
        .padding(.horizontal,8)
        .padding(.top, 14)
        .frame(height: 88,alignment: .top)
        .background(
            .ultraThinMaterial, in: RoundedRectangle(cornerRadius: 44, style: .continuous)
        )
        .background(
            background
        )
        .overlay(
            overlay
        )
        .frame(maxHeight:.infinity,alignment: .bottom)
        .ignoresSafeArea()
    }
    
    var buttons : some View {
        ForEach(tabItems) { item in
            
            Button {
                withAnimation(.spring(response: 0.2, dampingFraction: 0.7)) {
                    currentTab = item.tab
                    currentColor = item.color
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(currentTab == item.tab ? .fill : .none)
                        .font(.body.bold())
                        .frame(width: tabItemWidth, height: 29)
                    Text(item.text)
                        .font(.caption2)
                }.frame(maxWidth: .infinity)
            }
            .foregroundStyle(currentTab == item.tab ? .primary : .secondary)
            .blendMode(currentTab == item.tab ? .overlay : .normal)
            .overlay(
                
                GeometryReader(content: { proxy in
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
                              )
            ).onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
    
    var background : some View{
        HStack{
            if currentTab == .person { Spacer() }
            if currentTab == .message { Spacer() }
            if currentTab == .phone {
                Spacer()
                Spacer()
            }
            
            Circle().fill(currentColor).frame(width: tabItemWidth)
            
            if currentTab == .message {
                Spacer()
                Spacer()
            }
            if currentTab == .phone { Spacer() }
            if currentTab == .book { Spacer() }
        }.padding(.horizontal,8)
    }
    
    var overlay : some View {
        HStack{
            if currentTab == .person { Spacer() }
            if currentTab == .message { Spacer() }
            if currentTab == .phone {
                Spacer()
                Spacer()
            }
            
            Rectangle().fill(currentColor).frame(width: 30, height: 7).cornerRadius(3).frame(width: tabItemWidth).frame(maxHeight: .infinity, alignment: .top)
            
            if currentTab == .message {
                Spacer()
                Spacer()
            }
            if currentTab == .phone { Spacer() }
            if currentTab == .book { Spacer() }
        }.padding(.horizontal,8)
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
            .previewInterfaceOrientation(.portrait)
    }
}
