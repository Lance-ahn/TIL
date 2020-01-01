//
//  SVCustomView.swift
//  wednesdayPizzaPractice
//
//  Created by macbook on 2020/01/01.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class SVCustomView: UIView {

    private let NameOfPizza = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        attribute()
    }
    
    func delivery(name: String) {
        NameOfPizza.text = name
    }
    
    private func attribute() {
        NameOfPizza.text = "테스트"
        NameOfPizza.textColor = .black
        NameOfPizza.backgroundColor = .yellow
    }
    
    private func setUI() {
        [NameOfPizza].forEach {
            self.addSubview($0)
        }
        
        NameOfPizza.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            NameOfPizza.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            NameOfPizza.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
