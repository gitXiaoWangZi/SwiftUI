//
//  CavansPage.swift
//  ZXSwiftUI_Product
//
//  Created by 刘圣洁 on 2022/5/28.
//

import SwiftUI

struct CavansPage: View {
    
    @State var appear = false
    var body: some View {
        TimelineView(.animation) {timeline in
            let now = timeline.date.timeIntervalSince1970
            let angle = Angle.degrees(now.remainder(dividingBy: 3) * 60)
            let x = cos(angle.radians)
            let angle2 = Angle.degrees(now.remainder(dividingBy: 2) * 50)
            let x2 = cos(angle2.radians)
            
            Canvas { context, size in
                context.fill(cusPath(in: CGRect(x: 0, y: 0, width: size.width, height: size.height), x: x, x2: x2), with: .linearGradient(Gradient(colors: [.pink,.blue]), startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: size.width, y: size.height)))
            }
            .frame(width: 257, height: 308)
            .rotationEffect(.degrees(appear ? 240 : 0))
            
        }.onAppear{
            withAnimation(.linear(duration: 35).repeatForever()) {
                appear = true
            }
        }
    }
    
    func cusPath(in rect: CGRect,x: Double,x2: Double) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.54407*height * x2))
        path.addCurve(to: CGPoint(x: 0.25639*width, y: 0.83124*height), control1: CGPoint(x: 0, y: 0.82297*height), control2: CGPoint(x: 0.12614*width * x2, y: 0.82704*height * x2))
        path.addCurve(to: CGPoint(x: 0.49214*width * x2, y: 0.9311*height), control1: CGPoint(x: 0.34646*width, y: 0.83415*height), control2: CGPoint(x: 0.4385*width, y: 0.83712*height))
        path.addCurve(to: CGPoint(x: 0.98427*width, y: 0.54407*height), control1: CGPoint(x: 0.62332*width, y: 1.16097*height * x), control2: CGPoint(x: 1.09113*width, y: 0.75987*height))
        path.addCurve(to: CGPoint(x: 0.49214*width * x, y: 0.15705*height), control1: CGPoint(x: 0.87741*width, y: 0.32828*height), control2: CGPoint(x: 0.599*width, y: 0.49951*height * x))
        path.addCurve(to: CGPoint(x: 0, y: 0.54407*height), control1: CGPoint(x: 0.38527*width * x, y: -0.18541*height), control2: CGPoint(x: 0, y: 0.07231*height))
        path.closeSubpath()
        return path
    }
}

struct CavansPage_Previews: PreviewProvider {
    static var previews: some View {
        CavansPage()
    }
}

struct MyCustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0, y: 0.54407*height))
        path.addCurve(to: CGPoint(x: 0.25639*width, y: 0.83124*height), control1: CGPoint(x: 0, y: 0.82297*height), control2: CGPoint(x: 0.12614*width, y: 0.82704*height))
        path.addCurve(to: CGPoint(x: 0.49214*width, y: 0.9311*height), control1: CGPoint(x: 0.34646*width, y: 0.83415*height), control2: CGPoint(x: 0.4385*width, y: 0.83712*height))
        path.addCurve(to: CGPoint(x: 0.98427*width, y: 0.54407*height), control1: CGPoint(x: 0.62332*width, y: 1.16097*height), control2: CGPoint(x: 1.09113*width, y: 0.75987*height))
        path.addCurve(to: CGPoint(x: 0.49214*width, y: 0.15705*height), control1: CGPoint(x: 0.87741*width, y: 0.32828*height), control2: CGPoint(x: 0.599*width, y: 0.49951*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.54407*height), control1: CGPoint(x: 0.38527*width, y: -0.18541*height), control2: CGPoint(x: 0, y: 0.07231*height))
        path.closeSubpath()
        return path
    }
}
