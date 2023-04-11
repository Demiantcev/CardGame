//
//  FlippableViewProtocol.swift
//  CustomCardLayer
//
//  Created by Кирилл Демьянцев on 07.04.2023.
//

import UIKit

protocol FlippableView: UIView {
    var isFlipped: Bool { get set }
    var flipCompletionHandler: ((FlippableView) -> Void)? { get set }
    func flip()
}
