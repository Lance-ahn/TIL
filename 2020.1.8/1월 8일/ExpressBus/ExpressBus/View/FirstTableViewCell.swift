//
//  TableViewCell.swift
//  ExpressBus
//
//  Created by macbook on 2020/01/08.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {
    static let identifier = "FirstTableViewCell"
    private let emojiImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    func imageInfo(image: String) {
        emojiImageView.image = UIImage(named: image)
    }
    private func setupUI() {
        [emojiImageView].forEach {
            contentView.addSubview($0)
        }
        emojiImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            emojiImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            emojiImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            emojiImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            emojiImageView.heightAnchor.constraint(equalTo: .heightAnchor, multiplier: 0.25)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
