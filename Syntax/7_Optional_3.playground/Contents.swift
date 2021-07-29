import UIKit

// Optional_third_lecture
var optionalA: Int? = nil
var optionalB: Int! = nil
optionalB = optionalA
optionalA = optionalB + 1
var a: Int?
var b: Int? = 20

// Unwrapping
// if Statements

if (a != nil)
{
    print(a!)
}

// Unwrapping
// if let
// if var

if var hasNumber = a
{
    hasNumber = hasNumber * 2
    print(hasNumber)
}

// Unwrappint
// guard let
// guard var
// func || class 안에서 사용되는데 그 밑에 로직을 사용할 필요가 없을 때 사용된다 그냥 리턴 해버림

func testFunc()
{
    guard var hasNumber = b else {
        return
    }
    hasNumber *= 2
    print(hasNumber)
    print("end")
}

testFunc()
