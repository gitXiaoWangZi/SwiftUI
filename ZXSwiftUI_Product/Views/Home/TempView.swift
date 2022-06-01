//
//  TempView.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/31.
//

import SwiftUI
import MapKit

struct TempView: View {
    
    var homeListModel = ModelData().homeListModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(alignment: .center){
                Text("**精品课程**")
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
            }.padding(5)
            TabView{
                ForEach(homeListModel.curriculumList) { item in
                    ZStack {
                        Color("homeListBg")
                            .frame(width: UIScreen.main.bounds.width - 20, height: 105, alignment: .center)
                            .cornerRadius(10)
                        
                        HStack(alignment: .top) {
                                
                            LazyHStack(alignment: .bottom) {
                                    AsyncImage(url: URL(string: item.smallImage)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(5)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    
                                    Text("视频课")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .padding(3)
                                        .background(.black.opacity(0.5))
                                        .padding(2)
                                        .cornerRadius(20)
                                        .offset(x:-60)
                                        .padding(.trailing,-60)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.body.weight(.medium))
                                    .padding(10)
                                Text(item.introduce)
                                    .font(.subheadline.weight(.medium))
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                                    .padding(.leading,10)
                                    .padding(.trailing,10)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                    }.padding(.horizontal,10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(width: UIScreen.main.bounds.width,height: 105)
        }
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
