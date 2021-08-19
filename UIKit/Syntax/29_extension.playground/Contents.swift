import UIKit

// Extension
// 기능 확장
// struct, class, enum, protocol 등에서 사용 가능

// 숫자 (Int) 짝수, 홀수

extension Int {
    var oddOrEven: String {
        if (self % 2 == 0) {
            return ("짝수")
        }
        return ("홀수")
    }
}

4.oddOrEven

// UIColor
// mainColor1 = xxx
// mainColor2 = xxx
// subcolor2 = xxx

extension UIColor {
    class var mainColor1: UIColor{
        UIColor(red: 0/255, green: 70/255, blue: 120/255, alpha: 1)
    }
}

var button = UIButton()
// 축약 가능
button.titleLabel?.textColor = UIColor.mainColor1
button.titleLabel?.textColor = .mainColor1
