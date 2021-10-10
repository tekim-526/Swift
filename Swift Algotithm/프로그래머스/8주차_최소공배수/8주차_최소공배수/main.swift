//
//  main.swift
//  8주차_최소공배수
//
//  Created by Kim TaeSoo on 2021/10/10.
//

import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var arr1: [Int] = []
    var arr2: [Int] = []
    var arr3: [Int] = []
    var i = 0
    while (i < sizes.count){
        arr1.append(sizes[i][0])
        i += 1
    }
    i = 0
    while i < sizes.count{
        arr2.append(sizes[i][1])
        i += 1
    }
    let tmp: Int! = (arr1 + arr2).sorted(by: >).first
    i = 0
    var tmp2 = 0
    while i < sizes.count{
        if (sizes[i][0] > sizes[i][1])
        {
            tmp2 = sizes[i][1]
        }
        else{
            tmp2 = sizes[i][0]
        }
        arr3.append(tmp2)
        i += 1
    }
    arr3 = arr3.sorted(by: >)
    return tmp * arr3.first!
}
solution([[60, 50], [30, 70], [60, 30], [80, 40]])

//others solution
func othersSolution(_ sizes:[[Int]]) -> Int {
    var maxNum = 0
    var minNum = 0

    for size in sizes {
        print("size = \(size)")
        maxNum = max(maxNum, size.max()!)
        minNum = max(minNum, size.min()!)
        print("maxNum = \(maxNum)")
        print("minNum = \(minNum)")
    }
    return maxNum * minNum
}
othersSolution([[60, 50], [30, 70], [60, 30], [80, 40]])
