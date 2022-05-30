//
//  MessageSFInfo.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/28.
//

import SwiftUI

struct MessageSFInfo: View {
    @State var isDelete : Bool
    @State var isPin : Bool = false
    
    var body: some View {
        List {
            profile
            
            menu
            
            netLink
            
        }.navigationTitle("大标题")
            .listStyle(.automatic)
    }
    
    var profile: some View{
        VStack (spacing: 8){
            Image(systemName: "person.crop.circle.fill.badge.checkmark")
                .symbolVariant(.circle.fill)
                .font(.system(size: 32))
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .blue.opacity(0.3))
                .padding()
                .background(
                    Circle().fill(.ultraThickMaterial)
                )
                .background(
                    Image(systemName: "hexagon")
                        .symbolVariant(.fill)
                        .font(.system(size: 200))
                        .offset(x: -50, y: -100)
                        .foregroundColor(.blue)
                )
            Text("刘圣洁")
                .font(.title.weight(.semibold))
            HStack {
                Image(systemName: "location")
                    .foregroundColor(.blue)
                    .imageScale(.small)
                Text("杭州")
                    .foregroundColor(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            CavansPage()
                .offset(x: 60,y: -50)
                .scaleEffect(0.8)
                .opacity(0.6)
        )
    }
    
    var menu: some View{
        Section {
            NavigationLink(destination: MessageVC()) {
                Label("设置", systemImage: "gear")
            }
            
            NavigationLink { Image(systemName: "gear") } label: {
                Label("账户", systemImage: "creditcard")
            }
            NavigationLink {
                MessageVC()
            } label: {
                Label("帮助", systemImage: "questionmark")
            }
        }
        .accentColor(.primary)
        .listRowSeparatorTint(.blue)
        .listRowSeparator(.hidden)
    }
    
    var netLink: some View{
        Section {
            if !isDelete {
                Link(destination: URL(string: "https://apple.com")!) {
                    HStack {
                        Label("苹果官方", systemImage: "house")
                        Spacer()
                        Image(systemName: "link")
                            .foregroundColor(.secondary)
                    }
                }.swipeActions(edge: .leading, allowsFullSwipe: false) {
                    Button {
                        isDelete = true
                    } label: {
                        Label("删除", systemImage: "trash")
                    }
                    .tint(.red)
                    pinButton
                }
            }
            Link(destination: URL(string: "https://youtobe.com")!) {
                HStack {
                    Label("Youtobe官方", systemImage: "tv")
                    Spacer()
                    Image(systemName: "link")
                        .foregroundColor(.secondary)
                }
            }.swipeActions {
                pinButton
            }
        }.accentColor(.primary)
    }
    
    var pinButton: some View{
        Button {
            isPin.toggle()
        } label: {
            if !isPin {
                Label("Pin", systemImage: "pin")
            }else{
                Label("UnPin", systemImage: "pin.slash")
            }
        }
        .tint(isPin ? .gray : .yellow)
    }
}

struct MessageSFInfo_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MessageSFInfo(isDelete: true)
                .preferredColorScheme(.dark)
            MessageSFInfo(isDelete: true)
                .preferredColorScheme(.light)
        }
    }
}
