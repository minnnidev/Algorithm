//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/12/21.
//
// 백준 10951

while let line = readLine() {
    let arr = line.split(separator: " ").map { Int($0)! }
    print(arr[0] + arr[1])
}
