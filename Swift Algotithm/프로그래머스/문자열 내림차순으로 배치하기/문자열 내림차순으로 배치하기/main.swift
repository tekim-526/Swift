//
//  main.swift
//  문자열 내림차순으로 배치하기
//
//  Created by Kim TaeSoo on 2021/10/11.
//

import Foundation

func solution(_ s:String) -> String {
    var arr = Array(s)
    return String(arr.sorted(by: >))
}
print(solution("asdasdZZSS"))
