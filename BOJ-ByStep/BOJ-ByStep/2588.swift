//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/10.
//
//백준 2588

let firstNum = Int(readLine()!)!
let secondNum = Int(readLine()!)!

let oneDigit = secondNum % 10
let tensDigit = (secondNum / 10) % 10
let hundredsDigit = secondNum / 100


print(firstNum * oneDigit)
print(firstNum * tensDigit)
print(firstNum * hundredsDigit)
print(firstNum * secondNum)
