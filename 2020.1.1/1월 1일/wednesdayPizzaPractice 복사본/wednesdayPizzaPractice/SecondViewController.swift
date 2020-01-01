//
//  SecondViewController.swift
//  wednesdayPizzaPractice
//
//  Created by macbook on 2020/01/01.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let SVCcustom = SVCustomView()
    var section: Int = 0
    var row: Int = 0
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        attribute()
        setUP()
    }
    
    func attribute() {
        print(row)
    }
    
    
    
    func attribute(indexPath: IndexPath) {
        
        indexPath.row
        indexPath.section
        
//        SVCcustom.delivery(name: <#T##String#>)
//        let single = Singleton.shared.pizzaName
//        SVCcustom.delivery(name: user!)
//        SVCcustom.delivery(name: single)
    }

    private func setUP() {
        [SVCcustom].forEach {
            self.view.addSubview($0)
        }
        let guide = self.view.safeAreaLayoutGuide
        SVCcustom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            SVCcustom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            SVCcustom.topAnchor.constraint(equalTo: guide.topAnchor),
            SVCcustom.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            SVCcustom.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
}
