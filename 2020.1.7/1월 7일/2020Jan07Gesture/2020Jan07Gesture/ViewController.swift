//
//  ViewController.swift
//  2020Jan07Gesture
//
//  Created by macbook on 2020/01/07.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let 횟수 = UILabel()
    private let 좌표 = UILabel()
    private let countLabel = UILabel()
    private let coordinate1 = UILabel()
    private let coordinate2 = UILabel()
    let formatter = NumberFormatter()
    private var count = 0
    var initialPoint = CGPoint(x: -10, y: -10)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 1
        let gesture = UITapGestureRecognizer()
        gesture.delegate = self
        setupUI()
    }
    private func setupUI() {
        [횟수, 좌표, countLabel, coordinate1, coordinate2].forEach {
            view.addSubview($0)
        }
        횟수.text = "횟수 :"
        횟수.frame = CGRect(x: 20, y: 100, width: 50, height: 100)
        횟수.textColor = .black
        좌표.text = "좌표 :"
        좌표.frame = CGRect(x: 20, y: 200, width: 50, height: 100)
        좌표.textColor = .black
        countLabel.frame = CGRect(x: 60, y: 100, width: 100, height: 100)
        coordinate1.frame = CGRect(x: 60, y: 200, width: 100, height: 100)
        coordinate2.frame = CGRect(x: 120, y: 200, width: 100, height: 100)
    }

// 1. touchesBegan
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super.touchesBegan(touches, with: event)
//        guard let touch = touches.first else { return }
//        let touchPoint = touch.location(in: touch.view)
//
//        let numString1 = formatter.string(from: touchPoint.x as NSNumber)
//        let numString2 = formatter.string(from: touchPoint.y as NSNumber)
//        coordinate1.text = "\(numString1!)"
//        coordinate2.text = "\(numString2!)"
//
//        let boundry = CGRect(x: initialPoint.x - 10, y: initialPoint.y - 10, width: 20, height: 20)
//        if boundry.contains(touchPoint){
//            count += 1
//        } else {
//            count = 1
//            initialPoint = touchPoint
//        }
//        countLabel.text = "\(count)"
//    }
// 2. tapgestureRecognizer
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
         let touchPoint = sender.location(in: sender.view)

        let numString1 = formatter.string(from: touchPoint.x as NSNumber)
        let numString2 = formatter.string(from: touchPoint.y as NSNumber)
        coordinate1.text = "\(numString1!)"
        coordinate2.text = "\(numString2!)"
        let boundry = CGRect(x: initialPoint.x - 10, y: initialPoint.y - 10, width: 20, height: 20)
        if boundry.contains(touchPoint){
            count += 1
        } else {
            count = 1
            initialPoint = touchPoint
        }
        countLabel.text = "\(count)"
    }
}


extension ViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let touchPoint = touch.location(in: touch.view)
        let numString1 = formatter.string(from: touchPoint.x as NSNumber)
        let numString2 = formatter.string(from: touchPoint.y as NSNumber)
        coordinate1.text = "\(numString1!)"
        coordinate2.text = "\(numString2!)"
        let boundry = CGRect(x: initialPoint.x - 10, y: initialPoint.y - 10, width: 20, height: 20)
        if boundry.contains(touchPoint){
            count += 1
        } else {
            count = 1
            initialPoint = touchPoint
        }
        countLabel.text = "\(count)"
         return true
    }
}



