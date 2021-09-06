//
//  main.swift
//  수박수박수
//
//  Created by Kim TaeSoo on 2021/09/06.
//

import Foundation

func solution(_ n:Int) -> String {
    var ret = ""
    for i in 1...n {
        if i % 2 == 1{
            ret.append("수")
        }
        else if i % 2 == 0{
            ret.append("박")
        }
    }
    return ret
}
