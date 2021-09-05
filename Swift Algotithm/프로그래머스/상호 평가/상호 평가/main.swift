//
//  main.swift
//  상호 평가
//
//  Created by Kim TaeSoo on 2021/09/05.
//

import Foundation

func solution(_ scores:[[Int]]) -> String {
    var arr = [Int]()
    var doubleArr = [[Int]]()
    let tmpArr = scores
    var i = 0
    while i < scores.count{
        var j = 0
        while j < scores.count{
            arr.append(scores[j][i])
            j += 1
        }
        doubleArr.append(arr.sorted())
        arr.removeAll()
        i += 1
    }
    
    for i in 0..<scores.count {
        if tmpArr[i][i] == doubleArr[i].max()!
        {
            doubleArr[i].removeLast()
        }
        else if tmpArr[i][i] == doubleArr[i].min()!
        {
            doubleArr[i].removeFirst()
        }
        
    }
    var average = [Double]()
    for i in 0..<scores.count {
        var j = 0
        var tmp: Double = 0
        while j < doubleArr[i].count{
            tmp += Double(doubleArr[i][j])
            j += 1
        }
        average.append(tmp / Double(doubleArr[i].count))
        
    }
    
    
    return checkAverage(average: average
    )
}
func checkAverage(average: [Double]) -> String {
    var ret = ""
    for i in 0..<average.count{
        if average[i] < 50{
            ret.append("F")
        }
        else if average[i] >= 50 && average[i] < 70 {
            ret.append("D")
        }
        else if average[i] >= 70 && average[i] < 80 {
            ret.append("C")
        }
        else if average[i] >= 80 && average[i] < 90 {
            ret.append("B")
        }
        else if average[i] >= 90 {
            ret.append("A")
        }
    }
    return ret
}


solution([[100,90,98,88,65],[50,45,99,85,77],[47,88,95,80,67],[61,57,100,80,65],[24,90,94,75,65]])
