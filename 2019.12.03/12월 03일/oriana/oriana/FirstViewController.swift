//
//  ViewController.swift
//  oriana
//
//  Created by macbook on 2019/12/04.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var dogButton: UIButton!
    @IBOutlet weak var birdButton: UIButton!
    @IBOutlet weak var catButton: UIButton!
    
    @IBOutlet weak var countNumberLabel: UILabel!
    
  var dogCount = 0
      
      var birdCount = 0
      
      var catCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
        countNumberLabel.text = "개의 숫자는 \(dogCount), 새의 숫자는 \(birdCount), 고양이의 숫자는 \(catCount)"
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {  super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
        
        switch identifier {
        case "Dog" where dogCount >= 8 :
            return false
        case "Bird" where birdCount >= 15:
            return false
        case "Cat" where catCount >= 10:
            return false
        default:
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let secondVC = segue.destination
            as? SecondViewController else { return }
        
        switch segue.identifier {
        case "Dog":
            secondVC.pets = "dog"
            dogCount += 1
          
        case "Bird":
            secondVC.pets = "bird"
            birdCount += 1
            
        case "Cat":
            secondVC.pets = "cat"
            catCount += 1
        default:
            " "
        }
        
        countNumberLabel.text = "개의 숫자는 \(dogCount), 새의 숫자는 \(birdCount), 고양이의 숫자는 \(catCount)"
    }

    @IBAction func unwindToFirstd(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }


}

