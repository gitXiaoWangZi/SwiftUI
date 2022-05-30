//
//  UserInfo.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/27.
//

import Foundation

class UserInfo : ObservableObject {
    @Published var name = UserDefaults.standard.string(forKey: "name") ?? "d"
    @Published var sex : String = UserDefaults.standard.string(forKey: "sex") ?? "男"
}
