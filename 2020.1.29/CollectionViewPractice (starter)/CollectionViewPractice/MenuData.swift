//
//  MenuData.swift
//  CollectionViewPractice
//
//  Created by macbook on 2020/01/28.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit

struct Cats {
    let cats: String
}

//let cats: [String] = ["cat0","cat1","cat2","cat3","cat4","cat5","cat6","cat7","cat8","cat9"]

var originalCats: [String] = {
    var arr = [String]()
    (0...19).forEach { arr.append("cat\($0 % 10)") }
    return arr
}()

var cats: [String] = {
    var arr = [String]()
    (0...19).forEach { arr.append("cat\($0 % 10)") }
    return arr
}()

var catSelected = Array.init(repeatElement(false, count: cats.count))




