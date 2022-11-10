//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/10.
//
//백준 10430

let inputArr = readLine()!.split(separator: " ").map { Int($0)! }
let A = inputArr[0]
let B = inputArr[1]
let C = inputArr[2]

print((A+B)%C)
print(((A%C) + (B%C))%C)
print((A*B)%C)
print(((A%C) * (B%C))%C)
