//
//  Me_HomeList_Model.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import Foundation

struct me_homeList: Identifiable {
    
    var id = UUID()
    var section : [me_homeList_model]
}

struct me_homeList_model : Identifiable {
    var id = UUID()
    
    var index : Int
    var imageIcon : String
    var content : String
    var isShowLabel : Bool
}
