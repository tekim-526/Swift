import UIKit

// Control Flow (흐름 제어) for문 if문 switch ~ case문

let names = ["kim", "tae", "su"]
// for문 예시
for name in names
{
    print(name + "님")
}

let numberOfLegs = ["ant" : 6, "dog" : 4]

for dic in numberOfLegs {
    print(dic)
}

for index in 0..<names.count {
    print(index)
}

// while문 예시 (주의) - 웬만하면 사용하지 않는게 좋다.
// 무한 루프에 걸리기 쉽기 때문

var a = 0

while (a < 10) {
    a = a + 1
    print("실행")
}

// switch ~ case
// 조건에 대한 케이스를 만들어서 분기처리함
// switch 뒤에 나오는 변수의 형식을 case와 맞추어 주어야함
// for in 문법 처럼 범위도 사용 가능

let b = "c"

switch b {
case "b", "a", "d": // case에 여러개를 넣으려면 ","로 구분하면 된다.
    print("tekim")
case "c":
    print("kimts")
default: // 케이스에 걸리지 않을 경우
    print("other")
}











