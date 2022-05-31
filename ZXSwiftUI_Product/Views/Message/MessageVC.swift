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
        NavigationView {
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
                NavigationLink {
                    MessageSFInfo(isDelete: false)
                } label: {
                    Text("SF")
                }
            }
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 50)
            }
            .navigationBarHidden(true).overlay(
                NavigationBar(title: "消息")
            )
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 55)
            }
        }
        
    }
}

struct MessageVC_Previews: PreviewProvider {
    static var previews: some View {
        MessageVC()
    }
}
