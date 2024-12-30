//
//  [백준 11053] 가장 긴 증가하는 부분 수열.swift
//  Algorithm
//
//  Created by 김민 on 2/23/24.
//
// 백준 11053 가장 긴 증가하는 부분 수열 https://www.acmicpc.net/problem/11053

/*
[📌 전략]
dp[i]: i번째 인덱스까지의 가장 긴 증가하는 부분 수열의 길이
dp[1] = 1
i번째 인덱스까지 증가하는 수열을 만들기 위해서는 이전에 올 수 있는 수는 현재 수보다 작은 수이다.
따라서 0~i-1을 순회하며 i번째 인덱스의 값보다 작은 수들을 찾는다.
그중 증가하는 수열의 길이가 가장 긴 것(== dp 갑이 가장 큰 것)에 1을 더하여 dp[i]를 만든다.
*/


let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n)
dp[0] = 1

for i in 1..<n {
    var mx = 0
    for j in 0..<i {
        if nums[j] < nums[i] {
            mx = max(mx, dp[j])
        }
    }
    dp[i] = mx + 1
}

print(dp.max()!)
