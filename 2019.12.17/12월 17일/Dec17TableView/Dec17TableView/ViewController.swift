//
//  ViewController.swift
//  Dec17TableView
//
//  Created by macbook on 2019/12/17.
//  Copyright © 2019 Lance. All rights reserved.
//
// 스토리 보드를 이용한 방법

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 하나의 섹션에 몇개의 로우가 들어가갈지
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        indexPath.section
        indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
        
    }
    
}
