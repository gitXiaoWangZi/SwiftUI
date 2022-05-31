//
//  HomeVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct HomeVC: View {
    
    @State var currentPage : Int = 0
    var imageArr : [String] = ["banner","edu_audio_bg","banner1"]
    @State var total : Int = 0
    var body: some View {
        NavigationView {
            ScrollView {
                //轮播图
                headerScroll
                //学习任务
                studyTask
                //冥想
                thinking
                //案例会直播
                Living
                //精品案例会
                highQuality
                //精品课程
                course
                //精选话题
                topic
            }
        }
    }
    
    ///MARK - 头部轮播图
    var headerScroll : some View {
        TabView {
            ForEach(0..<2,id: \.self) { idx in
                Image("banner")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 40, height: 135)
                    .cornerRadius(20)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(maxWidth: .infinity,maxHeight: 135)
        .frame(height: 135)
    }
    
    var studyTask : some View {
        VStack(spacing: 0) {
            HStack(alignment: .center){
                Text("本周学习任务")
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
            
            TabView {
                ForEach(0..<2,id: \.self) { idx in
                    VStack{
                        ForEach(0..<3,id: \.self) { index in
                            HStack(alignment:.center,spacing: 10){
                                Image("topic_reply")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 44, height: 44)
                                VStack(alignment: .leading,spacing: 0){
                                    Text("的近似的计算几点睡觉滴大祭iej")
                                        .frame(height: 25)
                                    Text("近似的计算\(index)")
                                        .foregroundColor(.secondary)
                                        .font(.footnote)
                                        .frame(height: 25)
                                }
                                Spacer()
                            }
                            .padding(.horizontal,20)
                            .frame(height:55)
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(maxWidth: .infinity,maxHeight: 200)
            .frame(height: 200)
        }
    }
    
    var thinking : some View {
        VStack(spacing: 0) {
            HStack(alignment: .center){
                Text("冥想")
                    .font(.body.weight(.medium))
                    .foregroundColor(.primary)
                    .padding(.leading,10)
                Spacer()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 10) {
                        ForEach(0 ..< 5) { item in
                            ZStack(alignment: .center) {
                                Color.yellow.cornerRadius(11)
                                
                                Text("#第一案例降低#")
                                    .font(.footnote)
                                    .foregroundColor(.primary)
                                    .padding(.horizontal,20)
                            }.frame(height: 23)
                        }
                    }.padding(.leading,10)
                }
            }.padding(.bottom,10)
            
            VStack(spacing:0) {
                
                ForEach(0 ..< 3) { item in
                    HStack{
                        Image("learn_home_muse_play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .padding(10)
                        
                        Text("熬夜速睡*8分钟男熬夜速睡*8分钟男生")
                            .foregroundColor(.primary)
                            .font(.body)
                            .lineLimit(1)
                            .padding(.trailing,10)
                        
                        Spacer()
                    }
                }
            }
        }
    }
    
    var Living : some View {
        VStack(spacing: 0) {
            HStack(alignment: .center){
                Text("案例会直播")
                    .font(.body.weight(.medium))
                    .foregroundColor(.primary)
                    .padding(.leading,10)
                Spacer()
                
                NavigationLink {
                    ChangeNickNameVC()
                } label: {
                    HStack(spacing: 2) {
                        Image(systemName: "arrow.clockwise")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 15, alignment: .center)
                            .foregroundColor(.secondary)
                        Text("刷新")
                            .foregroundColor(.primary)
                            .font(.subheadline)
                    }
                    .padding(.trailing,10)
                    .padding(.vertical,10)
                }
            }
            TabView{
                ForEach(0 ..< 5,id: \.self) { item in
                    ZStack {
                        Image("")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 20, height: 140, alignment: .center)
                            .background(.yellow)
                        
                        VStack(alignment: .leading,spacing: 5) {
                            HStack(spacing: 0) {
                                Image("learn_liveing")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:20,height: 20)
                                Text("直播中")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.leading,5)
                            }
                            .padding(5)
                            .background(.black.opacity(0.5))
                            Spacer()
                            Text("竹山夹袄地势低his")
                                .foregroundColor(.white)
                                .padding(.leading,10)
                            HStack {
                                Text("2022-10-03").font(.footnote).foregroundColor(.white).padding(.leading,10)
                                Spacer()
                                Image("learn_home_people")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                Text("29")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.trailing,10)
                            }.padding(.bottom,5)
                        }
                    }.padding(10)
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(maxWidth: .infinity,maxHeight: 140)
                .frame(height: 140)
        }
    }
    
    var highQuality : some View {
        VStack(spacing: 0) {
            HStack(alignment: .center){
                Text("精品案例会")
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
                            }.frame(height: 105)
                            
                            Text("2021.1.12第一案例降低")
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .padding(3)
                                .lineLimit(2)
                        }.frame(width: 105)
                    }
                }.padding(.leading,10)
            }
        }
    }
    
    var course : some View {
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
            }.padding(5)
            TabView{
                ForEach(0 ..< 5) { item in
                    ZStack {
                        Color.yellow
                            .frame(width: UIScreen.main.bounds.width - 20, height: 105, alignment: .center)
                            .cornerRadius(10)
                        
                        HStack(alignment: .top) {
                            ZStack(alignment: .bottomTrailing) {
                                Image("")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: .infinity)
                                    .frame(width:100)
                                    .background(.red)
                                
                                Text("视频课")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(3)
                                    .background(.black.opacity(0.5))
                                    .padding(2)
                                    .cornerRadius(5)
                            }
                            
                            VStack(alignment: .leading) {
                                Text("幸福到场")
                                    .font(.body.weight(.medium))
                                    .padding(.top,10)
                                    .padding(5)
                                Text("大咖驾到，带你知己教育真相")
                                    .font(.subheadline.weight(.medium))
                                    .foregroundColor(.secondary)
                                    .padding(5)
                            }
                            
                            Spacer()
                        }
                    }.padding(.horizontal,10)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(maxWidth: .infinity,maxHeight: 105)
            .frame(height: 105)
        }
    }
    
    var topic : some View {
        VStack(spacing: 0) {
            HStack(alignment: .center){
                Text("精选话题")
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
                        ZStack(alignment: .center) {
                            Color.yellow.cornerRadius(17)
                            
                            Text("#2021.1.12第一案例降低#")
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .padding(.horizontal,20)
                        }.frame(height: 35)
                    }
                }.padding(.leading,10)
            }
        }
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
            .previewLayout(.sizeThatFits)
    }
}
