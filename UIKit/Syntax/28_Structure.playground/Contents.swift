import UIKit

// Structure
// 구조체

// value type 값을 참조하는게 아니라 복제를 함
// 값을 참조할 필요가 없을 때 사용
// 상속 불가능

struct ImageType {
    var type = ""
}

var imageType1 = ImageType()
var imageType2 = imageType1
var imageType3 = imageType2

imageType1.type = "jpg"
imageType2.type = "png"

imageType1.type
imageType2.type
imageType3.type

// class와 struct의 차이

class MyInfo {
    var myAge = 0
}

var info1 = MyInfo()
var info2 = info1
var info3 = info2

info1.myAge = 20
info2.myAge
info3.myAge
print("a")
