//
//  main.swift
//  두 개 뽑아서 더하기
//
//  Created by Kim TaeSoo on 2021/09/05.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var i = 0
    var sum = 0
    var tmp: Set<Int> = []
    var ret: [Int] = []
    while (i < numbers.count - 1){
        var j = i
        while (j < numbers.count - 1){
            sum = numbers[i] + numbers[j + 1]
            tmp.insert(sum)
            j += 1
        }
        i += 1
    }
    ret = tmp.sorted(by: <)
    return ret
}
