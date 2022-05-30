//
//  modifier.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/28.
//

import SwiftUI

struct TextStyles : ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    var color : Color
    func body(content: Content) -> some View {
        content
            .font(.system(size: 11))
            .foregroundColor(color)
            .frame(width: 25, height: 8)
            .padding(5)
            .background(colorScheme == .dark ? Color.yellow : .red)
            .mask({
                RoundedRectangle(cornerRadius: 5,style: .continuous)
            })
    }
}


extension View {
    
    func textTyle(color : Color = .white) -> some View {
        modifier(TextStyles(color: color))
    }
}
