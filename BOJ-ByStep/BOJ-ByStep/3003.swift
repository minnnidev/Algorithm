//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/10.
//
//백준 3003

let chessArr = [1, 1, 2, 2, 2, 8]
let input = readLine()!.split(separator: " ")
let inputArr = input.map { Int($0)!}

for (index, element) in inputArr.enumerated() {
    print(chessArr[index]-element, terminator: " ")
}

