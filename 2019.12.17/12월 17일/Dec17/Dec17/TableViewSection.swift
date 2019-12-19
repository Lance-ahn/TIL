//
//  ViewController.swift
//  Dec17
//
//  Created by macbook on 2019/12/17.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

final class TableViewSection: UIViewController {
    
    /***************************************************
     Data :   x ~ y까지의 숫자 (x, y는 임의의 숫자) (10 ~ 50, 60 ~ 78, 0 ~ 100)
     섹션 타이틀을 10의 숫자 단위로 설정하고 각 섹션의 데이터는 해당 범위 내의 숫자들로 구성
     e.g.
     섹션 0 - 0부터 9까지의 숫자
     섹션 1 - 10부터 19까지의 숫자
     ***************************************************/
    
    override var description: String { "Practice 2 - Section" }
    
    //  let data = [5, 7, 16, 19, 22, 29, 30, 39, 44, 48, 50]
    lazy var sectionTitles: [Int] = dataDic.keys.sorted()
    
    let dataArr = Array(0...100)
    var dataDic = [Int: [Int]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.frame)
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellID")
        view.addSubview(tableView)
        
        rebuild()
    }
    
    
    func rebuild() {
        for element in dataArr {
            let section = element / 10
            if var valueArray = dataDic[section] {
                valueArray.append(element)  // [0, 1]
                dataDic[section] = valueArray   // 0: [0  ~ 9]
            } else {
                dataDic[section] = [element]
            }
        }
    }
}


// MARK: - UITableViewDataSource

extension TableViewSection: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView)-> Int {
        dataDic.keys.count // 세션 개수
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // key: 3, 5, 7 -> [3, 5, 7]
        // section : 0 ,1, 2
        String(sectionTitles[section]) // 세션의 이름
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let titles = dataDic.keys.sorted()
        let key = titles[section]
        return dataDic[key]!.count
        //세션안에 셀개수
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        세션내용
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath)
        let key = sectionTitles[indexPath.section]
        let numbers = dataDic[key]!
        cell.textLabel?.text = "\(numbers[indexPath.row])"
        return cell
    }
}
