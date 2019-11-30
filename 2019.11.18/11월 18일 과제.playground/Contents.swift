import UIKit

var str = "Hello, playground"

// squre
class square {
    var edge: Int
    init(edge: Int) {
        self.edge = edge
    }
    func circumference () -> Int{
        return 4 * edge
    }
    func area () -> Int{
        return edge * edge
    }
}

class rectangle {
    var width : Int
    var length : Int
    
    init(width: Int, length: Int) {
        self.length = length
        self.width = width
    }
    func circumference(length: Int, width: Int) -> Int {
        return 2 * length + 2 * width
    }
    func area() -> Int {
        return length * width
    }
}

class Circle {
    var radius: Double
    init(radius : Double){
        self.radius = radius
    }
    func circumference() -> Double{
        return 2 * Double.pi * radius
    }
    func area() -> Double {
        return Double.pi * radius * radius
    }
}

class Triangle {
    var height: Int
    var bottom: Int
    init(height: Int, bottom: Int) {
        self.height = height
        self.bottom = bottom
    }
    func area(height: Int, bottom: Int) -> Int {
        return 1/2 * height * bottom
    }
}

class trapezoid {
    var height : Int
    var bottom : Int
    var top : Int
    init(height: Int, bottom: Int, top: Int) {
        self.height = height
        self.bottom = bottom
        self.top = top
    }
    func area(height: Int, bottom: Int, top: Int) -> Int{
        return 1/2 * height * (bottom + top)
    }
}

class cube {
    var edge : Int
    init(edge: Int) {
        self.edge = edge
    }
    func area(edge: Int) -> Int {
        return edge * edge * edge
    }
}

class rectangularSolid {
    var width: Int
    var length: Int
    var height: Int
    init(width: Int, length: Int, height: Int) {
        self.width = width
        self.length = length
        self.height = height
    }
    func area(width: Int, length: Int, height: Int) -> Int {
        return width * length * height
    }
}

class circularCylinder {
    var circle: Circle
    var radius: Double
    var height: Double
    init(radius: Double, height: Double) {
        self.radius = radius
        self.height = height
        circle = Circle(radius: <#T##Double#>)
    }
    
    func area(radius: Double, height: Double) -> Double {
//        return Double.pi * radius * radius * height
        return circle.area() * height
    }
}

class sphere {
    var radius: Double
    init(radius: Double) {
        self.radius = radius
    }
    func area(radius: Double) ->  Double{
        return 4/3 * Double.pi * radius * radius * radius
    }
}

class cone {
    var radius: Double
    var height: Double
    init(radius: Double, height: Double) {
        self.radius = radius
        self.height = radius
    }
    func area(radius: Double, height: Double) -> Double {
        return 1/3 * Double.pi * radius * radius * height
    }
}

//1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
//   구현 내용은 자유롭게
//
// ** 강아지 (Dog)
// - 속성: 이름, 나이, 몸무게, 견종
// - 행위: 짖기, 먹기
class Dog {
    var name : String
    var age : Int
    var weight : Int
    var blood : String
    init(name: String, age: Int, weight: Int, blood: String) {
        self.name = name
        self.age = age
        self.weight = weight
        self.blood = blood
    }
    func bark() {
        print("bark")
    }
    func eat() {
        print("eat")
    }
    }



//
// ** 학생 (Student)
// - 속성: 이름, 나이, 학교명, 학년
// - 행위: 공부하기, 먹기, 잠자기
class Student {
    var name : String
    var age : Int
    var school : Int
    var grade : Int
    init(name: String, age: Int, school: Int, grade: Int) {
        self.name = name
        self.age = age
        self.school = school
        self.grade = grade
    }
    func study() {
        print("study")
    }
    func eat() {
        print("eat")
    }
    func sleep(){
        print("sleep")
    }
}

//
// ** 아이폰(IPhone)
// - 속성: 기기명, 가격, faceID 기능 여부(Bool)
// - 행위: 전화 걸기, 문자 전송
// ** 커피(Coffee)
// - 속성: 이름, 가격, 원두 원산지
class Iphone {
    var name : String
    var price : Int
    var haveFunction : Bool
    init(name: String, price: Int, haveFunction: Bool) {
        self.name = name
        self.price = price
        self.haveFunction = haveFunction
    }
    func calling() {
        print("calling")
    }
}
class Coffee {
    var name : String
    var cost : Int
    var origin : String
    init(name: String, cost: Int, origin: String) {
        self.name = name
        self.cost = cost
        self.origin = origin
    }
}
//2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
//
// ** 계산기 (Calculator)
// - 속성: 현재 값
// - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
class Calculator {
    var value: Int = 0
    func addtion(number : Int) -> Int {
        value = value + number
        return value
    }
    func substraction(number: Int) -> Int {
        value = value - number
        return value
    }
    func multiplication(number: Int) -> Int{
        value = value * number
        return value
    }
    func division(number: Int) -> Int {
        value = value/number
        return value
    }
}


let calculator = Calculator()
calculator.addtion(number: 10)
calculator.addtion(number: 20)
calculator.substraction(number: 5)
calculator.multiplication(number: 2)
calculator.division(number: 5)

// ex)
// let calculator = Calculator() // 객체생성
//
// calculator.value  // 0
// calculator.add(10)    // 10
// calculator.add(5)     // 15
//
// calculator.subtract(9)  // 6
// calculator.subtract(10) // -4
//
// calculator.multiply(4)   // -16
// calculator.multiply(-10) // 160
//
// calculator.divide(10)   // 16
// calculator.reset()      // 0
