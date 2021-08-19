import UIKit

// generic <"Type == 내가 정한 임의의 타입">
// 로직 - 반복, 타입 여러가지

// stack을 예시로 함
// stack, queue 따로 공부할것

// 제한 - where 키워드
struct IntStack<MyType> where MyType: StringProtocol
{
    var items = [MyType]()
    // struct에서 자기 자신을 변경하려면 mutating이라는 키워드를 사용 해야함
    mutating func push(item: MyType) {
        items.append(item)
    }
    mutating func pop() -> MyType? {
        if items.isEmpty {
            return nil
        }
        return (items.removeLast())
    }
}

var myStack1 = IntStack<String>()
myStack1.push(item: "a")
myStack1.push(item: "b")
myStack1.push(item: "c")

myStack1.pop()
myStack1.pop()
myStack1.pop()
myStack1.pop()

var myStack2 = IntStack<Int>()
myStack2.push(item: 1)
myStack2.push(item: 2)
myStack2.push(item: 3)

myStack2.pop()
myStack2.pop()
myStack2.pop()
myStack2.pop()
