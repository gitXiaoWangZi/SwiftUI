//
//  ModelData.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/27.
//

import Foundation
import Combine

final class ModelData : ObservableObject {
    
    @Published var landmarks : [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    var homeListModel : HomeListModel = load("HomeListData.json")
}


func load<T : Decodable>(_ filename : String) -> T {
    
    var data : Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder  = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
