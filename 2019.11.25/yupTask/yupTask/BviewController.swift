//
//  BviewController.swift
//  yupTask
//
//  Created by macbook on 2019/11/26.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class BviewController: UIViewController {

    let bLabel = UILabel()
    let bPlusButton = UIButton(type: .system)
    
    var bCount: Int = 0
    
    override func viewDidLoad() {
         super.viewDidLoad()
        
        
        bLabel.frame = CGRect(x: 180, y: 200, width: 100, height: 30)
        self.view.addSubview(bLabel)
        
        bPlusButton.setTitle("Plus", for: .normal)
        bPlusButton.frame = CGRect(x: 100, y: 300, width: 100, height: 30)
        bPlusButton.backgroundColor = .blue
        self.view.addSubview(bPlusButton)
        view.backgroundColor = .yellow
        bPlusButton.addTarget(self, action: #selector(plusTouched2(_:)), for: .touchUpInside)
        
        
    }
    @objc func plusTouched2 (_ sender: UIButton) {
        bCount += 1
        print(bCount)
        guard let goingBack = presentingViewController as? AviewController else { return }
        
        goingBack.aLabel.text = String(bCount)
        goingBack.count = bCount
        
        
        
    dismiss(animated: true)
    
    }
}
