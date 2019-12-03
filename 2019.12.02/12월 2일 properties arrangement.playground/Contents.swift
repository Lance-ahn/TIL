import UIKit

var str = "Hello, playground"

class Sample {

    // 저장 프로퍼티
    var value1 = 10
    var value2 = 20

    // 지연 저장 프로퍼티
    lazy var value3 = value1 + 10

    // 연산 프로퍼티
    var value4: Int {
        get {
            return value1 + 10
        }
        
        set {
            value2 = newValue + 30
        }
    }

    // 프로퍼티 옵저버
    var label = ""
    var value5 = 0 {
        willSet {
            print("Current Value: \(value5)")
            print("New Value: \(newValue)")
        }
        
        didSet {
            print("Old Value : \(oldValue)")
            print("New Value: \(value5)")
            label = "\(value5)"
        }
    }

    // 타입 프로퍼티
    static var typeValue = 30
    
}

let sample = Sample()
sample.value1
sample.value2
sample.value3
sample.value1 = 20
sample.value3
sample.value4 = 10
sample.value4
sample.value2
sample.value5 = 10
sample.label

Sample.typeValue



class Friend {
    static var common: Int = 100
    var money: Int
    init(_ money: Int) {
        self.money = money
    }
    static func 모금(money: Int) {
        common += money
    }
}

var f1 = Friend(10)
f1.money
Friend.모금(money: f1.money)
var f2 = Friend(20)
f2.money
Friend.모금(money: f2.money)
var f3 = Friend(30)
f3.money
Friend.모금(money: f3.money)
var f4 = Friend(40)
f4.money
Friend.모금(money: f4.money)
var f5 = Friend(50)
f5.money
Friend.모금(money: f5.money)
Friend.common

