import UIKit

// Collection Types

// Set -> 순서의 개념이 없음 순서가 필요하면 Array 아니면 Set을 사용

var names = Set<String>()
// 위 아래 같은 문법임
var names2: Set = ["set", "dul", "hana"]

names.insert("kim")
names.insert("tae")
names.insert("su")
names.insert("kim") // 값이 중첩되면 한번만 들어감
names

// Array에서 중첩되는 것을 지우고 싶을 때 타입을 바꾸어 주면 됨
var samenames = ["lee", "lee", "lee", "lee", "lee"]
Set(samenames)
/*****************************************************/

// 연산
var numbers1: Set = [1, 2, 3, 4, 5]
var numbers2: Set = [4, 5, 6, 7, 8]

// 교집합
numbers1.intersection(numbers2)

// 합집합
numbers1.union(numbers2)

// 합집합 - 교집합 (대칭차집합)
numbers1.symmetricDifference(numbers2)

// 여집합 (numbers1 - numbers2)
numbers1.subtracting(numbers2)
