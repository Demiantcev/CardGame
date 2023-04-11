//
//  CardModel.swift
//  CustomCardLayer
//
//  Created by Кирилл Демьянцев on 07.04.2023.
//

import UIKit

enum CardType: CaseIterable {
    case circle
    case cross
    case square
    case fill
    case unfilled
}

enum CardColor: CaseIterable {
    case red
    case green
    case black
    case gray
    case brown
    case yellow
    case purple
    case orange
}

typealias Card = (type: CardType, color: CardColor)


