//
//  Me_HomeList_Model.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import Foundation
import SwiftUI

struct me_homeList_model : Identifiable {
    var id = UUID()
    
    var itemName : itemIdenti
    var imageIcon : String
    var content : String
    var isShowLabel : Bool
    var linkView : AnyView
}

struct me_homeList: Identifiable {
    
    var id = UUID()
    var section : [me_homeList_model]
}

var homeList : [me_homeList] {
    
    let item0 = me_homeList_model(itemName:.开营通知书,imageIcon: "mine_section_0", content: "开营通知书", isShowLabel: false,linkView: AnyView(MessageVC()))
    let item1 = me_homeList_model(itemName:.线下工作坊,imageIcon: "mine_section_0_1", content: "线下工作坊", isShowLabel: false,linkView: AnyView(HomeVC()))
    let section0 = me_homeList(section: [item0,item1])
        
    let item2 = me_homeList_model(itemName:.家庭档案,imageIcon: "mine_section_1", content: "家庭档案", isShowLabel: false,linkView: AnyView(PersonalMessageVC()))
    let item3 = me_homeList_model(itemName:.我的积分,imageIcon: "mine_section_2", content: "我的积分", isShowLabel: false,linkView: AnyView(MessageVC()))
    let item4 = me_homeList_model(itemName:.我的收藏,imageIcon: "mine_collect", content: "我的收藏", isShowLabel: false,linkView: AnyView(MessageVC()))
    let section1 = me_homeList(section: [item2,item3,item4])
        
    let item5 = me_homeList_model(itemName:.意见反馈,imageIcon: "mine_feedback", content: "意见反馈", isShowLabel: false,linkView: AnyView(MessageVC()))
    let section2 = me_homeList(section: [item5])
        
    let item6 = me_homeList_model(itemName:.隐私协议,imageIcon: "mine_section_3_0", content: "隐私协议", isShowLabel: true,linkView: AnyView(MessageVC()))
    let section3 = me_homeList(section: [item6])
        
    return [section0,section1,section2,section3]
}

enum itemIdenti : String {
    case 开营通知书
    case 线下工作坊
    case 家庭档案
    case 我的积分
    case 我的收藏
    case 意见反馈
    case 隐私协议
}
