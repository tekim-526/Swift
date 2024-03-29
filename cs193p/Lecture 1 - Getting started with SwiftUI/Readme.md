# SwiftUI

## MARK - private - Access Control
>동일 파일 내, 자기 클래스 안에서만 접근 가능

---

## MARK - private(set) - Access Control
>private(set)은 다른 class 혹은 struct 에서 볼 수 있지만 호출은 불가능함

---

 ## MARK - ObservableObject
 >ObservableObject can publish to the world "something changed"

 >ObservableObject make views reactive. We can use "objectWillChange" -> this announce something has changed in viewModel

 >ObservableObject는 뷰를 반응적이게 만들고, objectWillChange.send() 를 사용할 수 있게 함으로써 위에 말한것 처럼 클래스에서 무언가가 바뀌었다고 알려준다.

---

## MARK - @ObservedObject
>@ObservedObject means when Object says something changed, @ObservedObject rebuild entire body

>@ObservedObject는 객체에서 무언가가 바뀌었을 때 알려주고, 뷰를 rebuild한다

---

 ## MARK - @Published
> Same active -> objectWillChange.send()
 ObservableObject의 objectWillChange.send()와 같은 기능을 한다.

 ---

 ## MARK - CaseIterable("protocol of enum")
 >CaseIterable - When using a CaseIterable types, you can access a collection types by using allCases property

 >CaseIterable - CaseIterable 유형을 사용할 때 allCases property를 사용하여 모든 collection type에 액세스(접근)할 수 있다
 
~~~ Swift
enum CarModel: CaseIterable {
	case K3
	case K5
	case K8
	case K9
}

for model in CarModel.allCases {
	reportSalesNumbers(for: model)
}

func reportSalesNumbers(for model: CarModel) {
	switch model { ... }
}
~~~

## MARK - Optional
~~~ swift
enum Optional<T> {
	case some(T)
	case none // nil
}
var hello: String? // var hello: Optional<String> = .none
var hello: String? = "hello" // var hello: Optional<String> = .some("hello")
var hello: String? = nil // var hello: Optional<String> = .none
~~~

### Solve Error
 >You can access the associated value either by force(with: !)

 >Or "safely" using "if let" and then using the associated value in { } (else allowed too)
 ~~~ swift
 // using force unwrap, if let
let hello: String? = ...
print(hello!)

if let safeHello = hello {
	print(safeHello)
} else {
	//do something. for example, return err
}

// using nil-coalescing operator
let i: String? = ...
let j = x ?? "foo" 
 ~~~

 someArray.indices 는 0~배열의 마지막 인덱스 까지의 범위를 설정해준다. for in 에서 유용함