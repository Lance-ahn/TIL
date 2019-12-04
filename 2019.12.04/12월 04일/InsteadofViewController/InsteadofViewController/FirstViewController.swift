//
//  ViewController.swift
//  InsteadofViewController
//
//  Created by macbook on 2019/12/04.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var content = "Display" {
        willSet {
            displayLabel.text = newValue
        }
    }
    
    
    var displayLabel = UILabel()
    var button = UIButton()
     

    override func viewDidLoad() {
        super.viewDidLoad()
     baseUI()
        
    }
    private func baseUI(){
    self.view.backgroundColor = .white
    
    displayLabel.text = content
    displayLabel.frame = CGRect(x: 80, y: 200, width: 250, height: 50)
    displayLabel.backgroundColor = .black
    displayLabel.textColor = UIColor.white
    displayLabel.textAlignment = .center
    self.view.addSubview(displayLabel)
    
    button.setTitle("Alert", for: .normal)
    button.frame = CGRect(x: 80, y: 400, width: 250, height: 50)
    button.backgroundColor = .green
    button.setTitleColor(.white, for: .normal)
    self.view.addSubview(button)
        button.addTarget(self, action: #selector(touchedButton(_:)), for: .touchUpInside)
    }
    
    
    @objc func touchedButton (_ sender: UIButton) {
       let secondVC = SecondViewController()
        secondVC.modalPresentationStyle = .overFullScreen
        present(secondVC, animated: false)
    }
    
    
    

}

