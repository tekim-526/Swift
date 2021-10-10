//
//  main.swift
//  숫자 문자열과 영단어
//
//  Created by Kim TaeSoo on 2021/10/10.
//

import Foundation

func solution(_ s:String) -> Int {
    var str = s
    var i = 0
    while (i < s.count){
        if str.contains("zero"){
            str.replaceSubrange(str.range(of: "zero")!, with: "0")
        }
        if str.contains("one"){
            str.replaceSubrange(str.range(of: "one")!, with: "1")
        }
        if str.contains("two"){
            str.replaceSubrange(str.range(of: "two")!, with: "2")
        }
        if str.contains("three"){
            str.replaceSubrange(str.range(of: "three")!, with: "3")
        }
        if str.contains("four"){
            str.replaceSubrange(str.range(of: "four")!, with: "4")
        }
        if str.contains("five"){
            str.replaceSubrange(str.range(of: "five")!, with: "5")
        }
        if str.contains("six"){
            str.replaceSubrange(str.range(of: "six")!, with: "6")
        }
        if str.contains("seven"){
             str.replaceSubrange(str.range(of: "seven")!, with: "7")
        }
        if str.contains("eight"){
             str.replaceSubrange(str.range(of: "eight")!, with: "8")
        }
        if str.contains("nine"){
            str.replaceSubrange(str.range(of: "nine")!, with: "9")
        }
        i += 1
    }
    return Int(str)!
}
print(solution("one4seveneighteight"))
