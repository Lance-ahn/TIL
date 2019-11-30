
/*
 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수
 */

// Optional Binding을 이용한 방식


//
//func threenumbers (str1: String?, str2: String?, str3:String?) -> String {
//
//    var answer = ""
//    if let unwrappedString = str1 {
//     answer += unwrappedString
//}
//    if let unwrappedString = str2 {
//answer += unwrappedString
//}
//    if let unwrappedString = str3 {
//answer += unwrappedString
//}
//return answer
//}
//
//threenumbers(str1: "ab", str2: nil, str3: "ef")

// Nil-coalescing Operator 를 이용한 방식

func threenumber1 (str1: String!, str2: String!, str3: String!) -> String {
    let string1 = str1 ?? ""
    let string2 = str2 ?? ""
    let string3 = str3 ?? ""
    return string1 + string2 + string3
}

threenumber1(str1: "ba", str2: "de", str3: nil)






/*
2개의 자연수와 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic 을 입력 파라미터로 받아 해당 연산의 결과를 반환하는 함수 구현
enum Arithmetic {
  case addition, subtraction, multiplication, division
}
func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
  // 코드
}
*/

enum Arithmetic {
  case addition, subtraction, multiplication, division
}
func calculator(operand1: Int, operand2: Int, op: Arithmetic) -> Int {
    switch op {
    case .addition:
        return operand1 + operand2
    case .subtraction:
        return operand1 - operand2
    case .multiplication:
        return operand1 * operand2
    case .division:
        return operand1 / operand2
    }
}


calculator(operand1: 20, operand2: 5, op: .subtraction)










enum arithmetic {
 case addtion, substraction, multiplication, division
}

func calcuator (a: Int, b:Int, op: arithmetic) -> Int {
    switch op {
    case .addtion:
        return (a + b)
    case .substraction:
        return (a - b)
    case .multiplication:
        return (a * b)
    case .division:
        return (a / b)

    }
}

print(calcuator(a: 20, b: 3, op: .division))











