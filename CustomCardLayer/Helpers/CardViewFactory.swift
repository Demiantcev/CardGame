//
//  CardViewFactory.swift
//  CustomCardLayer
//
//  Created by Кирилл Демьянцев on 08.04.2023.
//

import UIKit

class CardViewFactory {
    
    func get (_ shape: CardType, withSize size: CGSize, andColor color: CardColor) -> UIView {
        
        let frame = CGRect(origin: .zero, size: size)
        let viewColor = getViewColorBy(modelColor: color)
        
        switch shape {
        case .circle:
            return CardView<CircleShape>(frame: frame, color: viewColor)
        case .cross:
            return CardView<CrossShape>(frame: frame, color: viewColor)
        case .fill:
            return CardView<FillShape>(frame: frame, color: viewColor)
        case .square:
            return CardView<SquareShape>(frame: frame, color: viewColor)
        case .unfilled:
            return CardView<UnfilledCircle>(frame: frame, color: viewColor)
        }
    }
    
    private func getViewColorBy(modelColor: CardColor) -> UIColor {
        
        switch modelColor {
        case .black:
            return .black
        case .brown:
            return .brown
        case .gray:
            return .gray
        case .green:
            return .green
        case .orange:
            return .orange
        case .purple:
            return .purple
        case .yellow:
            return .yellow
        case .red:
            return .red
        }
    }
}

