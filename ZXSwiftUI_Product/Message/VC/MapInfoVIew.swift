//
//  MapInfoVIew.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/27.
//

import SwiftUI

struct MapInfoVIew: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var landmark : Landmark
    
    var landmarkIndex: Int {
            modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
        }
    
    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .ignoresSafeArea(edges: .top)
                    .frame(height:300)
                
                CircleImage(image: landmark.image)
                    .offset(y: -130)
                    .padding(.bottom,-130)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }.font(.subheadline).foregroundColor(.secondary)
                    
                    Divider()
                    
                    Text("About \(landmark.name)")
                    Text("\(landmark.description)")
                }
                .padding()
                
                Spacer()
            }
        }.navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct MapInfoVIew_Previews: PreviewProvider {
    static var previews: some View {
        MapInfoVIew(landmark: ModelData().landmarks[1]).environmentObject(ModelData())
    }
}
