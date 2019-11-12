import UIKit

func 튜플(a: Int, b: (Int, Int)) -> (first: Int, second: Int) {
  return (a + b.0, a + b.1)
}

let result = 튜플(a: 10, b: (20, 30))
result.first
result.second




// for 문을 이용하여 3 의 10 제곱에 대한 결과값을 표현하는 코드 구현

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer = answer * base
}
print("\(base) to the power of \(power) is \(answer)")

// for 문을 이용하여 10부터 1까지 내림차순으로 출력하는 코드 구현

for number in (1...10).reversed() {
    print(number, terminator:" ")
}

print()



// 2 ~ 9 사이의 숫자를 입력받아 해당 숫자에 해당하는 구구단 내용을 출력하는 함수

func multiply (i: Int) {
    for j in 1...9 {
        print("\(i)x\(j)=\(i*j)")
    }
}
multiply(i: 3)


func printMultiplcication (number: Int) {
    var i = 1
    while i <= 9 {
        print("\(number) * \(i) = \(number * i)")
        i += 1
    }
    
}

// 자연수 하나를 입력받아 1부터 해당 숫자 사이의 모든 숫자의 합을 구해 그 합을 반환하는 함수

func numbers (max: Int) -> Int {
    var sum = 0
    var num = 1
    repeat {
        sum += num
        num += 1
    } while sum <= max
    return sum
}
numbers(max: 10)
numbers(max: 50)
numbers(max: 100)

func number (max: Int) -> Int {
    var sum = 0
    // something
    for number in 1...max {
        sum += number
    }
    
    return sum
}
number(max: 10)


//[ 과제 ]
//- 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
//  (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100)

func sum (a: Int,b: Int) -> Int {
    return Int(String(a) + String(b))!
}
sum(a: 32, b: 12)

//- 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수

func truefalse (a: String, b: String) -> Bool {
    if a == b {
        return true
    } else {
        return false
    }
}

truefalse(a: "우유", b: "치즈")


//- 자연수를 입력받아 그 수의 약수를 모두 출력하는 함수

func aliquat (a: Int) {   // aliquat = 약수
    for n in 1...a {
        if a%n == 0 {
            print(n)
        }
    }
}
aliquat(a: 30)

//- 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수

func common35 () {
    for n in 1...100 {
        if  n%3 == 0 && n%5 == 0 {
            print(n)
        }
    }
}
common35()


//[ 도전 과제 ]
//- 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수

func falsetrue (a: Int) -> Bool {
    for number in 2...a-1 {
        if number%a-1 == 0 {
            return false
        }
    }
    return true
}
        
    
falsetrue(a: 11)


//- 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
//  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
//  e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
//  함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력

func pabo (a: Int) -> Int {
    var number = [0, 1]
    for n in 2...a {
        number.append(number[n-2]+number[n-1])
    }
    return number[a]

}


//- 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
//  (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
//  ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
//      윤년X 예시 - 200, 300, 500, 600, 1900, 2100


func moon (a: Int) -> Bool {
    switch a {
    case a where a%400==0 :
        return true
    case a where a%100==0 :
        return false
    case a where a%4==0 :
        return true
    default:
        return false
    }
}

moon(a: 1000)
