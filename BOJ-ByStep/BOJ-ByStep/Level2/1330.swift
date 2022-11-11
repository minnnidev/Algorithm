//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/11.
//
//백준 1330

let numArr = readLine()!.split(separator: " ").map { Int($0)! }

if numArr[0] > numArr[1] {
    print(">")
} else if numArr[0] < numArr[1] {
    print("<")
} else {
    print("==")
}
