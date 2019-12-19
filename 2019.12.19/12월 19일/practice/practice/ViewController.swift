//
//  ViewController.swift
//  practice
//
//  Created by macbook on 2019/12/19.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    var data = Array(1...20)
    var tableView = UITableView()
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = 80
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Hard")
        tableView.register(CustomCell.self, forCellReuseIdentifier: "Custom")
    }
    override func viewSafeAreaInsetsDidChange() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
//    @objc buttondidSet (){
//
//    }
    
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt \(indexPath)")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as? CustomCell else { return UITableViewCell() }
        
        cell.textLabel?.text = String(data[indexPath.row])
//        cell.myButton.addTarget(self, action: #selector(buttondidSet), for: .touchUpInside)
        cell.delegate = self
        
  
        return cell
    }
}

extension ViewController: CustomCellDelegate {
    func didTap(cell: CustomCell) {
        
        tableView.indexPath(for: cell)
        guard let monkey = tableView.indexPath(for: cell) else { return }
        data[monkey.row] += 1
        cell.textLabel?.text = "\(data[monkey.row])"
        
        
    }
}

