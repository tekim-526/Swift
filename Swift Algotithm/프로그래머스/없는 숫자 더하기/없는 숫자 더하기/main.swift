//
//  main.swift
//  없는 숫자 더하기
//
//  Created by Kim TaeSoo on 2021/09/18.
//

import Foundation

func solution(_ numbers:[Int]) -> Int {
    var set: Set<Int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let tmp = Set(numbers)
    set = set.subtracting(tmp)
    let arr = Array(set).sorted()
    var idx = 0
    var ret = 0
    while (idx < arr.count){
        ret += arr[idx]
        idx += 1
    }
    return ret
}
