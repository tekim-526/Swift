import UIKit

// Closure2

// function
func myScore(a: Int) -> String
{
    return ("\(a) 점")
}
let score = myScore
score(50)

// Closure
let myScore2 = { (a: Int) -> String in
    return ("\(a)점")
}

// 축약 (생략)

// return 생략 위에 로직이 없어야함
let myScore3 = { (a: Int) -> String in
    "\(a)점"
}

// 리턴의 타입 추론이 가능하면 리턴 값을 지정하는 것을 생략가능 하다
let myScore4 = { (a: Int) in
    "\(a)점"
}

// 변수를 선언할 때 :Int 이런식으로 쓰는것처럼 사용
let myScore5: (Int, Int) -> String = { (a, b) in
    "\(a + b)점"
}

let myScore6: (Int, Int, Int) -> String = {
    "\($0 + $1 + $2)점"
}

myScore5(10, 100)
myScore6(40, 20, 30)

