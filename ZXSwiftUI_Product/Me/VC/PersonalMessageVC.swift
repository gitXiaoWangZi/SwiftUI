//
//  PersonalMessageVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct PersonalMessageVC: View {
    //    var
    @EnvironmentObject var userInfo : UserInfo
    var body: some View {
        List(0..<2) { idx in
            if idx == 0 {
                ForEach(0..<4){ index in
                    if index == 0 {
                        NavigationLink {
                            MeIconVC(headerIcon: "mine_header")
                        } label: {
                            PersonalHeaderView().frame(height:80)
                        }
                    }
                    if index == 1 {
                        NavigationLink {
                            ChangeNickNameVC().environmentObject(userInfo)
                        } label: {
                            PersonalCell(title: "昵称", content: userInfo.name)
                        }
                    }
                    if index == 2 {
                        PersonalCell(title: "账号", content: "15538609637")
                    }
                    if index == 3 {
                        NavigationLink {
                            SexPage(isSelectMan: true).environmentObject(userInfo)
                        } label: {
                            PersonalCell(title: "性别", content: userInfo.sex)
                        }
                    }
                }
            }
            
            if idx == 1 {
                NavigationLink {
                    ChangePasswordPage()
                } label: {
                    PersonalCell(title: "修改密码", content: "")
                }
            }
            
        }.navigationTitle(Text("个人信息")).navigationBarTitleDisplayMode(.inline)//.listStyle(.grouped)
    }
}

struct PersonalMessageVC_Previews: PreviewProvider {
    static var previews: some View {
        PersonalMessageVC()
    }
}

struct PersonalHeaderView : View {
    var body: some View {
        HStack {
            Text("头像").font(.body).padding(.leading)
            Spacer()
            Image("mine_header")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white,lineWidth: 1))
                .shadow(radius: 10)
        }
    }
}


struct PersonalCell : View {
    
    var title : String
    var content : String
    var body: some View {
        HStack {
            Text(title).padding(.leading)
            
            Spacer()
            
            Text(content).foregroundColor(.gray)
            
        }
    }
}
