import UIKit

var str = "Hello, playground"


//1. 객체 지향 프로그래밍 (Object-Oriented Programming) 에 대해 예습하기





//[ 도전 과제 ]
//1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

func sum (num1: Int, num2: Int) -> Int {
    return num1 + num2
}
sum(num1: 10, num2: 2)

let closureSum: (Int, Int)->(Int) = { (num1, num2) in
    return num1 + num2
}
closureSum(10, 2)

func funcArg(function: (Int, Int) -> (Int)) {
    
}
funcArg(function: closureSum)

// 0. 원형
funcArg(function: { (num1: Int, num2: Int) -> Int in
    return num1 + num2
})

// 1. 반환타입 축약
funcArg(function: { (num1: Int, num2: Int) in
    return num1 + num2
})

// 2. 매개변수 타입 축약
funcArg(function: { (num1, num2) in
    return num1 + num2
})

// 3. 매개변수 자체와 in을 생략
funcArg(function: {
    return $0 + $1
})

// 4. 함수, 클로저에서 한줄만 있을 때 return 생략
funcArg(function: {
    $0 + $1
})

// 5. trailing closure: 함수 매개변수 중 가장 마지막 변수가 클로저를 전달할 때, 클로저를 () 밖으로 뺄 수 있다
// 매개변수 이름 생략가능, 매개변수가 함수 타입의 매개변수 하나만 있었다면 ()도 생략
funcArg {
    $0 + $1
}


let someClosure: (String, String) -> Bool = {
 $0 > $1
}


//let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
//  let isAscending: Bool
//  if s1 > s2 {
//    isAscending = true
//  } else {
//    isAscending = false
//  }
//  return isAscending
//}








let otherClosure: ([Int]) -> Int = {
    $0.count
}



//let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
//  var count: Int = 0
//  for _ in values {
//    count += 1
//  }
//  return count
//}



let osClosure: ([String]) -> Int = { (values: [String]) -> Int in
    
    var count = values[1].count
    return count
}


let osClosure: ([String]) -> Int = {
    $0[1].count
}

var a = ["ab","cd"]



