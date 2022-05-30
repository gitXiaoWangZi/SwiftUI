//
//  MePageHeaderV.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct MePageHeaderV: View {
    
    var icon : String = "hiddenlake"
    var name : String = "ds"
    var body: some View {
        VStack{
            Spacer(minLength: 60)
            HStack{
                Image(icon)
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .leading)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    .mask({
                        Circle()
                    })
                Text(name)
                    .font(.title)
                    .padding(.leading)
                Spacer()
                Image("right_arrow")
                    .resizable()
                    .frame(width: 8, height: 14, alignment: .leading)
            }
        }
    }
}

struct MePageHeaderV_Previews: PreviewProvider {
    static var previews: some View {
        MePageHeaderV()
    }
}
