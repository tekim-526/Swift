import UIKit

// Optional_second_lecture
// 값이 있을수도 있고 없을수도 있다.


// 옵셔널 그냥 사용할 수 없는 경우가 많이 있음.
var a: Int? = 10
var b: Int? = 20

// unwrapped || unwrapping || unwrap
// Int? -> Int 옵셔널이 붙어있는 걸 빼는것을 unwrapped || unwrapping || unwrap이라고 함

// coalesce -> unwrapping 방법 예를 들어 a에 값이 있으면 그대로 사용하고 값이 없으면 "??" 뒤에 있는 값을 넣어줌
var sum = (a ?? 0) + (b ?? 0)

// force unwrap -> 강제로 Optional을 뺀다는 의미
// 무조건 값이 있다고 가정하는 것, 값이 없을 때 "crash가 발생" 값이 있다는 확신이 있을 때 잘 고민하고 사용해야함
var plus = a! + b!

