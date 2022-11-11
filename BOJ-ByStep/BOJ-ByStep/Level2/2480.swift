//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/11.
//
// 백준 2480

let numArr = readLine()!.split(separator: " ").map { Int($0)! }

let num1 = numArr[0]
let num2 = numArr[1]
let num3 = numArr[2]

if num1 == num2 && num2 == num1 && num1 == num3 {
    print(10000 + num1 * 1000)
} else if num1 == num2 && num2 != num3 {
    print(1000 + num1 * 100)
} else if num1 == num3 && num1 != num2 {
    print(1000 + num1 * 100)
} else if num2 == num3 && num1 != num2 {
    print(1000 + num2 * 100)
} else {
    let max = numArr.max()!
    print(max * 100)
}
