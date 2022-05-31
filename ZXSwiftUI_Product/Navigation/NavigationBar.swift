//
//  NavigationBar.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/31.
//

import SwiftUI

struct NavigationBar: View {
    
    var rightNavIcon : String = ""
    var title : String = ""
    
    var leftNavIcon : String = ""
    var leftDes : String = ""
    var body: some View {
        ZStack {
            Color.clear
                .background(.ultraThinMaterial)
                .blur(radius: 1)

            Text(title)
                .font(.title3.weight(.bold))
                .frame(maxWidth: .infinity)
            .padding(.leading,20)
            
            if rightNavIcon.count != 0 {
                Button {
                    
                } label: {
                    Image(systemName: rightNavIcon)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.primary)
                        .frame(width: 21, height: 21)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                        .padding(.trailing,20)
                }
            }
            
            if leftNavIcon.count != 0 {
                
                HStack(spacing: 10) {
                    Button {
                        
                    } label: {
                        Image(leftNavIcon)
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.primary)
                            .frame(width: 25, height: 25)
                    }
                    
                    Text(leftDes+" >")
                        .font(.footnote)
                        .foregroundColor(.primary)
                        .padding(.horizontal,15)
                        .padding(.vertical,5)
                        .frame(height:30)
                        .background(Color("homeListBg"))
                        .cornerRadius(15)
                    
                    Spacer()
                }.padding(.leading,20)
                
            }
            
        }
            .frame(height: 50)
            .frame(maxHeight: .infinity,alignment: .top)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title: "s")
    }
}
