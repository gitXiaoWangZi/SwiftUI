//
//  HomeListModel.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/31.
//

import SwiftUI

struct HomeListModel : Codable {
    var bannerList : [bannerItem]
    var continueList : [continueItem]
    var liveList : [liveItem]
    var liveGoodList : [liveGoodItem]
    var mailNum : Int
    var topicList : [topicItem]
    var curriculumList : [curriculumItem]
    var museTypeList : [museTypeItem]
}

struct bannerItem : Codable,Identifiable {
    var id : String
    var name : String
    var status : Int
    var createdAt : String
    var updatedAt : String
    var imageUrl : String
    var dataType : Int
    var jumpUrl : String
    var orderNum : Int
}

struct continueItem : Codable,Identifiable {
    var id : String
    var name : String
    var type : Int
    var createdAt : String
    var imageUrl : String
    var orderNo : Int
}

struct liveItem : Codable,Identifiable {
    var id : String
    var name : String
    var coachId : String
    var liveTime : String
    var liveStatus : Int
    var userCount : Int
    var coachName : String
    var coachImage : String
    var liveTimeStr : String
}

struct liveGoodItem : Codable,Identifiable {
    var id : String
    var name : String
    var updatedAt : String
    var backUrl : String
    var liveTypeId : String
    var liveTimeStr : String
    var liveTypeName : String
}

struct topicItem : Codable,Identifiable {
    var id : String
    var name : String
    var status : Int
    var createdAt : String
    var updatedAt : String
    var num : Int
    var hot : Int
    var content : String
    var stage : String
}

struct curriculumItem : Codable,Identifiable {
    var id : String
    var name : String
    var status : Int
    var type : Int
    var createdAt : String
    var updatedAt : String
    var introduce : String
    var smallImage : String
    var showImage : String
    var feeStatus : Int
    var authorName : String
    var authorTitle : String
    var orderNum : Int
}

struct museTypeItem : Codable,Identifiable {
    
    var id : String
    var name : String
    var status : Int
    var orderNo : Int
    var updatedAt : String
    var museList : [museItem]
}

struct museItem : Codable,Identifiable {
    
    var id : String
    var name : String
    var status : Int
    var createdAt : String
    var updatedAt : String
    var museTypeId : String
    var mideaUrl : String
}


