//
//  main.swift
//  문자열 내 p와 y의 개수
//
//  Created by Kim TaeSoo on 2021/10/11.
//

import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    var idx = 0
    var cnt = 0
    var cnt2 = 0
    while idx < s.count {
        if s[s.index(s.startIndex, offsetBy: idx)] == "p" || s[s.index(s.startIndex, offsetBy: idx)] == "P" {
            cnt += 1
        }
        else if s[s.index(s.startIndex, offsetBy: idx)] == "Y" || s[s.index(s.startIndex, offsetBy: idx)] == "y"{
            cnt2 += 1
        }
        idx += 1
    }
    if cnt == cnt2 {
        ans = true
    }
    return ans
}
print(solution("yYabcdefPp"))
