//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/08.
//

// 백준 #1000 A+B

import Foundation

let line = readLine()!
let lineArr = line.components(separatedBy: " ")

let a = Int(lineArr[0])!
let b = Int(lineArr[1])!

print(a+b)

//print((readLine()?.split(separator: " ").map { Int($0)! }.reduce(0, +))!)
