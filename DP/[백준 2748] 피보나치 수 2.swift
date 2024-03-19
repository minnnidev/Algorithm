//
//  [백준 2748] 피보나치 수 2.swift
//  Algorithm
//
//  Created by 김민 on 3/19/24.
//
// 백준 2748 피보나치 수 2 https://www.acmicpc.net/problem/2748

/*
 [✅ 풀이]
피보나치는 재귀함수로도 풀 수 있지만, dp로 풀이했다.
*/

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: 92) // 피보나치 수열

arr[1] = 1

for i in 2...90 {
    arr[i] = arr[i-2] + arr[i-1]
}

print(arr[n])
