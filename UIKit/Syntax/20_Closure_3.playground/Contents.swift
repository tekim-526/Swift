import UIKit

// Closure 실습 -> 기존 로직을 냅두고 추가하고 싶을 떄

// 조건 -> 찾는다 -> 특정한 글자가 포함된 것을 찾는다
// 조건 -> 찾는다 -> 입력한 글자로 시작하는 문자열을 찾는다
let names = ["apple", "air", "brown", "red", "orange", "blue", "candy"]

// someFind함수와 contaionsText의 내용은 거의 비슷하게 만들어 놓은 것임
let containsText: (String, String) -> Bool = { name, find in
    if (name.contains(find))
    {
        return (true)
    }
    return (false)
}

func someFind(find: String) -> [String] {
    var newNames = [String]()
    
    for name in names
    {
        if name.contains(find)
        {
            newNames.append(name)
        }
    }
    return (newNames)
}

someFind(find: "z")
// 만약 입력한 글자로 시작하는 문자열을 찾고 싶은 경우
// func의 조건을 closure로 뺀다.

let startText: (String, String) -> Bool = { name, find in
    if (name.first?.description == find)
    {
        return true
    }
    return false
}

func find(findString: String, condition: (String, String) -> Bool) -> [String]
{
    var newNames = [String]()

    for name in names
    {
        if condition(name, findString){
            newNames.append(name)
        }
    }
    return (newNames)
}

find(findString: "a", condition: containsText)
find(findString: "a", condition: startText)



