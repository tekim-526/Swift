import UIKit

// Closure

var names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// sort "sort sorted의 차이점은 sorted는 리턴이 있음 스위프트에서 과거형으로 써 있으면 리턴이 있다고 생각하면된다"
names.sorted() // 원본의 값이 변하지 않음
names

names.sort { (lhs, rhs) -> Bool in
    return lhs > rhs
}

names.sort { $0 < $1 }

names.sort() { $0 < $1 }

names.sort(by: { $0 < $1 })

names.sort(by: < )
