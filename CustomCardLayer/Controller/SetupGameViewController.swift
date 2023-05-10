//
//  SetupGameViewController.swift
//  CustomCardLayer
//
//  Created by Кирилл Демьянцев on 10.05.2023.
//

import UIKit

class SetupGameViewController: UIViewController {
    
    lazy var greenSwitch: UISwitch = {
        var greenSwitch = UISwitch()
        greenSwitch.isOn = false
        greenSwitch.translatesAutoresizingMaskIntoConstraints = false
        greenSwitch.addTarget(self, action: #selector(tapSwitch), for: .valueChanged)
        return greenSwitch
    }()
    
    @objc func tapSwitch(_ sender: UISwitch) {
        let defaults = UserDefaults.standard
        
        if greenSwitch.isOn {
            defaults.set(true, forKey: "SwitchState")
        } else {
            defaults.set(false, forKey: "SwitchState")
        }
    }
    
    var blackSwitch: UISwitch = {
        var greenSwitch = UISwitch()
        greenSwitch.isOn = false
        greenSwitch.translatesAutoresizingMaskIntoConstraints = false
        return greenSwitch
    }()
    
    var purpleSwitch: UISwitch = {
        var greenSwitch = UISwitch()
        greenSwitch.isOn = false
        greenSwitch.translatesAutoresizingMaskIntoConstraints = false
        return greenSwitch
    }()
    
    var redSwitch: UISwitch = {
        var greenSwitch = UISwitch()
        greenSwitch.isOn = false
        greenSwitch.translatesAutoresizingMaskIntoConstraints = false
        return greenSwitch
    }()
    
    var graySwitch: UISwitch = {
        var greenSwitch = UISwitch()
        greenSwitch.isOn = false
        greenSwitch.translatesAutoresizingMaskIntoConstraints = false
        return greenSwitch
    }()
    
    var brownSwitch: UISwitch = {
        var greenSwitch = UISwitch()
        greenSwitch.isOn = false
        greenSwitch.translatesAutoresizingMaskIntoConstraints = false
        return greenSwitch
    }()
    
    var yellowSwitch: UISwitch = {
        var greenSwitch = UISwitch()
        greenSwitch.isOn = false
        greenSwitch.translatesAutoresizingMaskIntoConstraints = false
        return greenSwitch
    }()
    
    var orangeSwitch: UISwitch = {
        var greenSwitch = UISwitch()
        greenSwitch.isOn = false
        greenSwitch.translatesAutoresizingMaskIntoConstraints = false
        return greenSwitch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupConstraints()
        
        var deff = UserDefaults.standard
        
        if (deff.object(forKey: "SwitchState") != nil) {
            greenSwitch.isOn = deff.bool(forKey: "SwitchState")
        }
    }
    
    private func setupConstraints() {
        
        view.addSubview(greenSwitch)
        view.addSubview(blackSwitch)
        view.addSubview(purpleSwitch)
        view.addSubview(orangeSwitch)
        view.addSubview(yellowSwitch)
        view.addSubview(brownSwitch)
        view.addSubview(graySwitch)
        view.addSubview(redSwitch)
        
        NSLayoutConstraint.activate([
            
            greenSwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            greenSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            blackSwitch.topAnchor.constraint(equalTo: greenSwitch.bottomAnchor, constant: 10),
            blackSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            purpleSwitch.topAnchor.constraint(equalTo: blackSwitch.bottomAnchor, constant: 10),
            purpleSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            orangeSwitch.topAnchor.constraint(equalTo: purpleSwitch.bottomAnchor, constant: 10),
            orangeSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            yellowSwitch.topAnchor.constraint(equalTo: orangeSwitch.bottomAnchor, constant: 10),
            yellowSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            brownSwitch.topAnchor.constraint(equalTo: yellowSwitch.bottomAnchor, constant: 10),
            brownSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            graySwitch.topAnchor.constraint(equalTo: brownSwitch.bottomAnchor, constant: 10),
            graySwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            redSwitch.topAnchor.constraint(equalTo: graySwitch.bottomAnchor, constant: 10),
            redSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
        ])
    }
}
