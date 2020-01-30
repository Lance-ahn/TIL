//
//  SupplementaryViewController.swift
//  CollectionViewExercises
//
//  Created by Giftbot on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

final class SupplementaryViewController: UIViewController {
    
    var dataSource: [Section] = sections
    
    let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        
        cv.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "Cell"
        )
        
        cv.register(
            SectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderView.identifier
        )
        
        cv.register(
            SectionFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: SectionFooterView.identifier
        )
        
        cv.backgroundColor = .white
        cv.dataSource = self
        view.addSubview(cv)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLongPressGestureRecognizer()
        setupFlowlayout()
    }
    func setupFlowlayout() {
        let itemInLine: CGFloat = 4
        let spacing: CGFloat = 10
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let cvWidth = collectionView.bounds.width
        let contentSize =  cvWidth - insets.left - insets.right - ( spacing * (itemInLine - 1) )
        let itemSize = (contentSize / itemInLine).rounded(.down)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = insets
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        layout.headerReferenceSize = CGSize(width: 60, height: 60)
        layout.sectionHeadersPinToVisibleBounds = true
        layout.footerReferenceSize = CGSize(width: 60, height: 60)
        
    }
    
    
    func setupLongPressGestureRecognizer() {
        let gesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(reorderCollectionViewItem(_:)))
        
        collectionView.addGestureRecognizer(gesture)
    }
    
    @objc func reorderCollectionViewItem(_ sender: UILongPressGestureRecognizer) {
        // 1. CollectionView 안에서 gesture가 발생한 좌표
        // location(in:) : in에 들어가는 view의 좌표계 안에서 gesture가 발생된 좌표 반환
        let location = sender.location(in: collectionView)
        
        // 2. Gesture 상태에 따라 item movement 동작을 연결
        switch sender.state {
        case .began:
            guard let indexPath = collectionView.indexPathForItem(at: location) else { break }
            collectionView.beginInteractiveMovementForItem(at: indexPath)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(location)
        case .cancelled:
            collectionView.cancelInteractiveMovement()
            return
        case .ended:
            print("Ended")
            collectionView.endInteractiveMovement()
        default:
            break
        }
    }
}


// MARK: - UICollectionViewDataSource

extension SupplementaryViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource[section].cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        
        cell.backgroundColor = dataSource[indexPath.section].cards[indexPath.item].color
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard sourceIndexPath != destinationIndexPath else { return }
        
        let element = dataSource[sourceIndexPath.section].cards.remove(at: sourceIndexPath.item)
        
        dataSource[destinationIndexPath.section].cards.insert(element, at: destinationIndexPath.item)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.identifier,
                for: indexPath) as! SectionHeaderView
            header.configure(title: "섹션\(indexPath.section + 1)" )
            
            return header
        } else {
            
            let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionFooterView.identifier,
                for: indexPath) as! SectionFooterView
            
            footer.lineInfo(color: .black)
            return footer
        }
    }
}

//extension
