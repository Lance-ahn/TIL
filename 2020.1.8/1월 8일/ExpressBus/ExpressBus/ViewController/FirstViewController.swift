//
//  ViewController.swift
//  ExpressBus
//
//  Created by macbook on 2020/01/08.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    private let tableView = UITableView()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attribute()
        setupUI()
    }
    func attribute() {
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
        tableView.register(FirstTableViewCell2.self, forCellReuseIdentifier: FirstTableViewCell2.identifier)
        tableView.dataSource = self
        view.backgroundColor = .white
        
    }
    
    func setupUI() {
        [tableView].forEach {
            view.addSubview($0)
        }
        let guide = view.safeAreaLayoutGuide
        tableView.rowHeight = guide.layoutFrame.height/4.5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.heightAnchor.constraint(equalTo: guide.heightAnchor)
        ])
    }
}
extension FirstViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row < 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
            cell.imageInfo(image: data.emojis[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell2.identifier, for: indexPath)
            as! FirstTableViewCell2
            cell.attribute(mypage: "마이페이지", checkingSchedule: "시간표조회", reserve: "예매", userGudie: "이용안내")
            return cell
        }
    }
    
    
}
