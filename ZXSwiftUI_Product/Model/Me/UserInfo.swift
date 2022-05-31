//
//  UserInfo.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/27.
//

import Foundation

class UserInfo : ObservableObject {
    @Published var account = UserDefaults.standard.string(forKey: "account") ?? ""
    @Published var password = UserDefaults.standard.string(forKey: "password") ?? ""
    
    
    @Published var name = UserDefaults.standard.string(forKey: "name") ?? "刘圣洁"
    
    
    @Published var sex : String = UserDefaults.standard.string(forKey: "sex") ?? "男"
}

var isLogin : Bool {
    set{
        isLogin = newValue
    }
    get{
        return (UserDefaults.standard.string(forKey: "account") != nil) ? true : false
    }
}
