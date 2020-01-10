//
//  ViewController.swift
//  201010ScrollView
//
//  Created by macbook on 2020/01/10.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollerView: UIScrollView!
    
    @IBOutlet weak var scroll: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollerView.delegate = self
        setPageControl()
    }
    
    private func setPageControl() {
        scrollerView.isPagingEnabled = true
        scrollerView.contentSize = CGSize(width: UIScreen.main.bounds.width * 4, height: UIScreen.main.bounds.height)

        scroll.isUserInteractionEnabled = false
    }
}
// MARK: -
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scroll.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}

