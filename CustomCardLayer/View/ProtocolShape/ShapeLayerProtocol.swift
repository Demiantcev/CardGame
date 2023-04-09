//
//  ShapeLayerProtocol.swift
//  CustomCardLayer
//
//  Created by Кирилл Демьянцев on 06.04.2023.
//

import Foundation
import QuartzCore

protocol ShapeLayerProtocol: CAShapeLayer {
    init(size: CGSize, fillColor: CGColor)
}

extension ShapeLayerProtocol {
    init() {
        fatalError("init() не можеть быть использован для создания экземпляра")
    }
}
