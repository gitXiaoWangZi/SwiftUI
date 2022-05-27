//
//  PersonalMessageVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct PersonalMessageVC: View {
    //    var
    var body: some View {
        List(0..<2) { idx in
            Section{
                if idx == 0 {
                    ForEach(0..<4){ index in
                        if index == 0 {
                            PersonalHeaderView().frame(height:80).background(
                                NavigationLink(destination: MeIconVC(headerIcon: "mine_header")) {}.opacity(0)
                            ).listRowBackground(Color.white)
                        }
                        if index == 1 {
                            PersonalCell(title: "昵称", content: "刘圣洁", isShow: true).frame(height:50).background(
                                NavigationLink(destination: ChangeNickNameVC()) {}.opacity(0)
                            ).listRowBackground(Color.white)
                        }
                        if index == 2 {
                            PersonalCell(title: "账号", content: "15538609637", isShow: false).frame(height:50)
                        }
                        if index == 3 {
                            PersonalCell(title: "性别", content: "", isShow: true).frame(height:50)
                        }
                    }
                }
            }
            //            Section{
            if idx == 1 {
                PersonalCell(title: "修改密码", content: "", isShow: true).frame(height:50)
            }
            //            }
            
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
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            HStack {
                Text("头像").font(.body).padding(.leading)
                Spacer()
                Image("mine_header")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.white,lineWidth: 1))
                    .shadow(radius: 10)
                Image("right_arrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 14)
            }
        }
    }
}


struct PersonalCell : View {
    
    var title : String
    var content : String
    var isShow : Bool
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            HStack {
                Text(title).padding(.leading)
                
                Spacer()
                
                Text(content).foregroundColor(.gray)
                
                if isShow {
                    Image("right_arrow")
                }
                
            }
        }
    }
}

//struct PersonalCell_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonalCell()
//    }
//}
