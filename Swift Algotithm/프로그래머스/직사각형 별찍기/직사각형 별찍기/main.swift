//
//  main.swift
//  직사각형 별찍기
//
//  Created by Kim TaeSoo on 2021/10/11.
//

import Foundation

let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
let (a, b) = (n[0], n[1])
var ret = ""
var idx = 0
while idx < a {
    ret.append("*")
    idx += 1
}
idx = 0
while idx < b{
    print(ret)
    idx += 1
}
