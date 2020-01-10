//
//  FirstTableViewCell2.swift
//  ExpressBus
//
//  Created by macbook on 2020/01/08.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

class FirstTableViewCell2: UITableViewCell {

    private let myPageButton = UIButton()
    private let checkingScheduleButton = UIButton()
    private let reserveButton = UIButton()
    private let userGuideButton = UIButton()
    static let identifier = "FirstTableViewCell2"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    func attribute(mypage: String, checkingSchedule: String, reserve: String, userGudie: String) {

        myPageButton.setBackgroundImage(UIImage(named: mypage), for: .normal)
        checkingScheduleButton.setBackgroundImage(UIImage(named: checkingSchedule), for: .normal)
        reserveButton.setBackgroundImage(UIImage(named: reserve), for: .normal)
        userGuideButton.setBackgroundImage(UIImage(named: userGudie), for: .normal)
    }
    private func setupUI() {
        [myPageButton, checkingScheduleButton, reserveButton, userGuideButton].forEach {
            contentView.addSubview($0)
        }
        
        myPageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myPageButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            myPageButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myPageButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            myPageButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25)
        ])
        checkingScheduleButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkingScheduleButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            checkingScheduleButton.leadingAnchor.constraint(equalTo: myPageButton.trailingAnchor),
            checkingScheduleButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            checkingScheduleButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25)
        ])
        reserveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            reserveButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            reserveButton.leadingAnchor.constraint(equalTo: checkingScheduleButton.trailingAnchor),
            reserveButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            reserveButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25)
        ])
        userGuideButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userGuideButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            userGuideButton.leadingAnchor.constraint(equalTo: reserveButton.trailingAnchor),
            userGuideButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            userGuideButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
