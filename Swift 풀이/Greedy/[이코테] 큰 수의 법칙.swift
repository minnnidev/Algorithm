//
//  [이코테] 큰 수의 법칙.swift
//  Algorithm
//
//  Created by 김민 on 12/8/23.
//
// 이코테 - 큰수의 법칙
// 가장 큰 수를 K번 더하고, 두 번째로 큰 수를 한번 더하는 연산을 반복한다
// 최댓값이 2개인 경우도 동일한 로직으로 구현된다

// 1. M <= 10000 이하인 경우
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//var (N, M, K) = (line[0], line[1], line[2])
//let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
//var result = 0
//
//while true {
//    for _ in 0..<K {
//        if M == 0 { break }
//        result += nums[0]
//        M -= 1
//    }
//
//    if M == 0 { break }
//    result += nums[1]
//    M -= 1
//}

// 2. M이 엄청 큰 경우
// 반복문으로 풀지 않고, 최댓값과 그 다음 최댓값이 더해지는 횟수 자체를 구하기
let line = readLine()!.split(separator: " ").map { Int($0)! }
var (N, M, K) = (line[0], line[1], line[2])
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
var result = 0
var count = 0

count = (M/(K+1) + M % (K+1)) * K

result += nums[0] * count
result += nums[1] * (M - count)

print(result)
