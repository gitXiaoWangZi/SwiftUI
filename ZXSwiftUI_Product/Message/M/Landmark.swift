//
//  Landmark.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/27.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark : Codable,Identifiable {
    var id : Int
    var name : String
    var category : String
    var city : String
    var state : String
    var isFeatured : Bool
    var isFavorite : Bool
    var park : String
    var description : String
    
    private var imageName : String
    var image : Image {
        Image(imageName)
    }
    
    private var coordinates : Coordinates
    var locationCoordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates : Codable {
        var longitude : Double
        var latitude : Double
    }
}
