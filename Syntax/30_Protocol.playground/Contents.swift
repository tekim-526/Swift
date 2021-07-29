import UIKit


// Protocol
// 규격, 규약, 규칙, 청사진, 뼈대

// get은 무조건 해야하고 set을 쓸경우에는 set을 무조건 해야함 set을 안쓰면 해도되고 안해도 된다의 의미
// 변수를 쓸지 상수를 쓸지에 따라 선택하면 된다!
protocol UserInfo {
    var name: String { get set }
    var age: Int { get set }
    func isAdult() -> Bool
}

protocol UserScore {
    var score: Int { get set }
}

protocol UserDetailInfo: UserInfo, UserScore {
    // 이런식으로 합칠 수 있음(합성)
}
class Guest: UserDetailInfo {
    var score: Int = 10
    var name: String = "kim"
    var age: Int = 20
}

extension UserInfo {
    func isAdult() -> Bool {
        if (age > 19) {
            return true
        }
        return false
    }
}

class Member: UserInfo {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class VIP: UserInfo {
    var name: String = "lee"
    var age: Int = 10
    func isAdult() -> Bool {
        return true // extension으로 선언된 것을 수정 가능함
    }
}

class UserInfoPresenter {
    func present() {
        let guest = Guest()
        let member = Member(name: "park", age: 30)
        let vip = VIP()
        
        let members: [UserInfo] = [guest, member, vip]
        for element in members {
            print(element.isAdult())
        }
    }
}
let presenter = UserInfoPresenter()
presenter.present()
