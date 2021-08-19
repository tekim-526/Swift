import UIKit

// Inheritance
// 상속 - class 에서 가능

// enum, protocol, struct 에서는 불가능

// protocol - 원하는 스타일의 구조를 강제시키는 역할
// 상속과 프로토콜은 어느정도는 비슷한 맥락임

class UserInfo {
    var name = ""
    var age = 0
    func isAdult() -> Bool {
        if (age > 19)
        {
            return true
        }
        return false
    }
}

class Guest: UserInfo {
    override func isAdult() -> Bool {
        return true
    }
    func present() {
        name = "kim"
        print(name)
        print(super.name)
        print(isAdult())
        print(super.isAdult())
    }
}
let guest = Guest()
guest.present()
