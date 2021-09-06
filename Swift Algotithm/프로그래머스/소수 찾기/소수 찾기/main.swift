//
//  main.swift
//  소수 찾기
//
//  Created by Kim TaeSoo on 2021/09/06.
//

import Foundation

func solution(_ n:Int) -> Int {
    var i = 2
    var cnt = 0
    if n <= 1
    {
        return 0
    }
    while (i <= n)
    {
        if find(n: i) == true {
            cnt += 1
        }
        i += 1
    }
    return cnt
}

func find(n: Int) -> Bool{
    var i = 2
    if n == 1{
        return false
    }
    while i * i <= n {
        if n % i == 0 && n != i{
            return false
        }
        if i % 2 == 0{
            i += 1
        }
        else {
            i += 2
        }
    }
    return true
}
