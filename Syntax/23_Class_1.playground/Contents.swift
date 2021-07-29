import UIKit

// Class -> 기본적으로 참조하는 것이라 값 하나가 변하면 전체 다 바뀜

class Myinfo
{
    init(gender: genderType) { // init을 사용하면 생성될 때 요구함
        self.GenderType = gender
    }
    enum genderType { // 선언만 한 것 // class 안에 선언하면 클래스 안에서만 사용 가능하다
        case male
        case female
    }
    //private C언어에서 static변수같은 느낌으로 생각하면 댐
    //바깥에서 접근이 불가능함
    private var GenderType: genderType // 초기타입이 정해져 있지 않으면 없다고 말해줘야함"?"를 사용해서

    var name = ""
    var age = 0
    
    func isAdult() -> Bool
    {
        if (age > 19)
        {
            return true
        }
        return false
    }
}
// 참조하는 것 (reference type)
var myInfo = Myinfo(gender: .male)
myInfo.age = 20
var myInfo2 = myInfo
myInfo2.age = 100
var myInfo3 = myInfo2
myInfo3.age = 250

myInfo.age
myInfo2.age
myInfo3.age


