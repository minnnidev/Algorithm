//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/12/21.
//
// 백준 25304

let resultPrice = Int(readLine()!)!
let num = Int(readLine()!)!

var sum = 0

for _ in 0..<num {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    sum += (arr[0] * arr[1])
}

resultPrice == sum ? print("Yes") : print("No")
