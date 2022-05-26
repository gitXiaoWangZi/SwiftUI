//
//  MeCell.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct MeCell: View {
    
    var icon : String
    var content : String
    var isShow : Bool
    
    var body: some View {
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            HStack {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                Text(content)
                    .font(.body).padding(.leading)
                if isShow {
                    Text("撤回")
                        .font(.system(size: 15))
                        .foregroundColor(.white)
                        .frame(width: 40, height: 10)
                        .padding(5)
                        .background(Color.red)
                        .cornerRadius(15)
                }
                Spacer()
                Image("right_arrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 14)
            }
        }
    }
}

struct MeCell_Previews: PreviewProvider {
    static var previews: some View {
        MeCell(icon: "mine_feedback", content: "意见反馈", isShow: true)
    }
}
