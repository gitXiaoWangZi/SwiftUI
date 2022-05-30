//
//  Tabbar.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/29.
//

import SwiftUI

struct Tabbar: View {
    
    @State var currentTab : Tab = .book
    @State var currentColor : Color = Color("book")
    var body: some View {
        ZStack(alignment: .bottom){
            switch currentTab {
            case .book:
                HomeVC()
            case .message:
                MessageVC()
            case .phone:
                AddressVC()
            case .person:
                MeVC()
            }
            
            HStack {
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
                                .frame(width: 88, height: 29)
                            Text(item.text)
                                .font(.caption2)
                        }.frame(maxWidth: .infinity)
                    }.foregroundStyle(currentTab == item.tab ? .primary : .secondary)
                }
            }
            .padding(.horizontal,8)
            .padding(.top, 14)
            .frame(height: 88,alignment: .top)
            .background(
                .ultraThinMaterial, in: RoundedRectangle(cornerRadius: 44, style: .continuous)
            )
            .background(
                HStack{
                    if currentTab == .person { Spacer() }
                    if currentTab == .message { Spacer() }
                    if currentTab == .phone {
                        Spacer()
                        Spacer()
                    }
                    
                    Circle().fill(currentColor).frame(width: 88)
                    
                    if currentTab == .message {
                        Spacer()
                        Spacer()
                    }
                    if currentTab == .phone { Spacer() }
                    if currentTab == .book { Spacer() }
                }.padding(.horizontal,8)
            )
            .overlay(
                HStack{
                    if currentTab == .person { Spacer() }
                    if currentTab == .message { Spacer() }
                    if currentTab == .phone {
                        Spacer()
                        Spacer()
                    }
                    
                    Rectangle().fill(currentColor).frame(width: 30, height: 7).cornerRadius(3).frame(width: 88).frame(maxHeight: .infinity, alignment: .top)
                    
                    if currentTab == .message {
                        Spacer()
                        Spacer()
                    }
                    if currentTab == .phone { Spacer() }
                    if currentTab == .book { Spacer() }
                }.padding(.horizontal,8)
            )
            .frame(maxHeight:.infinity,alignment: .bottom)
            .ignoresSafeArea()
            
            
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
            .previewInterfaceOrientation(.portrait)
    }
}
