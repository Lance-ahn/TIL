//
//  Singleton.swift
//  wednesdayPizzaPractice
//
//  Created by macbook on 2020/01/01.
//  Copyright © 2020 Lance. All rights reserved.

import Foundation

class Singleton {
    static let shared = Singleton()
    private init() {}
    var pizzaName = ""
}
