import UIKit

// 변수 상수 무언가를 담고 있는 상자 또는 그릇
// var은 변수를 선언하는 명령어
var str = "Hello, playground"

var age = 10


age = 20
age = 30
age = 55

str = "kimts"
str = "tekim"

// Swift 언어 특징
// Safe type 타입 안정한, 강타입, 타입이 엄격하다. 매우 중요!!! 따로 공부 해야함

//Safe type에 반하는 예시 //javaScript라는 언어에서는 타입에 굉장히 유연함
//Safe type에 대해 자세히 설명할 줄 알아야함

/*
age = "hi"
str = 111
*/

// 상수 let으로 선언 절대 변하지 않는 값 C언어에서 const라고 생각하면 편할듯
// 쓰는 예시는 웹사이트에 회원가입했을 때 ID가 변하지 않는 것이 예시임 바뀔일이 없는 것

let userID = "42.4.tekim@gmail.com"

// Type Annotations 값을 보고 타입 추론 //확인이 꼭 필요할 때 타입 지정해줘야함

var Str: String = "Hello, Playgroud"

//var myAge: Int = "hi" << 이 경우 에러가 나옴
var myAge = 0

var screenHeight: Double = 560 //이런 경우를 위해 사용 소수점이 필요할 때

var sum = myAge + Int(screenHeight) //type safe한 경우

// Booleans

var isOpen: Bool = false

if isOpen == false
{
    
}
else
{
    
}

// Tuples (n짝, n쌍)






