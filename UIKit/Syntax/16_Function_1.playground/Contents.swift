import UIKit

// Function_1
// 하나의 기능을 만들 때 따로 빼서 만드는 것
// 계산기 -> Class
// 더하기 빼기등의 기능 -> Function

let a = 10
let b = 20

var c = 0

// 함수 사용법
func plus(_ num1: Int, _ num2: Int) -> Int// -> return에 대한 형식을 지정해 줌, 여러개 받으려면 Tuples 사용 Tuples 안쓰고 하나만 받으려면 괄호 빼기 가능
{
    return (num1 + num2)
}
p
let p = plus(a, b)

