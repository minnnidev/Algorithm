//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/11.
//
//백준 14681

let x = Int(readLine()!)!
let y = Int(readLine()!)!

if x > 0 && y > 0 {
    print("1")
} else if x < 0 && y > 0 {
    print("2")
} else if x < 0 && y < 0 {
    print("3")
} else if x > 0 && y < 0 {
    print("4")
}
