//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/11.
//
//백준 2884

let timeArr = readLine()!.split(separator: " ").map { Int($0)! }
let h = timeArr[0]
let m = timeArr[1]

if h >= 1 {
    if m >= 45 {
        print(h, m-45)
    } else {
        print(h-1, 60 + (m-45))
    }
} else {
    if m >= 45 {
        print("0", m-45)
    } else {
        print("23", 60 + (m-45))
    }
}
