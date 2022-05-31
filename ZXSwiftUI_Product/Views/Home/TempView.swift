//
//  TempView.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/31.
//

import SwiftUI

struct TempView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center){
                Text("精品课程")
                    .font(.body.weight(.medium))
                    .foregroundColor(.primary)
                    .padding(.leading,10)
                Spacer()
                
                NavigationLink {
                    ChangeNickNameVC()
                } label: {
                    HStack(spacing: 2) {
                        Text("更多")
                            .foregroundColor(.primary)
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 15, alignment: .center)
                            .foregroundColor(.secondary)
                    }
                    .padding(.trailing,10)
                    .padding(.vertical,10)
                }
            }
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 10) {
                    ForEach(0 ..< 5) { item in
                        VStack {
                            ZStack(alignment: .bottomLeading) {
                                Image("")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: .infinity)
                                    .background(.red)
                                    .cornerRadius(10)
                                
                                Image("learn_video_play")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: .infinity)
                                    .frame(width:20,height: 20)
                                    .padding(5)
                            }.frame(height: 90)
                            
                            Text("2021.1.12第一案例降低")
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .padding(3)
                                .lineLimit(2)
                        }.frame(width: 90)
                    }
                }.padding(.leading,10)
            }
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
