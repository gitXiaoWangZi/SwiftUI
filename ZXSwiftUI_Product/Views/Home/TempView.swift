//
//  TempView.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/31.
//

import SwiftUI
import MapKit

struct TempView: View {
    var body: some View {
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
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}
