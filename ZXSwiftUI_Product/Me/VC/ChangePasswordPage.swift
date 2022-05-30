//
//  ChangePasswordPage.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/27.
//

import SwiftUI

struct ChangePasswordPage: View {
    
    var phoneNum : String = "17537722382"
    @State var oldPW : String = ""
    @State var newPW : String = ""
    @State var confirmPW : String = ""
    var body: some View {
        Form{
            VStack(alignment: .leading) {
                HStack{
                    Text("手机号").foregroundColor(.gray)
                    Text(phoneNum).foregroundColor(.gray)
                }.frame(height:50)
                HStack{
                    Text("旧密码")
                    TextField("请输入旧密码", text: $oldPW)
                }.frame(height:50)
                HStack{
                    Text("新密码")
                    TextField("请输入新密码", text: $newPW)
                }.frame(height:50)
                HStack{
                    Text("确认密码")
                    TextField("请输入确认密码", text: $confirmPW)
                }.frame(height:50)
                Text("密码为6-20个字符，切同时包含字母和数字").font(.subheadline).foregroundColor(.gray)
                
            }
        }.navigationTitle("修改密码").toolbar {
            Button {
                guard oldPW.count != 0 else {
                    fatalError("请先输入旧密码")
                }
                guard newPW.count != 0 else {
                    fatalError("请先输入新密码")
                }
                guard confirmPW.count != 0 else {
                    fatalError("请先输入确认密码")
                }
                guard confirmPW != confirmPW else {
                    fatalError("两次输入密码不一致")
                }
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

struct ChangePasswordPage_Previews: PreviewProvider {
    static var previews: some View {
        ChangePasswordPage()
    }
}
