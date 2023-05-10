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

enum CardColor: String, CaseIterable {
    case red = "Красный"
    case green = "Зеленый"
    case black = "Черный"
    case gray = "Серый"
    case brown = "Коричневый"
    case yellow = "Желтый"
    case purple = "Пурпурный"
    case orange = "Оранжевый"
}

typealias Card = (type: CardType, color: CardColor)


