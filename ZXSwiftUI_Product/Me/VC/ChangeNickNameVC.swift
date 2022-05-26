//
//  ChangeNickNameVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct ChangeNickNameVC: View {
    
    @State var nickNake : String = ""
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack{
                TextField("修改昵称", text: $nickNake).padding().background(Color.white)
                Text("\(nickNake)")
                Spacer()
            }
            
        }.navigationTitle("修改姓名").toolbar {
            Button {
                
            } label: {
                Text("保存").foregroundColor(.white).frame(width: 70, height: 35).background(Color.purple).font(.body)
            }.cornerRadius(8)

        }
    }
}

struct ChangeNickNameVC_Previews: PreviewProvider {
    static var previews: some View {
        ChangeNickNameVC()
    }
}
