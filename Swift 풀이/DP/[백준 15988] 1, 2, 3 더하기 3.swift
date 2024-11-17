//
//  [백준 15988] 1, 2, 3 더하기 3.swift
//  Algorithm
//
//  Created by 김민 on 5/23/24.
//
// 백준 15988 1, 2, 3 더하기 3 https://www.acmicpc.net/problem/15988

/*
[📌 전략]
 1 작은 수에 1을 더하는 방법
 2 작은 수에 2를 더하는 방법
 3 작은 수에 3을 더하는 방법
 1, 2, 3으로 합을 만드는 것이므로 위를 dp로 풀이

[✅ 풀이]
 dp[i]: i를 1, 2, 3의 합으로 나타내는 방법의 수로 정의

 <i를 1, 2, 3의 합으로 나타내는 방법>
 i-1을 알맞은 합으로 나타낸 방법들에 1을 더하는 방법 -> dp[i-1]
 i-2를 알맞은 합으로 나타낸 방법들에 2를 더하는 방법 -> dp[i-2]
 i-3을 알맞은 합으로 나타낸 방법들에 3을 더하는 방법 -> dp[i-3]
 dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
*/

var dp = Array(repeating: 0, count: 1_000_002)
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...1_000_000 {
    dp[i] += (dp[i-1] + dp[i-2] + dp[i-3]) % 1_000_000_009
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    print(dp[n])
}
