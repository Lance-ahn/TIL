//
//  BasicViewController.swift
//  CollectionViewExercises
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class BasicViewController: UIViewController {
  
    let tempCollectionView: UICollectionView = {
       let tempcollectionViewFlowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: tempcollectionViewFlowLayout)
        return collectionView
    }()
    let itemCount = 100
    
  let dataSource = cards
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // edgeIntset = 8
    // 셀간격 줄간격 = 4
    tempCollectionView.backgroundColor = .white
    tempCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Color")
    tempCollectionView.dataSource = self
    tempCollectionView.delegate = self
    
    [tempCollectionView].forEach {
        view.addSubview($0)
    }
    
    let guide = view.safeAreaLayoutGuide
    tempCollectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        tempCollectionView.topAnchor.constraint(equalTo: guide.topAnchor),
        tempCollectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
        tempCollectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
        tempCollectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor),
    ])
  }
}

// MARK: - UICollectionViewDataSource

extension BasicViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Color", for: indexPath)
    cell.backgroundColor = dataSource[indexPath.item].color
    return cell
  }
}

extension BasicViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 80, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
