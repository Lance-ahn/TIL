//
//  ViewController.swift
//  autoLayout
//
//  Created by macbook on 2019/12/12.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstView = UIView()
    
    var secondView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        activateLayoutAnchors()
        
        
        firstView.backgroundColor = .red
        view.addSubview(firstView)
        
        secondView.backgroundColor = .blue
        view.addSubview(secondView)
        
        activateLayoutAnchors()
    }
    
    
     private func activateLayoutAnchors() {
        // isActive를 통한 제약조건 활성화
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        firstView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        firstView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        firstView.trailingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: -10).isActive = true
// 
        
        // activate를 통한 제약조건 활성화
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            secondView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            secondView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])

        secondView.widthAnchor.constraint(equalTo: firstView.widthAnchor).isActive = true
    }
}

