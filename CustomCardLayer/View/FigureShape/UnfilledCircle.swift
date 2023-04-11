//
//  UnfilledCircle.swift
//  CustomCardLayer
//
//  Created by Кирилл Демьянцев on 11.04.2023.
//

import UIKit
import QuartzCore
import UIKit

class UnfilledCircle: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let radius = ([size.width, size.height].min() ?? 0) / 2
        let centerX = size.width / 2
        let centerY = size.height / 2
        
        let path = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY),
                                radius: radius,
                                startAngle: 0, endAngle: .pi*2,
                                clockwise: true)
        path.close()
        
        self.path = path.cgPath
        self.fillColor = nil
        self.strokeColor = fillColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
