//
//  main.swift
//  다음 큰 숫자
//
//  Created by Kim TaeSoo on 2021/10/18.
//

import Foundation

func bitCal(_ n:Int) -> String
{
    var ret = ""
    var num = n
    var i = 1
    while n > i {
        i *= 2
    }
    i /= 2
    while i > 0 {
        if num >= i {
            num -= i
            ret.append("1")
        }
        else
        {
            ret.append("0")
        }
        i /= 2
    }
    return ret
}

func solution(_ n:Int) -> Int
{
    var answer:Int = 0
    var tmp = Array(bitCal(n))
    var cnt = 0
    for i in 0...tmp.count - 1{
        if tmp[i] == "1" {
            cnt += 1
        }
        if cnt == 1 && tmp[i + 1] == "1" {
            tmp[i] = "1"
        }
    }
    
    
    print(tmp)
    return answer
}
solution(78)
