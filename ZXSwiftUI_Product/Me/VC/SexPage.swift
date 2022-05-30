//
//  SexPage.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/27.
//

import SwiftUI

struct SexPage: View {
    
    @EnvironmentObject var userInfo : UserInfo
    @State var isSelectMan : Bool = true
    @State var isShow : Bool = false
    var body: some View {
        
        Form{
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                HStack{
                    Text("男")
                    Spacer()
                    if isSelectMan && isShow {
                        Label("Toggle Favorite", systemImage:"star.fill")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.yellow)
                    }
                }
            }.onTapGesture {
                isShow = true
                isSelectMan = true
            }
            ZStack{
                Color.white.edgesIgnoringSafeArea(.all)
                HStack{
                    Text("女")
                    Spacer()
                    if !isSelectMan && isShow {
                        Label("Toggle Favorite", systemImage:"star.fill")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.yellow)
                    }
                }
            }.onTapGesture {
                isShow = true
                isSelectMan = false
            }
        }.navigationTitle("修改性别").toolbar {
            Button {
                userInfo.sex = isSelectMan ? "男" : "女"
                UserDefaults.standard.set(userInfo.sex, forKey: "sex")
            } label: {
                Text("保存")
                    .foregroundStyle(.white)
                    .frame(width: 70, height: 35)
                    .background(Color.purple)
                    .font(.body)
                    .mask {
                        RoundedRectangle(cornerRadius: 8, style: .continuous)
                    }
            }

        }
    }
}

struct SexPage_Previews: PreviewProvider {
    static var previews: some View {
        SexPage()
    }
}
