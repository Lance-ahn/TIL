//
//  ViewController.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 12. 17..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    let item = ItemCell()
    var data = "1"
    
    @IBOutlet private weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    func setupUI (){
        //          tableView.dataSource = self
        tableView.rowHeight = 80
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Hard")
        tableView.register(ItemCell.self, forCellReuseIdentifier: "Custom")
        
        counts = Array(repeating: 0, count: iPhones.count)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        
    }
    
    let iPhones = ["iPhone 1", "iPhone 7 plus", "iPhone 7", "iPhone 8 plus", "iPhone 11", "iPhone 11pro max", "iPhone 11pro", "iPhone XR", "iPhone XS MAX", "iPhone XS", "iPhone8", "iPhoneSE_Gold", "iPhoneSE_RoseGold","iPhoneX_SpaceGray", "iPhoneX_White"]
    var counts = [Int]()
    
    
    // MARK: - UITableViewDataSource
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return iPhones.count
    }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
     guard let cell = tableView.dequeueReusableCell(withIdentifier: "Custom", for: indexPath) as? ItemCell else { return UITableViewCell() }
//    let cell = tableView.dequeueReusableCell(withIdentifier: "Hard", for: indexPath)
    cell.delegate = self
    
//    cell.textLabel?.text = "\(iPhones[indexPath.row])"
//    cell.imageView?.image = UIImage(named: "\(iPhones[indexPath.row])")
    
    cell.imgView.image = UIImage(named: "\(iPhones[indexPath.row])")
    cell.titleLabel.text = "\(iPhones[indexPath.row])"
    cell.countLabel.text = "\(counts[indexPath.row])"
    cell.myButton.tag = indexPath.row
    
    return cell
  }
}

extension ViewController:ItemCellDelegate {
    func didTap(cell: ItemCell) {
        counts[cell.myButton.tag] += 1
        cell.countLabel.text  = "\(counts[cell.myButton.tag])"
    }
}
