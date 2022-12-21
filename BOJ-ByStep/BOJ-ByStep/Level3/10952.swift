//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/12/21.
//
// 백준 10952

//while true {
//    let numArr = readLine()!.split(separator: " ").map { Int($0)! }
//
//    if numArr[0] == 0 && numArr[1] == 0 {
//        break
//    }
//
//    print(numArr[0] + numArr[1])
//}

while true {
    let answer = readLine()!.split(separator: " ").map { Int($0)! }.reduce(0, +)
    if answer == 0 { break }
    print(answer)
}
