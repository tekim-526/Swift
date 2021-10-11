//
//  main.swift
//  이상한 문자 만들기
//
//  Created by Kim TaeSoo on 2021/10/11.
//

import Foundation

func solution(_ s:String) -> String {
    
    var idx2 = 0
    var ret = ""
    var arr: [String] = []
    arr = s.components(separatedBy: " ")
    while idx2 < arr.count {
        var idx = 0
        while idx < arr[idx2].count {
            if idx % 2 == 0{
                ret.append(arr[idx2][arr[idx2].index(arr[idx2].startIndex, offsetBy: idx)].uppercased())
            }
            else{
                ret.append(arr[idx2][arr[idx2].index(arr[idx2].startIndex, offsetBy: idx)].lowercased())
            }
            idx += 1
        }
        ret.append(" ")
        idx2 += 1
    }
    ret.removeLast()
    return ret
}
