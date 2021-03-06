//
//  ViewController.swift
//  assignment
//
//  Created by macbook on 2019/12/02.
//  Copyright © 2019 Lance. All rights reserved.
//
//[ 과제 ]
//    1. 영상 파일 참고
//    > 텍스트 필드에 어떤 값을 입력하면 별도의 Label 에 입력된 텍스트 표시.
//    > 텍스트 필드가 활성화 되어 있을 땐 Label 의 텍스트 색상이 파란색이고, Font 크기는 40
//    > 텍스트 필드가 비활성화되면 Label 텍스트 색상이 빨간색이고, Font 크기는 20


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func textFieldEditingDidBegin(_ sender: Any) {
        label.textColor = .blue
        label.font = .systemFont(ofSize: 40)
    }
    
    @IBAction func textFieldPrimaryActionTrigger(_ sender: Any) {
        self.view.endEditing(true)
        label.textColor = .red
        label.font = .systemFont(ofSize: 20)
    }
    
    
    @IBAction func textFiledValueChanged(_ sender: Any) {
        
        label.text = textField.text!
        
        
    }
    
    

}

