//
//  AddressVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct AddressVC: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 50)
            }
            .overlay(
                NavigationBar(rightNavIcon: "phone.and.waveform", title: "通讯录")
            )
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 55)
            }
    }
}

struct AddressVC_Previews: PreviewProvider {
    static var previews: some View {
        AddressVC()
    }
}
