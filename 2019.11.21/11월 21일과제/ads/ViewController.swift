//
//  ViewController.swift
//  shit
//
//  Created by macbook on 2019/11/22.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var Label: UILabel!
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        plusButton.setTitle("Plus", for: .normal)
        minusButton.setTitle("Minus", for: .normal)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        plusButton.frame = CGRect(x: 50, y: 200, width: 100, height: 100)
        minusButton.frame = CGRect(x: 250, y: 200, width: 100, height: 100)
        Label.frame.size.width = 100
        Label.text = "0"
        plusButton.addTarget(self, action: #selector(plusTouched(_:)), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusTouched(_:)), for: .touchUpInside)
        
    }
    @objc func plusTouched (_ sender: UIButton){
        count += 1
        Label.text = ("\(count)")
        Label.textColor = .blue
    }
    @objc func minusTouched (_ sender: UIButton){
        count -= 1
        Label.text = ("\(count)")
        Label.textColor = .red
    }
    
    
    
    
    


}

