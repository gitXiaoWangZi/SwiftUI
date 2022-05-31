//
//  HomeVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct HomeVC: View {
    
    @State var currentPage : Int = 0
    var imageArr : [String] = ["banner","banner1","banner2"]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var total : Int = 0
    var body: some View {
        VStack {
            headerScroll
        }
    }
    
    ///MARK - 头部轮播图
    var headerScroll : some View {
        
        VStack{
            Text("currentPage \(currentPage)")
//            Text("total \(total)")
            
            TabView(selection: $currentPage) {
                Text("1").tabItem {
//                    ForEach(imageArr,id: \.self) { index in
//                        Image(index)
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: UIScreen.main.bounds.width - 50, height: 151, alignment: .center)
//                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
//                            .tag(index)
//                    }
                }
                Text("2").tabItem {}
                Text("3").tabItem {}
            }
            .frame(height:151)
            .tabViewStyle(PageTabViewStyle())
            .onReceive(timer) { input in
                withAnimation(.linear) {
                    
                }
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
