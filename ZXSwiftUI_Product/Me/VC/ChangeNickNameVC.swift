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
        VStack{
            TextField("修改昵称", text: $nickNake).padding()
            Text("\(nickNake)")
            Spacer()
        }.navigationTitle("修改姓名").toolbar {
            Button {
                userInfo.name = nickNake
                UserDefaults.standard.set(nickNake, forKey: "name")
            } label: {
                Text("保存")
                    .foregroundStyle(.white)
                    .font(.system(size: 13))
                    .frame(width: 65, height: 30)
                    .background(Color.purple)
                    .cornerRadius(4)
            }

        }
    }
}

struct ChangeNickNameVC_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChangeNickNameVC()
            ChangeNickNameVC()
                .preferredColorScheme(.dark)
        }
    }
}
