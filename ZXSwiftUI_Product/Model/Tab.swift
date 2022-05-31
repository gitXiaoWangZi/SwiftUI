//
//  Tab.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/29.
//

import SwiftUI

struct TabItem : Identifiable {
    var id = UUID()
    
    var text : String
    var icon : String
    var tab : Tab
    var color : Color
}


var tabItems = [
    TabItem(text: "传承", icon: "book", tab: .book,color: Color("book")),
    TabItem(text: "消息", icon: "message", tab: .message,color: Color("message")),
    TabItem(text: "通讯录", icon: "phone", tab: .phone,color: Color("address")),
    TabItem(text: "我的", icon: "person", tab: .person,color: Color("me"))
]

enum Tab : String {
    case book
    case message
    case phone
    case person
}

struct TabPreferenceKey : PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
