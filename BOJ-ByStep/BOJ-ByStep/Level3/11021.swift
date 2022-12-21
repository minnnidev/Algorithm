//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/12/21.
//
// 백준 11021

let num = Int(readLine()!)!

for i in 1...num {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    print("Case #\(i): \(arr[0] + arr[1])")
}
