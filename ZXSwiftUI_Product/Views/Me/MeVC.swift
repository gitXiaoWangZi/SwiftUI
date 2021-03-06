//
//  MeVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct MeVC: View {
    
    @StateObject var userInfo = UserInfo()
    
    var body: some View {
        
        NavigationView {
            List {
                NavigationLink {
                    PersonalMessageVC().environmentObject(userInfo)
                } label: {
                    MePageHeaderV(icon: "mine_header", name: userInfo.name)
                }
                
                ForEach(homeList){ list in
                    Section{
                        ForEach(list.section) { item in
                            NavigationLink {
                                item.linkView.environmentObject(userInfo)
                            } label: {
                                MeCell(icon: item.imageIcon, content: item.content, isShow: item.isShowLabel)
                            }
                        }
                    }
                }
                
                Button {
                    UserDefaults.standard.removeObject(forKey: "account")
                    isLogin = false
                } label: {
                    Text("退出登录").frame(maxWidth: .infinity)
                }.accentColor(.primary)

                
            }
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true)
        }
    }
}

struct Previews_MeVC_Previews: PreviewProvider {
    static var previews: some View {
        MeVC()
            .preferredColorScheme(.dark)
    }
}
