//
//  SecondViewController.swift
//  oriana
//
//  Created by macbook on 2019/12/04.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var dogAndBirdAndCat: UIImageView!
    
    
    @IBOutlet weak var goinBackToFirst: UIButton!
    
    @IBOutlet weak var allCount: UIButton!
    
    
  
    var pets = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dogAndBirdAndCat.image = UIImage(named: pets)
    }
    

    @IBAction func allCountAnimals(_ sender: Any) {
        guard let firstVC = presentingViewController as? FirstViewController else {
            return
        }
        if firstVC.dogCount < 8 {
            firstVC.dogCount += 1
        }
        if firstVC.birdCount < 15 {
            firstVC.birdCount += 1
        }
        if firstVC.catCount < 10 {
            firstVC.catCount += 1
        }
        
        firstVC.countNumberLabel.text = "개의 숫자는 \(firstVC.dogCount), 새의 숫자는 \(firstVC.birdCount), 고양이의 숫자는 \(firstVC.catCount)"
        
    }
}
