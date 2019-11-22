//
//  ViewController.swift
//  assignment
//
//  Created by macbook on 2019/11/22.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var Switch: UISwitch!
    
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Label.frame.size.width = 100
        Label.font = UIFont.systemFont(ofSize: 30)
        Switch.addTarget(self, action: #selector(switchmovement(_:)), for: .valueChanged)
        label1.frame = CGRect(x: 180, y: 500, width: 100, height: 100)
        segmentControl.addTarget(self, action: #selector(controllerMovement(_:)), for: .valueChanged)
        
        segmentControl.setTitle("슈퍼", forSegmentAt: 1)
        segmentControl.setTitle("천재", forSegmentAt: 0)
    }
    @objc func switchmovement (_ sender: UISwitch) {
        if Switch.isOn {
            Label.text = "ON"
        } else {
            Label.text = "OFF"
        }
    }
    @objc func controllerMovement (_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex
        label1.text = sender.titleForSegment(at: index)
        
    }
    
}

