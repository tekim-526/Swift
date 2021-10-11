//
//  main.swift
//  제일 작은수 제거하기
//
//  Created by Kim TaeSoo on 2021/10/11.
//

import Foundation

func solution(_ arr:[Int]) -> [Int] {
    var ret: [Int] = []
    let minNum = arr.min()!
    var idx = 0
    while idx < arr.count {
        if arr[idx] != minNum {
            ret.append(arr[idx])
        }
        idx += 1
    }
    if ret == [] {
        ret.append(-1)
    }
    return ret
}
print(solution([10]))
