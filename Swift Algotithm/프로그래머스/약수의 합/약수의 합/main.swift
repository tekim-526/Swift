//
//  main.swift
//  약수의 합
//
//  Created by Kim TaeSoo on 2021/09/05.
//

//import Foundation

func solution(_ n:Int) -> Int {
    var arr: [Int] = []
    var ret = 0
    var i = 1
    while i <= n {
        if n % i == 0 {
            arr.append(i)
        }
        i += 1
    }
    i = 0
    while i < arr.count{
        ret += arr[i]
        i += 1
    }
    return ret
}

print(solution(12))
