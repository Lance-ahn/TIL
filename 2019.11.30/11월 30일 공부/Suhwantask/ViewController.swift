//
//  ViewController.swift
//  Suhwantask
//
//  Created by macbook on 2019/11/30.
//  Copyright © 2019 Lance. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    func setLabel (text: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        let label = UILabel()
        label.text = text
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(label)
        
    }
    func setLabelNumber (label: UILabel, text: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        label.text = text
        label.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(label)
    }
    
    let jjajangQuantityLabel = UILabel()
    let jjambbongQuantityLabel = UILabel()
    let tangsuyukQuantityLabel = UILabel()
    let walletLabel = UILabel()
    let totalCostLabel = UILabel()
    
    var jjajangQuantity = 0
    var jjambbongQuantity = 0
    var tangsuyukQuantity = 0
    var wallet = 70000
    var totalCost = 0
    
    
    func setButton (button: UIButton, title: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, backgroundColor: UIColor, textColor: UIColor){
    
        button.setTitle(title, for: .normal)
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        button.backgroundColor = backgroundColor
        button.titleLabel?.textColor = textColor
        self.view.addSubview(button)
    }
    
    
//@objc func
    
    
    let jjajangButton = UIButton()
    let jjambbongButton = UIButton()
    let tangsuyukButton = UIButton()
    
    let reset = UIButton()
    let payment = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
        
        
        setLabel(text: "메뉴",    x: 40, y: 70, width: 40, height: 30)
        setLabel(text: "가격",    x: 130, y: 70, width: 40, height: 30)
        setLabel(text: "수량",    x: 210, y: 70, width: 40, height: 30)
        setLabel(text: "짜장면",  x: 40, y: 140, width: 80, height: 40)
        setLabel(text: "짬뽕",    x: 40, y: 210, width: 80, height: 40)
        setLabel(text: "탕수육",  x: 40, y: 280, width: 80, height: 40)
        setLabel(text: "소지금",  x: 40, y: 350, width: 80, height: 40)
        setLabel(text: "결제금액", x: 40, y: 420, width: 80, height: 40)
        setLabel(text: "5000원", x: 130, y: 140, width: 80, height: 40)
        setLabel(text: "6000원", x: 130, y: 210, width: 80, height: 40)
        setLabel(text: "12000원", x: 130, y: 280, width: 80, height: 40)
        
        setLabelNumber(label: jjajangQuantityLabel , text: "\(jjajangQuantity)", x: 210, y: 140, width: 40, height: 30)
        jjajangQuantityLabel.textColor = .label
        
        setLabelNumber(label: jjambbongQuantityLabel, text: "\(jjambbongQuantity)", x: 210, y: 210, width: 40, height: 30)
        jjambbongQuantityLabel.textColor = .label
        
        setLabelNumber(label: tangsuyukQuantityLabel, text: "\(tangsuyukQuantity)", x: 210, y: 280, width: 40, height: 30)
        tangsuyukQuantityLabel.textColor = .label
        
        setLabelNumber(label: walletLabel, text: "\(wallet)", x: 150, y: 350, width: 140, height: 40)
        setLabelNumber(label: totalCostLabel, text: "\(totalCost)", x: 150, y: 420, width: 140, height: 40)
        
        
        
        setButton(button: jjajangButton, title: "주문", x: 260, y: 140, width: 40, height: 30, backgroundColor: .black, textColor: .blue)
        jjajangButton.addTarget(self, action: #selector(jjajangOrder), for: .touchUpInside)
        
        setButton(button: jjambbongButton, title: "주문", x: 260, y: 210, width: 40, height: 30, backgroundColor: .black, textColor: .blue)
        jjambbongButton.addTarget(self, action: #selector(jjambbongOrder), for: .touchUpInside)
        
        setButton(button: tangsuyukButton, title: "주문", x: 260, y: 280, width: 40, height: 30, backgroundColor: .black, textColor: .blue)
        tangsuyukButton.addTarget(self, action: #selector(tangsuyukOrder), for: .touchUpInside)
        
        setButton(button: reset, title: "초기화", x: 260, y: 350, width: 100, height: 30, backgroundColor: .green, textColor: .black)
        reset.addTarget(self, action: #selector(resetTouched), for: .touchUpInside)
        
        setButton(button: payment, title: "결제", x: 260, y: 420, width: 100, height: 30, backgroundColor: .orange, textColor: .black)
        payment.addTarget(self, action: #selector(paymentTouched), for: .touchUpInside)
        
    }

    @objc private func jjajangOrder () {
        jjajangQuantity += 1
        jjajangQuantityLabel.text = "\(jjajangQuantity)"
        totalCost += 5000
        totalCostLabel.text = "\(totalCost)"
    }
    @objc private func jjambbongOrder() {
        jjambbongQuantity += 1
        jjambbongQuantityLabel.text = "\(jjambbongQuantity)"
        totalCost += 6000
        totalCostLabel.text = "\(totalCost)"
    }
    @objc private func tangsuyukOrder() {
        tangsuyukQuantity += 1
        tangsuyukQuantityLabel.text = "\(tangsuyukQuantity)"
        totalCost += 12000
        totalCostLabel.text = "\(totalCost)"
    }
    @objc private func resetTouched () {
        jjajangQuantity = 0
        jjambbongQuantity = 0
        tangsuyukQuantity = 0
        totalCost = 0
        wallet = 70000
        
        walletLabel.text = "\(wallet)"
        jjajangQuantityLabel.text = "\(jjajangQuantity)"
        jjambbongQuantityLabel.text = "\(jjambbongQuantity)"
        tangsuyukQuantityLabel.text = "\(tangsuyukQuantity)"
        totalCostLabel.text = "\(totalCost)"
        
    }
    @objc private func paymentTouched () {
        let alertController = UIAlertController(title: "결제하기", message: "총 결제 금액은\(totalCost) 입니다. ", preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "확인", style: .default) {_ in
            if self.totalCost <= self.wallet {
                self.wallet -= self.totalCost
                self.walletLabel.text = "\(self.wallet)"
                self.jjajangQuantity = 0
                self.jjambbongQuantity = 0
                self.tangsuyukQuantity = 0
                
                self.jjajangQuantityLabel.text = "\(self.jjajangQuantity)"
                self.jjambbongQuantityLabel.text = "\(self.jjambbongQuantity)"
                self.tangsuyukQuantityLabel.text = "\(self.tangsuyukQuantity)"
                
                self.totalCost = 0
                self.totalCostLabel.text = "\(self.totalCost)"
                
            } else {
                let overCost = UIAlertController(title: "결제불가", message: "잔액이 부족합니다.", preferredStyle: .alert)
                
                let okButtonBack = UIAlertAction(title: "확인", style: .default)
                
                overCost.addAction(okButtonBack)
                self.present(overCost, animated: true)
            }
       
            
        }
        
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(cancelButton)
        alertController.addAction(okButton)
        
        self.present(alertController, animated: true)
        
    }
    
    

}

