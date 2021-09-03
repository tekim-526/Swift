//
//  main.swift
//  약수의 개수
//
//  Created by Kim TaeSoo on 2021/09/02.
//

import Foundation
// 튜플 || 딕셔너리로 구현
/*
 두 정수 left와 right가 매개변수로 주어집니다. left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.
 */
func solution(_ left:Int, _ right:Int) -> Int {
    var tmp = [Int]()
    var min = left
    let max = right
    while min <= max {
        tmp.append(min)
        min += 1
    }
    var i = 0
    var ret = 0
    let tupleArray = checkNumber(numberArray: tmp)
    while i < tupleArray.count{
        if tupleArray[i].1 % 2 == 0 {
            ret += tupleArray[i].0
        }
        else {
            ret -= tupleArray[i].0
        }
        i += 1
    }
    
    return ret
}

// 원래의 숫자와 약수의 개수를 리턴 함 구함
func checkNumber(numberArray: [Int]) -> [(Int, Int)] {
    var tmp = numberArray
    var ret = [(Int, Int)]()
    while tmp != []{
        var cnt: Int = 0
        let tekim = tmp.popLast() ?? 0
        for i in 1...tekim {
            if tekim % i == 0 {
                cnt += 1
            }
        }
        ret.append((tekim ,cnt))
    }
    return ret
}

