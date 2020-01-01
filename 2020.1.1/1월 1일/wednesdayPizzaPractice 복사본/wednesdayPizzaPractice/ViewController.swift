//
//  ViewController.swift
//  wednesdayPizzaPractice
//
//  Created by macbook on 2020/01/01.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let pizzaTableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        Singleton.shared.pizzaMenu = menuData
        attribute()
        setupUI()
        
    }
    
    private func attribute() {
        pizzaTableView.register(PizzaTableViewCell.self, forCellReuseIdentifier: PizzaTableViewCell.identifier)
        pizzaTableView.dataSource = self
        pizzaTableView.delegate = self
    }
    private func setupUI() {
        [pizzaTableView].forEach {
            self.view.addSubview($0)
        }
        
        let guide = self.view.safeAreaLayoutGuide
        pizzaTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pizzaTableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            pizzaTableView.topAnchor.constraint(equalTo: guide.topAnchor),
            pizzaTableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            pizzaTableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
        ])
    }
}
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        Singleton.shared.pizzaMenu.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Singleton.shared.pizzaMenu[section].products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PizzaTableViewCell.identifier, for: indexPath) as! PizzaTableViewCell
        let pizzaInformation = Singleton.shared.pizzaMenu[indexPath.section].products[indexPath.row]
        cell.pizzaInfo(pizzaName: pizzaInformation.name, PizzaCost: "\(pizzaInformation.price)", PizzaPic: pizzaInformation.name)
        return cell
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionImage = UIImageView()
        sectionImage.image = UIImage(named: "\(Singleton.shared.pizzaMenu[section].category)")
        return sectionImage
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = SecondViewController()
        let pizzaName = Singleton.shared.pizzaMenu[indexPath.section].products[indexPath.row].name
        
        secondVC.section = indexPath.section
        secondVC.row = indexPath.row
        
        secondVC.indexPath = indexPath
        
        secondVC.attribute(indexPath: indexPath)
        
        present(secondVC, animated: true)
    }
}
