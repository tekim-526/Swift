//
//  main.swift
//  정수 내림차순으로 배치하기
//
//  Created by Kim TaeSoo on 2021/10/11.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    var arr: [Int64] = []
    var tmp = n
    var ret = ""
    var i = 0
    while tmp > 0 {
        arr.append(tmp % 10)
        tmp /= 10
    }
    arr = arr.sorted(by: >)
    while i < arr.count {
        ret.append(arr[i].description)
        i += 1
    }
    return Int64(ret)!
}
print(solution(118372))
