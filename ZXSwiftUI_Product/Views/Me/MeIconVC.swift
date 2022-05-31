//
//  MeIconVC.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/26.
//

import SwiftUI

struct MeIconVC: View {
    var headerIcon : String
    var body: some View {
        Image(headerIcon).navigationTitle("个人头像")
    }
}

struct MeIconVC_Previews: PreviewProvider {
    static var previews: some View {
        MeIconVC(headerIcon: "mine_header")
    }
}
