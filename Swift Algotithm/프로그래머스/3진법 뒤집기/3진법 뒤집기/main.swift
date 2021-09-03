//
//  main.swift
//  3진법 뒤집기
//
//  Created by Kim TaeSoo on 2021/09/02.
//

import Foundation
// 자연수 n이 매개변수로 주어집니다. n을 3진법 상에서 앞뒤로 뒤집은 후, 이를 다시 10진법으로 표현한 수를 return 하도록 solution 함수를 완성해주세요.
func mysolution(_ n:Int) -> Int {
    // n을 3진법으로 변환
    var tmp = n
    var arr = [Int]()
    while (tmp > 0)
    {
        arr.append(tmp % 3)
        tmp /= 3
    }
    
    // 그걸 다시 10진법으로 바꿈
    var idx = arr.count - 1
    var ret = 0
    var cnt = 0
    while (cnt < arr.count){
        ret += arr[idx] * square3(idx: cnt)
        idx -= 1
        cnt += 1
    }
    return ret
}
func square3(idx: Int) -> Int{
    var i = 0
    var ret = 1
    while(i < idx){
        ret *= 3
        i += 1
    }
    return ret
}
/* ********************************************************************************************************************************************************************************************************************************************************************************************************************/

func strangersSolution(_ n:Int) -> Int {
    let flipToThree = String(n,radix: 3)
    let answer = Int(String(flipToThree.reversed()),radix:3)!
    return answer

}
strangersSolution(45)
