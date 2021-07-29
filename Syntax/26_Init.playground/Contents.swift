import UIKit

// Initializer
// 생성자
// init

class MyInfo {
    // designated initializer
        // 첫번째 경우의 수 선언하고 바로 초기값을 넣어줌
    var name: String// = ""
    var myId: String// = ""
    
    var age: Int?
    var isAdult: Bool
        // 두번째 경우 초기값을 선언할 때 받아옴
    init(n: String, id: String) {
        self.name = n
        self.myId = id
        self.isAdult = ((age ?? 0) > 19) ? true : false
    }
        // 세번째경우 그냥 없다고 설정해줌 // let인 경우에는 추후에 변경이 안된다
/*  init(){
        self.name = ""
        self.myId = ""
        self.isAdult = (age > 19) ? true : false
    }
    // 하나만 받는것도 가능
    init(id: String){
        self.name = ""
        self.myId = id
        self.isAdult = (age > 19) ? true : false
    }
*/
    // convenience initializer // 필수조건 - 다른 init을 반드시 실행해야 한다. 두번째 세번째 경우와 밑에있는 것과 같은 결과값이 나옴
    convenience init() {
        self.init(n: "", id: "")
    }
    convenience init(id: String) {
        self.init(n: "", id: id)
    }
}
// init의 종류에 따라 여러번 선언가능
var myInfo1 = MyInfo(n: "kimts", id: "tekim") // = MyInfo.init()
var myInfo2 = MyInfo()
var myInfo3 = MyInfo(id: "some id")
myInfo1.myId
myInfo1.name

struct MyConfig {
    var conf: String
}

var myCon = MyConfig(conf: "tekim")






