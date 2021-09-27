//
//  main.swift
//  멀쩡한 사각형
//
//  Created by Kim TaeSoo on 2021/09/18.
//


// 1차함수의 기울기를 사용하여 풀어볼 것
import Foundation

func solution(_ w:Int, _ h:Int) -> Int64{
    var answer:Int64 = Int64(w) * Int64(h)
    var minus:Int64 = 0
    if w == h{
        minus = Int64(w)
    }
    else if w < h{
        minus = Int64(w) * 2
    }
    else if w > h {
        minus = Int64(h) * 2
    }
    return answer - minus
}
print(solution(5, 2))
