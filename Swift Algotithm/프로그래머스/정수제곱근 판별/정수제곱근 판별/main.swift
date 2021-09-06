//
//  main.swift
//  정수제곱근 판별
//
//  Created by Kim TaeSoo on 2021/09/06.
//

import Foundation

func solution(_ n:Int64) -> Int64 {
    let ret = squareRoot(n: n)
    if ret > 0 {
       return ret * ret
    }
    else {
        return -1
    }
}

func squareRoot(n: Int64) -> Int64 {
    var i: Int64 = 0
    if n == 1{
        return 2
    }
    while i < ((n / 2) + 1){
        if i * i == n {
            return i + 1
        }
        i += 1
    }
    return -1
}
print(solution(1))
