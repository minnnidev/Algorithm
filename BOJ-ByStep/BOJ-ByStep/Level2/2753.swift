//
//  main.swift
//  BOJ-ByStep
//
//  Created by 김민 on 2022/11/11.
//
//백준 2753

let year = Int(readLine()!)!

if (((year%4==0) && !(year%100==0))||(year%400==0)) {
    print("1")
} else {
    print("0")
}
