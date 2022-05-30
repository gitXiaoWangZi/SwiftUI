//
//  ZXSwiftUI_ProductApp.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

@main
struct ZXSwiftUI_ProductApp: App {
    
    
    @State var isLogina : Bool = isLogin
    var body: some Scene {
        WindowGroup {
            if isLogina {
                Tabbar()
            }else{
                LoginPage(isLogin: $isLogina)
            }
        }
    }
}
