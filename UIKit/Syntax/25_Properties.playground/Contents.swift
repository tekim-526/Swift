import UIKit

// Properties

class MyInfo {
    
    // stored property (저장된)
    var name = ""
    var age = 0
    
    // lazy stored property 이미지가 여러개 있을 때 무거우므로 사용 하는 경우가 많음
    // class가 인스턴스할때(접근할때) 메모리에 올라감
    lazy var myProfiles = [UIImage(named: "a"), UIImage(named: "b"), UIImage(named: "c"), UIImage(named: "d"), UIImage(named: "e"), UIImage(named: "f")]
    
    // computed property (계산된)
    var isAdult: Bool {
        if (age > 19) {
            return true
        }
        return false
    }
    // computed property email -> 보안 -> 암호화 된 값으로 사용(항상)
    var _email = ""
    var email: String {
        get { // 가져오는 것
            return _email
        }
        set { // 말그대로 세팅하는 것
            _email = newValue.hash.description // 해쉬값을 암호화 했다고 가정
        }
    }
}

let myInfo = MyInfo()
myInfo.email = "abc@test.com"
myInfo.email
myInfo._email


myInfo.age = 20
myInfo.name = "kim"
myInfo.myProfiles // 이걸 작성했을 때 메모리에 올라감
myInfo.isAdult
print(myInfo.age)
