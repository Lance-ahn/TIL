//
//  ViewController.swift
//  coin
//
//  Created by macbook on 2020/02/13.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let flipCardButton = UIButton()
    private let cardImage = UIImageView()
    
    private let cardLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        print("in viewdidload")
        setupUI()
    }
    private func setupUI() {
        flipCardButton.setTitle("Flip Coin", for: .normal)
        flipCardButton.setTitleColor(.black, for: .normal)
        flipCardButton.addTarget(self, action: #selector(flipCard), for: .touchUpInside)
        
        anchor()
    }
    private func anchor() {
        [flipCardButton, cardImage, cardLabel].forEach {
            view.addSubview($0)
        }
        
        let guide = view.safeAreaLayoutGuide
        flipCardButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            flipCardButton.topAnchor.constraint(equalTo: guide.topAnchor),
            flipCardButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            flipCardButton.heightAnchor.constraint(equalToConstant: 50),
            flipCardButton.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: flipCardButton.bottomAnchor, constant: 10),
            cardImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            cardImage.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            cardImage.heightAnchor.constraint(equalToConstant: view.frame.height * 4/5),
        ])
        
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cardLabel.topAnchor.constraint(equalTo: cardImage.bottomAnchor),
            cardLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            cardLabel.heightAnchor.constraint(equalToConstant: 50)
            
            
        ])
        
        
        
    }
    @objc func flipCard() {
        let cards = [1, 2]
        
        if let card = cards.randomElement() {
            card == 1 ? (cardLabel.text = "Head") : (cardLabel.text = "Tails")
            card == 1 ? (cardImage.image = UIImage(named: "front")) : (cardImage.image = UIImage(named: "back"))
            
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            self.flipCard()
//        }
        
        
    }
}

