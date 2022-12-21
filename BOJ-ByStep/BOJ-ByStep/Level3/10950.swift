//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/12/21.
//
// 백준 10950

let num = Int(readLine()!)!

for _ in 0..<num {
    let numArr = readLine()!.split(separator: " ").map { Int($0)! }
    print(numArr[0] + numArr[1])
}
