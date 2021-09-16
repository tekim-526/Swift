//
//  main.swift
//  내적
//
//  Created by Kim TaeSoo on 2021/09/16.
//

import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    let tmpA = a
    let tmpB = b
    var ret = 0
    var idx = 0
    while (idx < tmpA.count){
        ret += tmpA[idx] * tmpB[idx]
        idx += 1

    }
    return ret
}
