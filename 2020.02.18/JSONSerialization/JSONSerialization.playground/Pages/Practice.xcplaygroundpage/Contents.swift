//: [Previous](@previous)
import Foundation


/*
 [ 실습1 ]
 다음 주소를 통해 얻은 json 데이터(국제정거장 위치 정보)를 파싱하여 출력하기
 http://api.open-notify.org/iss-now.json
 */

func practice1() {
  let internationalMarket = "http://api.open-notify.org/iss-now.json"
  let apiURL = URL(string: internationalMarket)!


  let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
      guard error == nil else { return print(error!) }
      guard let response = response as? HTTPURLResponse,
          (200..<400).contains(response.statusCode)
          else { return print("Invalid response") }
      guard let data = data else { return }
      
      guard let jsonData = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
      
      guard let time = jsonData["timestamp"] as? Int else { return }
      guard let message = jsonData["message"] as? String else { return }
      guard let location = jsonData["iss_position"] as? [String: String] else { return print("duck") }
      
        print(time)
      print(location)
      print(message)
  }
  dataTask.resume()
}
//practice1()



/*
 [ 실습2 ]
 User 구조체 타입을 선언하고
 다음 Json 형식의 문자열을 User 타입으로 바꾸어 출력하기
 
 e.g.
 User(id: 1, firstName: "Robert", lastName: "Schwartz", email: "rob23@gmail.com")
 User(id: 2, firstName: "Lucy", lastName: "Ballmer", email: "lucyb56@gmail.com")
 User(id: 3, firstName: "Anna", lastName: "Smith", email: "annasmith23@gmail.com")
 */

let jsonString2 = """
{
"users": [
{
"id": 1,
"first_name": "Robert",
"last_name": "Schwartz",
"email": "rob23@gmail.com"
},
{
"id": 2,
"first_name": "Lucy",
"last_name": "Ballmer",
"email": "lucyb56@gmail.com"
},
{
"id": 3,
"first_name": "Anna",
"last_name": "Smith",
"email": "annasmith23@gmail.com"
},
]
}
"""

struct Users {
    var id: Int
    var firstName: String
    var lastName: String
    var email: String
}

func practice2() {
    
    let jsonData = jsonString2.data(using: .utf8)!
    
    
    guard let foundationObject = try? JSONSerialization.jsonObject(with: jsonData) else { return print("왜 안돼") }
    guard let jsonDict = foundationObject as? [String : [[String: Any]]] else { return print("왱")}
    
    for i in jsonDict["users"]! {
        
        guard let first_name = i["first_name"] as? String,
              let last_name = i["last_name"] as? String,
              let email = i["email"] as? String,
              let id = i["id"] as? Int else { return print("왜안돼") }
        print(Users(id: id, firstName: first_name, lastName: last_name, email: email))
    }
}
//practice2()


/*
 [ 실습3 ]
 Post 구조체 타입을 선언하고
 다음 주소를 통해 얻은 JSON 데이터를 파싱하여 Post 타입으로 변환한 후 전체 개수 출력하기
 https://jsonplaceholder.typicode.com/posts
 */

struct Post {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}

func practice3() {
    
    let address = "https://jsonplaceholder.typicode.com/posts"
    let apiURL = URL(string: address)!


    let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
        guard error == nil else { return print(error!) }
        guard let response = response as? HTTPURLResponse,
            (200..<400).contains(response.statusCode)
            else { return print("Invalid response") }
        guard let data = data else { return }
        
        guard let jsonData = try? JSONSerialization.jsonObject(with: data) as? [[String: Any]] else { return }
        
        for i in jsonData {
            guard let userId = i["userId"] as? Int,
                  let id = i["id"] as? Int,
                  let title = i["title"] as? String,
                  let body = i["body"] as? String else { return }
            
//            print(Post(userId: userId, id: id, title: title, body: body))
            
        }
        print(jsonData.count)
    }
    dataTask.resume()
}
    practice3()




//: [Table of Contents](Contents) | [Previous](@previous) | [Next](@next)


