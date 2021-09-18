//
//  main.swift
//  최댓값과 최솟값
//
//  Created by Kim TaeSoo on 2021/09/18.
//

import Foundation

func solution(_ s:String) -> String {
    let arr: [Int] = s.components(separatedBy: " ").map({ Int($0)! })
    return arr.min()!.description + " " + arr.max()!.description
}
print(solution("1 2 3 4"))
print(solution("-1 -2 -3 -4"))
print(solution("-1 -1"))
