//
//  StartGameViewController.swift
//  CustomCardLayer
//
//  Created by Кирилл Демьянцев on 09.05.2023.
//

import UIKit

class StartGameViewController: UIViewController {
    
    private var buttonConstraint: NSLayoutConstraint!
    private var labelConstraint: NSLayoutConstraint!
    
    let labelGame: UILabel = {
        var label = UILabel()
        label.text = "Card Game"
        label.font = UIFont(name: "GillSans-UltraBold", size: 50)
        label.textColor = #colorLiteral(red: 0.9864652753, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var entryGameButton: UIButton = {
       var button = UIButton()
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 60, weight: .medium, scale: .large)
        let largeBoldDoc = UIImage(systemName: "power.circle.fill", withConfiguration: largeConfig)
        button.setImage(largeBoldDoc, for: .normal)
        button.tintColor = #colorLiteral(red: 0.7059900165, green: 0.9093973041, blue: 0.5270702243, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapEntryGame), for: .touchUpInside)
        return button
    }()
    
    @objc private func tapEntryGame() {
        navigationController?.pushViewController(BoardGameController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .systemGray2
        setupConstraints()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelConstraint.constant -= view.bounds.width
        buttonConstraint.constant -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut) {
            self.labelConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseOut) {
            self.buttonConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }
    }
    
    private func setupConstraints() {
        
        view.addSubview(entryGameButton)
        view.addSubview(labelGame)
        
        labelConstraint = NSLayoutConstraint(item: labelGame, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        self.view.addConstraint(labelConstraint)
        buttonConstraint = NSLayoutConstraint(item: entryGameButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        self.view.addConstraint(buttonConstraint)
        
        NSLayoutConstraint.activate([
            
            labelGame.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            entryGameButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
