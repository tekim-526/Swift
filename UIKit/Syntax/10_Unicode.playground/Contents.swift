import UIKit

// Unicode 범위 관련

// 숫자만 입력받을 수 있어야 한다라는 조건이 있다고 가정


let inputValue = "9"

if (inputValue >= "\u{30}" && inputValue <= "\u{39}")
{
    print("number")
}
else
{
    print("not number")
}

// 영어만 입력해야한다고 가정

"\u{41}" // "A"
"\u{7a}" // "z"

