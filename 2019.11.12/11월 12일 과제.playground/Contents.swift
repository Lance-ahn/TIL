import UIKit

var str = "Hello, playground"

// 1. 이름과 나이를 입력 받아 자신을 소개하는 글을 출력하는 함수

func introducing (name : String, age : Int) -> String {
    return "I am \(name) and \(age)"
}
print(introducing(name: "lance", age: 20))



// 2.정수를 하나 입력받아 2의 배수 여부를 반환하는 함수
// input

func isMultiplyByTwo (Input: Int) -> Bool {
    if Input%2 == 0 {
        return true
    } else {
        return false
    }
}

isMultiplyByTwo(Input: 5)



// 3. 정수를 두 개 입력 받아 곱한 결과를 반환하는 함수 (파라미터 하나의 기본 값은 10)
func multiple (a: Int, b: Int) -> Int {
    return a*b
}

multiple(a: 3, b: 10)



// 4. 4과목의 시험 점수를 입력받아 평균 점수를 반환하는 함수

func average (inputs: Double...) -> Double {
    var total = 0.0
    for num in inputs {
        total += num
    }
    return total/Double(inputs.count)
}

average(inputs: 2.1, 1.1)

// 5. 점수를 입력받아 학점을 반환하는 함수 만들기 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)
func grade (scores: Int) -> String {
    switch scores {
    case 90...100:
        return "A"
    case 80...90:
        return "B"
    case 70...80:
        return "C"
    case 0...70:
        return "F"
    default:
        return "값을 알 수 없음"
    }
}

grade(scores: 88)


//6. 가변 인자 파라미터를 이용해 점수를 여러 개 입력받아 평균 점수에 대한 학점을 반환하는 함수 (90점 이상 A, 80점 이상 B, 70점 이상 C, 그 이하 F)

var score = Int.random(in: 0...100)

func gradeAverage (scores: Int...) -> String {
    var total = 0.0
    for score in scores {
        total = total + Double(score)
    }
    let average = total/Double(scores.count)
    switch average {
    case 90...100:
        return "A"
        case 80...89:
            return "B"
        case 70...79:
            return "C"
        case 0...69:
            return "F"
    default:
        return "알 수 없는 값"
    }

}

gradeAverage(scores: 34,33,23)


