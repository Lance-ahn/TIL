//
//  CollectionViewCell.swift
//  CollectionViewPractice
//
//  Created by macbook on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private var catsImageView = UIImageView()
    private var blankImageView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
    static let identifier = "CollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        blankImageView.isHidden = true
    }
    func blankInfo(bool: Bool) {
        blankImageView.isHidden = bool
    }
    
    func catsInfo(catsPhoto: String) {
        catsImageView.image = UIImage(named: catsPhoto)
    }
    
    func setupUI() {
        
        [catsImageView, blankImageView].forEach {
            contentView.addSubview($0)
        }
        clipsToBounds = true
        layer.cornerRadius = 20
        

        
        catsImageView.translatesAutoresizingMaskIntoConstraints = false
           NSLayoutConstraint.activate([
               catsImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
               catsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
               catsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
               catsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
           ])
        blankImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blankImageView.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            blankImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            blankImageView.heightAnchor.constraint(equalToConstant: 30),
            blankImageView.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
