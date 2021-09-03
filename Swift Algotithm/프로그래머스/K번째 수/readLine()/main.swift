//
//  main.swift
//  readLine()
//
//  Created by Kim TaeSoo on 2021/09/01.
//

import Foundation
// 첫째 줄에 주어진 정수 N개의 최솟값과 최댓값을 공백으로 구분해 출력한다.
    
func programersSolution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map({(key) in
                return array[(key[0]-1)...(key[1]-1)].sorted()[key[2]-1]
            })
}

func mySolution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ret = [Int]()
    
    for i in 0...commands.count - 1 {
        let start = commands[i][0] - 1
        let end = commands[i][1] - 1
        let idx = commands[i][2] - 1
        let arr = array[start...end].sorted()// *sorted는 반환형임*
        
        ret.append(arr[idx])
    }
    
    return ret
}

print(mySolution([1,5,2,6,3,7,4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))

