//
//  MessageVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct MessageVC: View {
    @StateObject private var modeldata = ModelData()
    var body: some View {
        Form {
            NavigationLink {
                LandmarkList().environmentObject(modeldata)
            } label: {
                Text("地标")
            }
            NavigationLink {
                Badge()
            } label: {
                Text("绘图")
            }
            NavigationLink {
                HikeView(hike: modeldata.hikes[1])
            } label: {
                Text("动画")
            }
            
        }.navigationBarTitleDisplayMode(.large)
    }
}

struct MessageVC_Previews: PreviewProvider {
    static var previews: some View {
        MessageVC()
    }
}
