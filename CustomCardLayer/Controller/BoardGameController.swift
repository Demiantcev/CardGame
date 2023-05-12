//
//  BoardGameController.swift
//  CustomCardLayer
//
//  Created by Кирилл Демьянцев on 07.04.2023.
//

import UIKit

class BoardGameController: UIViewController {
    
    var cardsPairsCounts = 8
    var cardsViews = [UIView]()
    var checkFlip = 0
    
    private var flippedCards = [UIView]()
    
    lazy var game: Game = getNewGame()
    lazy var startButton: UIButton = {
        var button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Начать игру", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.backgroundColor = .systemGray4
        button.layer.cornerRadius = 10
        button.addTarget(nil, action: #selector(startGame), for: .touchUpInside)
        return button
    }()
    
    @objc func startGame(_ sender: UIButton) {
        game = getNewGame()
        let cards = getCardsBy(modelData: game.cards)
        placeCardsOnBoard(cards)
//        self.checkFlip = 0
//        checkLabel.text = String(checkFlip)
    }
    
    lazy var flippedCardButton: UIButton = {
       var button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .large)
        let largeBoldDoc = UIImage(systemName: "arrow.up.arrow.down.circle.fill", withConfiguration: largeConfig)
        button.setImage(largeBoldDoc, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(allFlipCard), for: .touchUpInside)
        return button
    }()
    
    @objc func allFlipCard(_ sender: UIButton) {
        
        for card in cardsViews {
            let cards = (card as! FlippableView)
            
            UIView.transition(with: cards, duration: 0.5, options: [.transitionFlipFromTop]) {
                if cards.isFlipped == false {
                    cards.isFlipped = true
                } else {
                    cards.isFlipped = false
                }
            }
        }
    }
    
    lazy var boardGameView: UIView = {
        var view = UIView()
        view.layer.cornerRadius = 5
        view.backgroundColor = #colorLiteral(red: 0.7059900165, green: 0.9093973041, blue: 0.5270702243, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let checkLabel: UILabel = {
       var label = UILabel()
        label.font = UIFont(name: "AvenirNext-Bold", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var cardSize: CGSize {
        CGSize(width: 80, height: 120)
    }
    private var cardMaxXCoordinate: Int {
        Int(boardGameView.frame.width - cardSize.width)
    }
    private var cardMaxYCoordinate: Int {
        Int(boardGameView.frame.height - cardSize.height)
    }
    
    override func loadView() {
        super.loadView()
        let view = UIView()
        view.backgroundColor = .white

        self.view = view
        
        setupConstraint()
        view.addSubview(boardGameView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func getNewGame() -> Game {
        let game = Game()
        game.cardsCount = self.cardsPairsCounts
        game.generateCards()
        return game
    }
    
    private func getCardsBy(modelData: [Card]) -> [UIView] {
        
        var cardsViews = [UIView]()
        let cardViewFactory = CardViewFactory()
        
        for (index, modelCard) in modelData.enumerated() {
            let cardOne = cardViewFactory.get(modelCard.type,
                                              withSize: cardSize ,
                                              andColor: modelCard.color)
            cardOne.tag = index
            cardsViews.append(cardOne)
            
            let cardTwo = cardViewFactory.get(modelCard.type,
                                              withSize: cardSize ,
                                              andColor: modelCard.color)
            cardTwo.tag = index
            cardsViews.append(cardTwo)
            
            for card in cardsViews {
                (card as! FlippableView).flipCompletionHandler = {[self] flippedCard in
                    flippedCard.superview?.bringSubviewToFront(flippedCard)
                    
                    if flippedCard.isFlipped {
                        self.flippedCards.append(flippedCard)
                        checkFlip = checkFlip + 1
                        checkLabel.text = String(checkFlip)
                    } else {
                        if let cardIndex = self.flippedCards.firstIndex(of: flippedCard) {
                            self.flippedCards.remove(at: cardIndex)
                        }
                    }
                    if self.flippedCards.count == 2 {
                        let firstCard = game.cards[self.flippedCards.first!.tag]
                        let secondCard = game.cards[self.flippedCards.last!.tag]
                        
                        if game.checkCards(firstCard, secondCard) {
                            UIView.animate(withDuration: 0.3, animations: {
                                self.flippedCards.first!.layer.opacity = 0
                                self.flippedCards.last!.layer.opacity = 0
                            }, completion: {_ in
                                self.flippedCards.first!.removeFromSuperview()
                                self.flippedCards.last!.removeFromSuperview()
                                self.flippedCards = []
                            })
                        } else {
                            for card in self.flippedCards {
                                (card as! FlippableView).flip()
                            }
                        }
                    }
                }
            }
        }
        return cardsViews
    }
    
    private func placeCardsOnBoard(_ cards: [UIView]) {
        
        for card in cardsViews {
            card.removeFromSuperview()
        }
        cardsViews = cards
        
        for card in cardsViews {
            let randomXCoordinate = Int.random(in: 0...cardMaxXCoordinate)
            let randomYCoordinate = Int.random(in: 0...cardMaxYCoordinate)
            card.frame.origin = CGPoint(x: randomXCoordinate, y: randomYCoordinate)
            
            boardGameView.addSubview(card)
        }
        checkFlip = 0
        checkLabel.text = String(checkFlip)
    }
    
    private func setupConstraint() {
        
        self.view.addSubview(startButton)
        self.view.addSubview(boardGameView)
        self.view.addSubview(flippedCardButton)
        self.view.addSubview(checkLabel)
        
        NSLayoutConstraint.activate([
            
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            boardGameView.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 10),
            boardGameView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            boardGameView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            boardGameView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            flippedCardButton.centerYAnchor.constraint(equalTo: startButton.centerYAnchor),
            flippedCardButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            checkLabel.topAnchor.constraint(equalTo: startButton.topAnchor),
            checkLabel.centerYAnchor.constraint(equalTo: startButton.centerYAnchor),
            checkLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)
        ])
    }
}

