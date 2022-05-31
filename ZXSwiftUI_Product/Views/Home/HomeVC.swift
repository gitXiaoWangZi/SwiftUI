//
//  HomeVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI
import AVFoundation
import SDWebImageSwiftUI

struct HomeVC: View {
    
    @State var currentPage : Int = 0
    var imageArr : [String] = ["banner","edu_audio_bg","banner1"]
    @State var total : Int = 0
    
    @State var selectMuseTypeModel : museTypeItem = ModelData().homeListModel.museTypeList[0]
    @State var selectMuseItem : museItem = ModelData().homeListModel.museTypeList[0].museList[0]
    
    var homeListModel = ModelData().homeListModel
    
    @State var audioPlayer : AVAudioPlayer = AVAudioPlayer()
    @State var isPlay : Bool = false
    @State var isShowPlayView : Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom){
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
                
                if isShowPlayView {
                    //音频播放试图
                    audioView
                }
                
            }
            .navigationBarHidden(true)
            .safeAreaInset(edge: .top) {
                Color.clear.frame(height: 50)
            }
            .overlay(
                NavigationBar(rightNavIcon: "envelope",leftNavIcon: "mine_header",leftDes: "是hiHi好hi")
            )
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 55)
            }
        }
    }
    
    ///MARK - 头部轮播图
    var headerScroll : some View {
        TabView {
            ForEach(homeListModel.bannerList) { model in
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
                        ForEach(homeListModel.museTypeList) { item in
                            
                            Button {
                                selectMuseTypeModel = item
                            } label: {
                                ZStack(alignment: .center) {
                                    Color("homeListBg").cornerRadius(11)
                                    
                                    Text(item.name)
                                        .font(.footnote)
                                        .foregroundColor(.primary)
                                        .padding(.horizontal,20)
                                }.frame(height: 23)
                            }
                        }
                    }.padding(.leading,10)
                }
            }.padding(.bottom,10)
            
            VStack(spacing:0) {
                
                ForEach(selectMuseTypeModel.museList) { item in
                    
                    Button {
//                        let url = URL(string: item.mideaUrl)!
                        selectMuseItem = item
                        isPlay = true
                        if isShowPlayView == false {
                            isShowPlayView = true
                        }
                        
                    } label: {
                        HStack{
                            Image("learn_home_muse_play")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .padding(10)
                            
                            Text(item.name)
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
                ForEach(homeListModel.liveList) { item in
                    ZStack {
                        Image("")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width - 20, height: 140, alignment: .center)
                            .background(Color("homeListBg"))
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading,spacing: 5) {
                            HStack(spacing: 0) {
                                Image("learn_liveing")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:20,height: 20)
                                Text(item.liveStatus == 1 ? "待直播" : "直播中")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.leading,5)
                            }
                            .padding(5)
                            .background(.black.opacity(0.5))
                            Spacer()
                            Text(item.name)
                                .foregroundColor(.white)
                                .padding(.leading,10)
                            HStack {
                                Text(item.liveTime).font(.footnote).foregroundColor(.white).padding(.leading,10)
                                Spacer()
                                Image("learn_home_people")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16, height: 16)
                                Text("\(item.userCount)")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.trailing,10)
                            }.padding(.bottom,5)
                        }
                    }.padding(10)
                }
                ZStack {
                    Image("banner")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 20, height: 140, alignment: .center)
                        .background(Color("homeListBg"))
                        .cornerRadius(10)
                    
                    VStack(spacing: 10) {
                        Image("learn_check_replay")
                            .resizable()
                            .scaledToFit()
                            .frame(width:40,height: 40)
                        Text("查看回放")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }.padding(10)
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
                    ForEach(homeListModel.liveGoodList) { item in
                        VStack {
                            ZStack(alignment: .bottomLeading) {
                                Image("")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: .infinity)
                                    .background(Color("homeListBg"))
                                    .cornerRadius(10)
                                
                                Image("learn_video_play")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: .infinity)
                                    .frame(width:20,height: 20)
                                    .padding(5)
                            }.frame(height: 105)
                            
                            Text(item.name)
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
                ForEach(homeListModel.curriculumList) { item in
                    ZStack {
                        Color("homeListBg")
                            .frame(width: UIScreen.main.bounds.width - 20, height: 105, alignment: .center)
                            .cornerRadius(10)
                        
                        HStack(alignment: .top) {
                            ZStack(alignment: .bottomTrailing) {
                                Image("")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxHeight: .infinity)
                                    .frame(width:80)
                                    .background(.red)
                                    .cornerRadius(5)
                                
                                Text("视频课")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(3)
                                    .background(.black.opacity(0.5))
                                    .padding(2)
                                    .cornerRadius(20)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.body.weight(.medium))
                                    .padding(.top,10)
                                    .padding(5)
                                Text(item.introduce)
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
                    ForEach(homeListModel.topicList) { item in
                        ZStack(alignment: .center) {
                            Color("homeListBg").cornerRadius(17)
                            
                            Text(item.name)
                                .font(.footnote)
                                .foregroundColor(.primary)
                                .padding(.horizontal,20)
                        }.frame(height: 35)
                    }
                }.padding(.leading,10)
            }
        }
    }
    
    var audioView : some View {
        ZStack(alignment: .topTrailing) {
            ZStack {
                Color("homeListBg").frame(maxWidth: .infinity,maxHeight: 90).frame(height: 90)
                
                HStack {
                    VStack(alignment: .leading,spacing: 5) {
                        Text(selectMuseItem.name).font(.body.weight(.medium))
                        Text("冥想 | \(selectMuseTypeModel.name)").font(.subheadline).foregroundColor(.secondary)
                    }.padding(.leading,10)
                    Spacer()
                    
                    Button {
                        isPlay.toggle()
                    } label: {
                        Image(isPlay ? "learn_pause":"learn_play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    Spacer()
                }
            }
            .frame(height: 90)
            .cornerRadius(10)
            .padding(.horizontal,10)
            
            Image("audio_play_card_close")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .offset(x: -7,y: -4)
                .onTapGesture {
                    isShowPlayView = false
                    isPlay = false
                }
        }.offset(y: -64)
        
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
            .previewLayout(.sizeThatFits)
    }
}
