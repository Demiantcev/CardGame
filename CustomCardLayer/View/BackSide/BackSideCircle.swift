//
//  BackSideCircle.swift
//  CustomCardLayer
//
//  Created by Кирилл Демьянцев on 06.04.2023.
//

import Foundation
import QuartzCore
import UIKit

class BackSideCircle: CAShapeLayer, ShapeLayerProtocol {
    required init(size: CGSize, fillColor: CGColor) {
        super.init()
        
        let path = UIBezierPath()
        
        for _ in 1...15 {
            
            let randomX = Int.random(in: 0...Int(size.width))
            let randomY = Int.random(in: 0...Int(size.height))
            let center = CGPoint(x: randomX, y: randomY)
            path.move(to: center)
            
            let radius = Int.random(in: 5...15)
            
            path.addArc(withCenter: center,
                        radius: CGFloat(radius),
                        startAngle: 0, endAngle: .pi*2,
                        clockwise: true)
        }
        
        self.path = path.cgPath
        self.fillColor = fillColor
        self.lineWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
