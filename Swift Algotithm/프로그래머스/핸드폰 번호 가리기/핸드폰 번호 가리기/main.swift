//
//  main.swift
//  핸드폰 번호 가리기
//
//  Created by Kim TaeSoo on 2021/10/11.
//

import Foundation

func solution(_ phone_number:String) -> String {
    var ret = ""
    var idx = 0
    while idx < phone_number.count {
        while idx < phone_number.count - 4{
            ret.append("*")
            idx += 1
        }
        ret.append(phone_number[phone_number.index(phone_number.startIndex, offsetBy: idx)])
        idx += 1
    }
    return ret
}
