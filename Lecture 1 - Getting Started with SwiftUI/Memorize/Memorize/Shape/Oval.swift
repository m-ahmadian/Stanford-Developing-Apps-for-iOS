//
//  Oval.swift
//  Memorize
//
//  Created by Mehrdad Ahmadian on 2022-03-14.
//

import SwiftUI

struct Oval: Shape {
    var clockwise: Bool = false

    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) / 2

        var path = Path()

        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY + radius), radius: radius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 0), clockwise: clockwise)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxX - radius))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY - radius), radius: radius, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: false)
        path.closeSubpath()

        return path
    }
}

struct Oval_Previews: PreviewProvider {
    static var previews: some View {
        Oval()
    }
}
