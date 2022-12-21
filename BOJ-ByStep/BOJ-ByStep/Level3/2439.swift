//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/12/21.
//
// 백준 2439

let num = Int(readLine()!)!

for i in (1...num).reversed() {
    for _ in 1..<i {
        print(" ", terminator: "")
    }
    
    for _ in 0...(num-i) {
        print("*", terminator: "")
    }
    print(" ")
}
