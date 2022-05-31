//
//  LoginPage.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/30.
//

import SwiftUI

struct LoginPage: View {
    
    @State var phoneNumber : String = ""
    @State var pwd : String = ""
    
    @State var isPwdLogin : Bool = true
    
    @Binding var isLogin : Bool
    var body: some View {
        
        VStack {
            
            HStack(spacing: 8.5) {
                Image("app_logo")
                    .frame(width: 35.0, height: 30.0)
                Text("欢迎使用兴智教育")
                    .font(.system(size: 26))
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                Spacer()
            }.padding(.top,100)
            HStack{
                Text("账号").font(.body)
                TextField("请填写手机号", text: $phoneNumber)
                    .padding(.leading, 35.0)
            }.padding(.top,60)
            Divider()
                .background(.purple)
            
            if isPwdLogin {
                HStack{
                    Text("密码").font(.body)
                    TextField("请填写密码", text: $pwd)
                        .padding(.leading, 35.0)
                }.padding(.top,30)
                
                Divider()
                    .background(.purple)
                
                
                HStack{
                    Button("用短信验证码登录") {
                        isPwdLogin = false
                    }
                    Spacer()
                    Button("忘记密码") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                }
                .padding(.vertical,15)
            }else{
                HStack{
                    Button("用密码登录") {
                        isPwdLogin = true
                    }
                    Spacer()
                    
                }
                .padding(.vertical,15)
            }
            
            Button {
                if isPwdLogin {
                    guard phoneNumber.count != 0 else { return }
                    guard pwd.count != 0 else { return }
                    
                    UserDefaults.standard.set(phoneNumber, forKey: "account")
                    UserDefaults.standard.set(pwd, forKey: "password")
                    isLogin = true
                }else{
                    
                }
            } label: {
                Text(isPwdLogin ? "登录" : "发送验证码")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(.purple)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding(.top,60)
            }
                

            Spacer()
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal,17)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginPage(isLogin: .constant(true))
                .previewLayout(.device)
            LoginPage(isLogin: .constant(false))
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
