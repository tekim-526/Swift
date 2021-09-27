//
//  main.swift
//  피보나치 수
//
//  Created by Kim TaeSoo on 2021/09/27.
//

import Foundation

func solution(_ n:Int) -> Int {
    var numArr: [Int] = [0, 1, 1, 2, 3, 5]
    //n 은 배열의 인덱스
    //var i = 3
    for i in 6...n {
        numArr.append(numArr[i - 1] % 1234567 + numArr[i - 2] % 1234567)
        //i += 1
    }
    return numArr[n]
}
print(solution(10000))
