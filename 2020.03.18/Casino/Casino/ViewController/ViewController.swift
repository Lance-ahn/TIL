//
//  ViewController.swift
//  Casino
//
//  Created by macbook on 2020/02/14.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: Views
    
    private let machineImageView = UIImageView()
    private let pickerView = UIPickerView()
    private let displayImageView = UIImageView()
    private let leverImageView = UIImageView()
    private let resultDisplay = UILabel()
    private let currentCashImageView = UIImageView()
    private let currentCashLabel = UILabel()
    private let betLabel = UILabel()
    private let stepper = UIStepper()
    private let cashToBetLabel = UILabel()
    
    // MARK: Model(Data)
    
    private let images = [#imageLiteral(resourceName: "dimond"),#imageLiteral(resourceName: "crown"),#imageLiteral(resourceName: "bar"),#imageLiteral(resourceName: "seven"),#imageLiteral(resourceName: "cherry"),#imageLiteral(resourceName: "lemon")]
    
    private var cashToBet : Int = 10 {
        didSet {
            cashToBetLabel.text = "\(cashToBet)$"
        }
    }
    
    // get current displayed cash, remove '$'
    private var currentCash : Int = 500 {
        didSet {
            currentCashLabel.text = "\(currentCash)$"
            stepper.maximumValue = Double(currentCash)
        }
    }
    
    // MARK: ViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        setupUI()
        setUpSwipeGesture()
    }
    
    // MARK: Initialize
    private func setupUI() {
        machineImageView.image = UIImage(named: "machine")
        displayImageView.image = UIImage(named: "bottom")
        leverImageView.image = UIImage(named: "single_mot")
        currentCashImageView.image = UIImage(named: "change")
        
        resultDisplay.textColor = UIColor.white
        resultDisplay.text = "Start"
        resultDisplay.textAlignment = .center
        resultDisplay.font = .systemFont(ofSize: 40)
        resultDisplay.adjustsFontSizeToFitWidth = true
        
        currentCashLabel.textColor = UIColor.white
        currentCashLabel.text = "\(currentCash)$"
        currentCashLabel.textAlignment = .center
        currentCashLabel.font = .systemFont(ofSize: 30)
        
        betLabel.textColor = UIColor.white
        betLabel.text = "Bet"
        betLabel.textAlignment = .center
        betLabel.font = .systemFont(ofSize: 25)
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        cashToBetLabel.textColor = UIColor.white
        cashToBetLabel.text = "\(cashToBet)$"
        cashToBetLabel.textAlignment = .center
        cashToBetLabel.font = .systemFont(ofSize: 25)
        
        stepper.tintColor = UIColor.yellow
        stepper.setDecrementImage(stepper.decrementImage(for: .normal), for: .normal)
        stepper.setIncrementImage(stepper.incrementImage(for: .normal), for: .normal)
        
        stepper.autorepeat = true
        stepper.minimumValue = 10
        stepper.stepValue = 10
        stepper.maximumValue = Double(currentCash)
        stepper.addTarget(self, action: #selector(stepperAction(_:)), for: .valueChanged)
        
        setUpConstraints()
    }
    private func setUpConstraints()  {
        [machineImageView, pickerView, displayImageView, leverImageView , resultDisplay, currentCashImageView, cashToBetLabel, betLabel,stepper, currentCashLabel, stepper].forEach {
            view.addSubview($0)
        }
        
        let guide = view.safeAreaLayoutGuide
        machineImageView.snp.makeConstraints {
            $0.top.equalTo(guide.snp.top)
            $0.leading.equalTo(guide.snp.leading)
            $0.trailing.equalTo(guide.snp.trailing)
            $0.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        
        pickerView.snp.makeConstraints {
            $0.top.equalTo(machineImageView.snp.centerY).offset(-20)
            $0.leading.equalTo(guide.snp.leading).offset(20)
            $0.height.equalTo(machineImageView.snp.height).multipliedBy(0.4)
            $0.width.equalTo(machineImageView.snp.width).multipliedBy(0.85)
        }
        
        displayImageView.snp.makeConstraints {
            $0.top.equalTo(machineImageView.snp.bottom)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalTo(view.snp.width).multipliedBy(0.6)
            $0.height.equalTo(machineImageView.snp.height).multipliedBy(0.5)
        }
        
        resultDisplay.snp.makeConstraints {
            $0.centerX.equalTo(displayImageView.snp.centerX)
            $0.centerY.equalTo(leverImageView.snp.centerY)
            $0.height.equalTo(displayImageView.snp.height).multipliedBy(0.5)
            $0.width.equalTo(displayImageView.snp.width).multipliedBy(0.8)
        }
        
        leverImageView.snp.makeConstraints {
            $0.top.equalTo(machineImageView.snp.bottom).offset(8)
            $0.leading.equalTo(displayImageView.snp.trailing)
            $0.width.equalTo(displayImageView.snp.width).multipliedBy(0.2)
            $0.height.equalTo(displayImageView.snp.height).multipliedBy(0.8)
        }
        
        currentCashImageView.snp.makeConstraints {
            $0.top.equalTo(displayImageView.snp.bottom).offset(10)
            $0.leading.equalTo(guide.snp.leading)
            $0.width.equalTo(displayImageView.snp.width).multipliedBy(0.3)
            $0.height.equalTo(displayImageView.snp.height).multipliedBy(0.5)
        }
        
        currentCashLabel.snp.makeConstraints {
            $0.top.equalTo(displayImageView.snp.bottom).offset(10)
            $0.leading.equalTo(currentCashImageView.snp.trailing)
            $0.width.equalTo(displayImageView.snp.width).multipliedBy(0.4)
            $0.height.equalTo(displayImageView.snp.height).multipliedBy(0.5)
        }
        
        betLabel.snp.makeConstraints {
            $0.top.equalTo(displayImageView.snp.bottom)
            $0.trailing.equalTo(guide.snp.trailing).offset(-10)
            $0.width.equalTo(displayImageView.snp.width).multipliedBy(0.3)
            $0.height.equalTo(displayImageView.snp.height).multipliedBy(0.25)
        }
        
        stepper.snp.makeConstraints {
            $0.top.equalTo(betLabel.snp.bottom)
            $0.trailing.equalTo(guide.snp.trailing)
            $0.width.equalTo(displayImageView.snp.width).multipliedBy(0.42)
            $0.height.equalTo(displayImageView.snp.height).multipliedBy(0.15)
        }
        
        cashToBetLabel.snp.makeConstraints {
            $0.top.equalTo(stepper.snp.bottom)
            $0.trailing.equalTo(guide.snp.trailing).offset(-20)
            $0.width.equalTo(displayImageView.snp.width).multipliedBy(0.3)
            $0.height.equalTo(displayImageView.snp.height).multipliedBy(0.25)
        }
    }
    
    
    private func setUpSwipeGesture() {
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(responseToSwipeGesture(gesture:)))
        swipeGesture.direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeGesture)
    }
    
    
    // MARK: - Action
    
    @objc private func stepperAction(_ sender: UIStepper) {
        cashToBet = Int(sender.value)
    }
    
    
    @objc private func responseToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.down: self.spinAction()
            default: break
            }
        }
    }
    
    private func animateLever(view: UIImageView, images: [UIImage], duration : TimeInterval, repeatCount: Int) {
        view.animationImages = images
        view.animationDuration = duration
        view.animationRepeatCount = repeatCount
        view.startAnimating()
    }
    
    func spinAction() {
        leverImageView.isUserInteractionEnabled = false // disable clicking
        // animation of bandit handle
        animateLever(view: leverImageView, images: #imageLiteral(resourceName: "mot").spriteSheet(cols: 14, rows: 1), duration: 0.5, repeatCount: 1)
        resultDisplay.text = ""

        roll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.checkWin()
            self.leverImageView.isUserInteractionEnabled = true
        }
    }

    private func roll() { // roll pickerview
        var delay : TimeInterval = 0
        // iterate over each component, set random img
        for componentIndex in 0..<pickerView.numberOfComponents{
            let row = (0..<pickerView.numberOfRows(inComponent: componentIndex)).randomElement()
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.pickerView.selectRow(row ?? 0, inComponent: componentIndex, animated: true)
            }
            delay += 0.30
        }
    }
    
    private func checkWin() {
        
        var isJackPot = true
        var targetIndex = -1
        
        for componentIndex in 0..<pickerView.numberOfComponents {
            let selectedIndex = pickerView.selectedRow(inComponent: componentIndex) % images.count
            
            if targetIndex < 0 {
                // 첫 번째 선택된 이미지 저장
                targetIndex = selectedIndex
            } else {
                // 두 번째 저장된 이미지와 비교
                if targetIndex != selectedIndex {
                    isJackPot = false
                    break
                }
            }
        }
        if isJackPot {
            // 성공
            animateLever(view: machineImageView, images: [#imageLiteral(resourceName: "machine"),#imageLiteral(resourceName: "machine_off")], duration: 1, repeatCount: 15)
            animateLever(view: currentCashImageView, images: [#imageLiteral(resourceName: "change"),#imageLiteral(resourceName: "extra_change")], duration: 1, repeatCount: 15)
            let profit = 200 + cashToBet
            resultDisplay.text = "YOU WON \(profit)"
            currentCash += profit
            
            
        } else {
            // 실패
            resultDisplay.text = "TRY AGAIN"
            currentCash -= cashToBet
            cashToBet = Int(stepper.value)
            
            if currentCash == 0 {
                gameOver()
            }
        }
    }
    private func gameOver() {
        let alert = UIAlertController(title: "Game Over", message: "You have \(currentCash)$ \nPlay Again?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            self.startGame()
        }))
        self.present(alert,animated: true)
    }
    
    private func startGame() {
        currentCash = 500
        cashToBet = 10
        
        for componentIndex in 0..<pickerView.numberOfComponents {
        pickerView.selectRow(0, inComponent: componentIndex, animated: true)
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count * 10
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let index = row % images.count
        return UIImageView(image: images[index])
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return images[component].size.height + 1
    }
}
