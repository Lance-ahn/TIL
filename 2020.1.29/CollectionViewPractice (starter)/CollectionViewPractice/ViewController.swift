//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let collectionView: UICollectionView = {
       let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        return collectionView2
    }()

  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationView()
    setupCollectionView()
    
  }
    func setupCollectionView()  {

        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.allowsMultipleSelection = true
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        [collectionView].forEach {
            view.addSubview($0)
        }
        let guide = view.safeAreaLayoutGuide
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: guide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
        ])
    }
    
    func setupNavigationView() {
        let deleteButton = UIBarButtonItem(image: UIImage(systemName: "trash.fill"), style: .plain, target: self, action: #selector(deletePhoto))
        
        navigationItem.rightBarButtonItem = deleteButton
    }

  // MARK: Action
    
    @objc func deletePhoto()  {
        
        // 1. 인덱스 가져오기
        guard let indexPaths = collectionView.indexPathsForSelectedItems else {return}
        print(indexPaths)
        
        // 2. 데이터 지우고
//        for indexPath in indexPaths.sorted(by: { $0.item > $1.item }) {
//            cats.remove(at: indexPath.row)
//            catSelected.remove(at: indexPath.row)
//        }
        indexPaths
            .sorted { $0.item > $1.item }
            .forEach {
                cats.remove(at: $0.item)
                catSelected.remove(at: $0.item)
        }
        
        // 3. 셀 지우고
        collectionView.deleteItems(at: indexPaths)
        
        // 4. 아무셀도 없으면 다시 채우기
        
        //1)  cats 없는지 확인
        if cats.isEmpty {
            cats = originalCats
            catSelected = Array(repeating: false, count: originalCats.count)
            collectionView.reloadData()
            
        }
//        collectionView.reloadData()
        
        
        //2) 없으면 다시 채우기
        
    }
    
}
// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cats.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
    
    cell.catsInfo(catsPhoto: cats[indexPath.item])
    return cell
  }
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let cell = cell as? CollectionViewCell else { return }
        cell.blankInfo(bool: !catSelected[indexPath.item])
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.blankInfo(bool: false)
        catSelected[indexPath.row] = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        cell.blankInfo(bool: true)
        catSelected[indexPath.row] = false
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
    func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        true
    }
    
}
