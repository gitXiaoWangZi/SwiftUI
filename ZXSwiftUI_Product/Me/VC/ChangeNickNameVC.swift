//
//  ChangeNickNameVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct ChangeNickNameVC: View {
    
    @EnvironmentObject var userInfo : UserInfo
    @State var nickNake : String = ""
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.all)
            
            VStack{
                TextField("修改昵称", text: $nickNake).padding().background(Color.white)
                Text("\(nickNake)")
                Spacer()
            }
            
        }.navigationTitle("修改姓名").toolbar {
            Button {
                userInfo.name = nickNake
                UserDefaults.standard.set(nickNake, forKey: "name")
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

struct ChangeNickNameVC_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNickNameVC()
    }
}
