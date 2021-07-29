import UIKit

// Collection Types
// 집합 타입


// Array
// Swift - type safe
var myNames = Array<String>() // ()를 쓰는 것은 메모리에 올리는 과정 이니셜라이즈라고 함

// 위와 아래는 같은 문법임 같은 의미이다.
var myAges = [Int]()
// Array에 .append로 값을 채워줌 여러번 넣으면 순서대로 들어감
myNames.append("tekim")
myNames.append("kimts")
myNames.append("twotae")

// 인덱스 접근은 이런식으로 함
myNames[1] + "님"

// 없는 인덱스에 접근을 못하게 가드를 해 주어야함 (방어코드)
// 크래쉬가 안나게끔 하기위해서 -> 안전한 코딩 스타일
let idx = 3
if (myNames.count > idx)
{
    myNames[idx]
}
// Array에 값을 여러개 동시에 Array 뒤에 넣는 법
myNames.append(contentsOf: ["hi", "hello"])
// 위 아래가 같은 문법이다! 값을 추가 해준다
myNames = myNames + ["hi", "hello"]

// Array의 요소를 지우는 법 .remove
myNames.remove(at: 1) // at: Int 에는 인덱스 번호가 들어감

if (myNames.isEmpty)// == myNames.count == 0
{
    
}

// Array의 원하는 위치에 값을 바꾸어서 넣는법
myNames.insert("Coffee", at: 1)

for (index, name) in myNames.enumerated() { // 앞에 name은 myNames에서 하나하나 가져오는 것
    print(index, name)
}
