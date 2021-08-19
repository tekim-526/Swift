import UIKit

// Optional (옵셔널)

// 개념
// 값이 있을수도 있고, 없을수도 있다.

// 값이 있다.
// 0 -> 다 쓴 상태인 값

// 값이 없다. -> nil
// NULL인 경우, 완전히 없는 경우 ios에서는 nil이라고 함

// 자료형 뒤에 ?를 써서 Optional 상태로 만듬
// Int? nil을 받을 수 있는 상태로 만듬 Optional Int 라고 생각하면 편함

var myAge: Int? = 0

myAge = nil

// 값이 없는 상태 체크를 위해 조건문을 짰으면 -> 틀린 로직임 (Swift 언어 스펙이 요구하는 것과는 다름)
// 예를 들어 0살인 경우를 대응하지 못함

if (myAge == 0)
{
    // alert - 나이를 입력해 주세요.
}

// 맞는 로직
if (myAge == nil)
{
    // alert - 나이를 입력해 주세요.
}

var myName: String? //== var myName: String? = nil

myName = "" // "empty string" 이라고 표현
// 위에 Int형 예시와 마찬가지로 틀린 로직
if (myName == "")
{
    // 이름을 입력해 주세요.
}

// 맞는 로직
if (myName == nil)
{
    // 이름값이 없음.
}







