//
//  ViewController.swift
//  FBGroupsSwiftUI
//
//  Created by macbook on 2020/01/26.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
   
    private func setupUI() {
        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Search Bar"
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.backgroundColor = .gray
        searchBar.showsCancelButton = true
        showsSearchButton(true)
    }
    
    func showsSearchButton(_ shouldShow: Bool) {
        let searchButton = UIBarButtonItem(
            barButtonSystemItem: .search,
            target: self,
            action: #selector(handleShowSearchBar))
        navigationItem.rightBarButtonItem = shouldShow ? searchButton : nil
    }
    
    func search(_ shouldSearch: Bool) {
        showsSearchButton(!shouldSearch)
        navigationItem.titleView = shouldSearch ? searchBar : nil
    }
    
    // MARK: Actions
    
    @objc private func handleShowSearchBar() {
        search(true)
        searchBar.becomeFirstResponder()
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("Search bar did beging editint")
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("search bar did end editing")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(false)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
}
