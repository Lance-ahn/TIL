//
//  ViewController.swift
//  yupTask
//
//  Created by macbook on 2019/11/26.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class AviewController: UIViewController {

    
    let aLabel = UILabel()
    let plusButton = UIButton(type: .system)
//    let changingButton = UIButton()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aLabel.text = "0"
        aLabel.frame = CGRect(x: 180, y: 200, width: 100, height: 30)
        self.view.addSubview(aLabel)
        
        
        plusButton.setTitle("Plus", for: .normal)
        plusButton.frame = CGRect(x: 100, y: 300, width: 100, height: 30)
        plusButton.backgroundColor = .blue
        self.view.addSubview(plusButton)
        plusButton.addTarget(self, action: #selector(plusTouched(_:)), for: .touchUpInside)
        
        
//        changingButton.setTitle("다음", for: .normal)
//        changingButton.frame = CGRect(x: 200, y: 300, width: 100, height: 30)
//        changingButton.backgroundColor = .green
//        self.view.addSubview(changingButton)
        
        
    }
    @objc private func plusTouched (_ sender: UIButton){
        count += 1
        
        let bv = BviewController()
        
        bv.bLabel.text = String(count)
        
        bv.bCount = count
        
        
        present(bv, animated: true)
        
        
        }
//    @objc private func changingButtonTouched (_ sender: UIButton) {
//        let vc = BviewController()
//        vc.text = String(count)
//
//        present(vc, animated: true)
//
//    }
    


}

