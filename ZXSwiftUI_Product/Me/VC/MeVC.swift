//
//  MeVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct MeVC: View {
    
    @State private var listDataArr : [me_homeList] = [me_homeList]()
    var body: some View {
            List {
                MePageHeaderV(icon: "mine_header", name: "刘圣洁").background(
                    NavigationLink("", destination: PersonalMessageVC()).opacity(0)
                ).listRowBackground(Color.white)
                ForEach(listDataArr){ list in
                    Section{
                        ForEach(list.section) { item in
                            
                            MeCell(icon: item.imageIcon, content: item.content, isShow: item.isShowLabel).frame(height:60).background(
                                NavigationLink("", destination: PersonalMessageVC()).opacity(0)
                            )
                        }
                    }
                }.listRowBackground(Color.white)
            }
            //.listStyle(.grouped)
            .ignoresSafeArea(edges: .top)
            .navigationBarHidden(true).onAppear(perform: loadData)
    }
    
    func loadData() {
        let item0 = me_homeList_model(index:0,imageIcon: "mine_section_0", content: "开营通知书", isShowLabel: false)
        let item1 = me_homeList_model(index:1,imageIcon: "mine_section_0_1", content: "线下工作坊", isShowLabel: false)
        let item2 = me_homeList_model(index:2,imageIcon: "mine_section_1", content: "家庭档案", isShowLabel: false)
        let item3 = me_homeList_model(index:3,imageIcon: "mine_section_2", content: "我的积分", isShowLabel: false)
        let item4 = me_homeList_model(index:4,imageIcon: "mine_collect", content: "我的收藏", isShowLabel: false)
        let item5 = me_homeList_model(index:5,imageIcon: "mine_feedback", content: "意见反馈", isShowLabel: false)
        let item6 = me_homeList_model(index:6,imageIcon: "mine_section_3_0", content: "隐私协议", isShowLabel: true)
        listDataArr = [me_homeList(section: [item0,item1]),me_homeList(section: [item2,item3,item4]),me_homeList(section: [item5]),me_homeList(section: [item6]),]
    }
}

struct Previews_MeVC_Previews: PreviewProvider {
    static var previews: some View {
        MeVC()
    }
}
