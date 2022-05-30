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
        HStack(alignment: .center) {
            Image(icon)
                .renderingMode(.original)
                .resizable()
                .frame(width: 20, height: 20)
            Text(content).font(.body)
                .multilineTextAlignment(.leading).lineLimit(1).padding(.leading)
            if isShow {
                Text("撤回")
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .textTyle()
            }
            Spacer()
        }
    }
}

struct MeCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MeCell(icon: "mine_feedback", content: "意见反馈", isShow: true)
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                .previewLayout(.sizeThatFits)
                .previewDevice("iPhone 13 mini")
                .background()
            MeCell(icon: "mine_feedback", content: "意见反馈", isShow: true)
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                .previewLayout(.sizeThatFits)
                .previewDevice("iPhone 13 mini")
                .background()
        }
    }
}
