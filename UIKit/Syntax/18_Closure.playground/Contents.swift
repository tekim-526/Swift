import UIKit

// Closure (클로져)

// closure - 이름이 없음.
// func - 유사

// func
func myScore(a: Int) -> String
{
    return ("\(a)점")
}

// closure - 약간 변수 상수를 함수로 만든다는거라고 생각하면 댐
let myScore2 = { (a: Int) -> String in
    return ("\(a)점")
}

myScore2(60)
let score = myScore(a: 40)
