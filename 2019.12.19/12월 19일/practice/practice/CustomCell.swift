//
//  CustomCell.swift
//  practice
//
//  Created by macbook on 2019/12/19.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit
protocol CustomCellDelegate: class {
    func didTap(cell: CustomCell)
    
    
    
}

class CustomCell: UITableViewCell {
    
    weak var delegate: CustomCellDelegate?
    
    let myButton = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        contentView.addSubview(myButton)
        
        myButton.setTitleColor(.black, for: .normal)
        myButton.setTitle("눌러", for: .normal)
        myButton.backgroundColor = .yellow
        myButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction() {
        
        delegate?.didTap(cell: self)
    }
    
//    private var indexPath: IndexPath!
//    func currentIndexPath(_ indexPath: IndexPath) {
//        self.indexPath = indexPath
//    }

   override func layoutSubviews() {
     super.layoutSubviews()
     myButton.frame = CGRect(x: frame.width - 120, y: 15, width: 100, height: frame.height - 30)
     
     
   }
}



