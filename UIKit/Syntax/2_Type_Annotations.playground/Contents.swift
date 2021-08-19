import UIKit

// Type Annotations 값을 보고 타입 추론 //확인이 꼭 필요할 때 타입 지정해줘야함

var str: String = "Hello, Playgroud"

//var myAge: Int = "hi" << 이 경우 에러가 나옴
var myAge = 0

var screenHeight: Double = 560 //이런 경우를 위해 사용 소수점이 필요할 때

var sum = myAge + Int(screenHeight) //type safe한 경우

// Booleans
