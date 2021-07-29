import UIKit

// String

let myName = "te"

// 한글자씩 가져옴
for character in myName
{
    print(character)
}

let myLongstr =
"""
Hi
my
name
is
tekim
"""
print(myLongstr)

// description

let isOn = true
isOn.description

let myNumber = 12.33
myNumber.description
String(myNumber).split(separator: ".")

"my number is \(myNumber)".dropLast
