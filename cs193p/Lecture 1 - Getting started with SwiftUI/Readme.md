# SwiftUI

## MARK - private - Access Control
동일 파일 내, 자기 클래스 안에서만 접근 가능

---

## MARK - private(set) - Access Control
private(set)은 다른 class 혹은 struct 에서 볼 수 있지만 호출은 불가능함

---

 ## MARK - ObservableObject
 ObservableObject can publish to the world "something changed"

 ObservableObject make views reactive. We can use "objectWillChange" -> this announce something has changed in viewModel

 ObservableObject는 뷰를 반응적이게 만들고, objectWillChange.send() 를 사용할 수 있게 함으로써 위에 말한것 처럼 클래스에서 무언가가 바뀌었다고 알려준다.

---

## MARK - @ObservedObject
@ObservedObject means when Object says something changed, @ObservedObject rebuild entire body

@ObservedObject는 객체에서 무언가가 바뀌었을 때 알려주고, 뷰를 rebuild한다

---

 ## MARK - @Published
 Same active -> objectWillChange.send()
 ObservableObject의 objectWillChange.send()와 같은 기능을 한다.