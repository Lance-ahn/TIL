import UIKit

var str = "Hello, playground"

/*
[보기] 철수 - apple, 영희 - banana, 진수 - grape, 미희 - strawberry
위 보기처럼 학생과 좋아하는 과일을 매칭시킨 정보를 Dictionary 형태로 만들고
스펠링에 'e'가 들어간 과일을 모두 찾아 그것과 매칭되는 학생 이름을 배열로 반환하는 함수
*/

var fruit = ["철수": "apple", "영희": "banana", "진수" : "grape", "미희" : "strawberry"]

func searchE(dict: [String : String]) -> [String]{
var result = [String]()

    for (key, value) in dict {
        if value.contains("e") {
            result.append(key)
        }
        
    }
    return result
}

print(searchE(dict: ["철수": "apple", "영희": "banana", "진수" : "grape", "미희" : "strawberry"]))




//func searchE(dict: [String : String]) -> [String] {
//    var result: [String] = []
//    for (key, value) in dict {
//        if value.contains("e") {
//            result.append(key)
//        }
//    }
//    return  result
//}


/*
임의의 정수 배열을 입력받았을 때 홀수는 배열의 앞부분, 짝수는 배열의 뒷부분에 위치하도록 구성된 새로운 배열을 반환하는 함수
ex) [2, 8, 7, 1, 4, 3] -> [7, 1, 3, 2, 8, 4]
*/


func switchnum (arr : [Int]) -> [Int] {
    var frontarr: [Int] = []
    var rearArr: [Int] = []

    for num in arr {
        if num.isMultiple(of: 2){
            rearArr.append(num)
        } else {
            frontarr.append(num)
        }
    }
    return frontarr + rearArr
}

switchnum(arr: [2, 5, 1, 59, 32])
switchnum(arr: [7, 498, 32, 5, 64])



/*
0 ~ 9 사이의 숫자가 들어있는 배열에서 각 숫자가 몇 개씩 있는지 출력하는 함수
입력 : [1, 3, 3, 3, 8]
결과 :
[
"숫자 1 : 1개"
"숫자 3 : 3개"
"숫자 8 : 1개"
]
 */



func count1 (arr : [Int]) -> [String] {
    var dic = [Int:Int]()
    var answer = [String]()
    for key in arr {
        if dic[key] == nil {
            dic[key] = 1
        } else {
        dic[key]! += 1
        }
    }
    print(dic)

    for (key, value) in dic {
        answer = answer + [("숫자 \(key) : \(value)개")]

    }
    return answer
}



count1(arr: [3,5,3,6,7])

// 인트로 값을 배열로 받는다 값이 없는 딕션어리를 변수에 선언한다. 반복문을 이용해서 값들을 확인한다.
// 딕션어리로 만든다 출력한다








/*
자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
ex) 123 -> 321 , 10293 -> 39201
*/

func reverse (num: Int) -> Int {
    var reversedNumber = 0
    var num = num
    while num > 0 {
        reversedNumber = reversedNumber * 10 + num % 10
        num /= 10
    }
    return reversedNumber
}

reverse(num: 42)


/*
 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
 ex) true - 123, 310, 369   /  false - 100, 222, 770
 */
func numbertrue (a: Int) -> Bool {
    if 100...900 ~= a {
    var number1 = String(a)
    var number2 = Set(number1)
        return number2.count == number1.count
    } else {
        print ("100과 900사이 숫자를 넣어주세요")
        return false
    }
}

numbertrue(a: 437)






/*
주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
e.g. ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
*/




/*
식육목 모식도 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터 저장하기
+ 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기
*/

