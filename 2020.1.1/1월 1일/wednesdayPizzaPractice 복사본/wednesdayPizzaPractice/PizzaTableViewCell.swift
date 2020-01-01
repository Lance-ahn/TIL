//
//  PizzaTableViewCell.swift
//  wednesdayPizzaPractice
//
//  Created by macbook on 2020/01/01.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class PizzaTableViewCell: UITableViewCell {
    private let pizzaImageView = UIImageView()
    private let pizzaTitleLabel = UILabel()
    private let pizzaPriceLabel = UILabel()
    static let identifier = "PizzaTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func pizzaInfo(pizzaName: String, PizzaCost: String, PizzaPic: String) {
        pizzaTitleLabel.text = pizzaName
        pizzaPriceLabel.text = PizzaCost
        pizzaImageView.image = UIImage(named: PizzaPic)
        
    }
    private func setupUI() {
        [pizzaImageView, pizzaTitleLabel, pizzaPriceLabel].forEach {
            contentView.addSubview($0)
        }
        
        let margin: CGFloat = 10
        pizzaImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pizzaImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            pizzaImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            pizzaImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            pizzaImageView.widthAnchor.constraint(equalToConstant: margin * 12),
            pizzaImageView.heightAnchor.constraint(lessThanOrEqualToConstant: margin * 12),
            
        ])
        
        pizzaTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pizzaTitleLabel.leadingAnchor.constraint(equalTo: pizzaImageView.trailingAnchor, constant: margin),
            pizzaTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: margin * 2),
            pizzaTitleLabel.widthAnchor.constraint(equalToConstant: margin * 20),
            
        ])
        
        pizzaPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pizzaPriceLabel.leadingAnchor.constraint(equalTo: pizzaImageView.trailingAnchor, constant: margin),
            pizzaPriceLabel.topAnchor.constraint(equalTo: pizzaTitleLabel.bottomAnchor, constant: margin * 1),
            pizzaPriceLabel.widthAnchor.constraint(equalToConstant: margin * 10),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
