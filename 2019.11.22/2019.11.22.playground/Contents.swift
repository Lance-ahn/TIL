import UIKit

var str = "Hello, playground"

//
//
//[ 과제 - 알고리즘 ]
//1. 입력받은 숫자의 모든 자리 숫자 합계를 출력하기
//e.g.  123 -> 6 ,  5678 -> 26

func change (number: Int) -> Int {
    var sum = 0

    var number = number
    while number != 0 {
        var digit = number % 10
        sum += digit
        var base = number / 10
        number = base
    }
    return sum
}

change(number: 123)

//2. 하샤드 수 구하기
//- 하샤드 수 : 자연수 N의 각 자릿수 숫자의 합을 구한 뒤, 그 합한 숫자로 자기 자신이 나누어 떨어지는 수
//e.g. 18의 자릿수 합은 1 + 8 = 9 이고, 18은 9로 나누어 떨어지므로 하샤드 수.







//[ 과제 - 앱 구현 ]
//1. UISwitch, UISegmentedControl 을 이용한 문제
//- UISwitch : On, Off 가 바뀔 때마다 Label 의 내용이 On, Off 로 표시되도록 구현
//- UISegmentedControl : 선택 내용이 바뀔 때마다 Label 의 내용도 해당 타이틀 값으로 함께 변경되도록 구현
//참고로, 위 2개는 버튼과 달리 event 처리를 touchUpInside 가 아니라 valueChanged 라는 것을 활용해야 함
//
//


