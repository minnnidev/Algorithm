//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/11.
//
//백준 2525

let time = readLine()!.split(separator: " ").map { Int($0)! }
let C = Int(readLine()!)!

let A = time[0]
let B = time[1]

let tmpHour = (B + C) / 60
let tmpMinute = (B + C) % 60

A+tmpHour >= 24 ? print(A+tmpHour-24, tmpMinute) : print(A+tmpHour, tmpMinute)
