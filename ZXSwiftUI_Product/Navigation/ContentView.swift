//
//  ContentView.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("currentTab") var currentTab : Tab = .book
    var body: some View {
        ZStack(alignment: .bottom){
            Group{
                switch currentTab {
                case .book:
                    HomeVC()
                case .message:
                    MessageVC()
                case .phone:
                    AddressVC()
                case .person:
                    MeVC()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Tabbar()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
