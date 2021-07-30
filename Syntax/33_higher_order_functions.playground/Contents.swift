import UIKit

// higher order functions
// 고차 함수

let names = ["kim", "lee", "min", "john"]
let numArr = [1, 2, 3, 4, 5, nil, 6, 7, nil, 8]

// map -> 원하는 스타일로 변경하지만 (배열의 개수, 길이는 같다)
let names2 = names.map { name in
    name + "님"
}
names2

let names3 = names.map { name in
    name.count
}

let names4 = names.map { $0.count > 3 }

// filter -> 필요한것만 걸러서 추출해 냄, 거른다.
let filterNames = names.filter { name in
    name.count > 3
}
filterNames

// reduce -> 하나로 뭉친다. 통합한다. 합친다의 개념
let sumNames = names.reduce("aaa = ") { first, second in
    first + second
}
sumNames

let sumNum = numArr.reduce(0) { $0 + ($1 ?? 0) }
sumNum

// compactMap -> nil과 optional을 제거 함

let numbers = numArr.compactMap { $0 }
numbers

// flatMap -> 간단하다 단순하다? 배열을 한단계 꺼냄 다중배열에서 같은 depth로 보고 싶을 때 depth에 대한 조절이 필요할 때
let numbers2 = [[1,2,3], [4,5,6]]
let flatNum = numbers2.flatMap { $0 }
flatNum


