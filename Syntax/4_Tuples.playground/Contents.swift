import UIKit

var str = "Hello, playground"

// Tuples (n짝, n쌍)
// 앱을 만들 때로 예를 들어 상단에 텍스트랑 이미지가 맞춰서 들어가야 할 때

var topTitle = ("메인화면", "mainIcon.png")// 두개가 쌍으로 사용하게 끔 함

topTitle.0 //첫번째 변수 "메인화면"에 대한 것을 가져옴
topTitle.1 //두번째 변수 "mainIcon.png"에 대한 것을 가져옴

// http status code << 꼭 검색해서 반드시 알아봐야함 밑에는 예시
// 보기 편하게 하기 위해 아래 처럼 설명 써줄 수 있음
var httpError = (statusCode: 404, description: "Not Found")
var httpNoterror = (200, "Success")

httpError.statusCode
httpError.description
