//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/12/21.
//
// 백준 1110

//let num = Int(readLine()!)!
//var result = num
//
//var cnt = 0
//var tmp = -1
//
//while (tmp != num) {
//    if result < 10 {
//        tmp = result * 10 + ((result % 10) + (result / 10)) % 10
//    } else {
//        tmp = (result % 10) * 10 + ((result % 10) + (result / 10)) % 10
//    }
//
//    result = tmp
//    cnt += 1
//}
//
//print(cnt)

//let num = Int(readLine()!)!
//var result = num
//var tmp = 0
//var cnt = 0
//
//repeat {
//        if result < 10 {
//            tmp = result * 10 + ((result % 10) + (result / 10)) % 10
//        } else {
//            tmp = (result % 10) * 10 + ((result % 10) + (result / 10)) % 10
//        }
//
//        result = tmp
//        cnt += 1
//} while (tmp != num)
//
//print(cnt)

var input = Int(readLine()!)!
let result = input
var cnt = 0

repeat {
    let firstNum = input % 10
    let secondNum = ((input % 10) + (input / 10)) % 10
    
    input = firstNum * 10 + secondNum
    cnt+=1
} while (result != input)

print(cnt)
