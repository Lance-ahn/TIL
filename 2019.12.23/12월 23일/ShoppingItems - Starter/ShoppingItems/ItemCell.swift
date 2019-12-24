//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 12. 17..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol ItemCellDelegate: class {
    func didTap(cell: ItemCell)
}

final class ItemCell: UITableViewCell {
    
    weak var delegate: ItemCellDelegate?
    
    // button, countlabel, titlelabel, imageview
    let myButton = UIButton(type: .system)
    let countLabel = UILabel()
    let titleLabel = UILabel()
    let imgView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myButton)
        contentView.addSubview(countLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(imgView)
        
        countLabel.backgroundColor = .white
        
        myButton.setTitleColor(.black, for: .normal)
        myButton.setTitle("+", for: .normal)
        myButton.backgroundColor = .yellow
        myButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction() {
        delegate?.didTap(cell: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        myButton.frame = CGRect(x: frame.width - 50, y: 15,
                                width: 50, height: frame.height - 30)
        countLabel.frame = CGRect(x: frame.width - 100, y: 15,
                                  width: 50, height: frame.height - 30)
        imgView.frame = CGRect(x: 30, y: 15, width: frame.height - 30, height: frame.height - 30)
        titleLabel.frame = CGRect(x: imgView.frame.maxX + 10,
                                  y: 15,
                                  width: 200, height: imgView.frame.height)
        titleLabel.center.y = imgView.center.y
        
    }
    
}
