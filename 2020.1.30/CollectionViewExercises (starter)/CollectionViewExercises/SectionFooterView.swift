//
//  SectionFooterView.swift
//  CollectionViewExercises
//
//  Created by macbook on 2020/01/30.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class SectionFooterView: UICollectionReusableView {

    private let lineImageView = UIImageView()
    static let identifier = "SectionFooterView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    func lineInfo(color: UIColor) {
        lineImageView.backgroundColor = color
    }
    
    private func setupUI() {
        
        addSubview(lineImageView)
        lineImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lineImageView.topAnchor.constraint(equalTo: self.topAnchor),
            lineImageView.widthAnchor.constraint(equalToConstant: self.frame.width),
            lineImageView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
