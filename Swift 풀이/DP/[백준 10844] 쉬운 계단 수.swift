//
//  [백준 10844] 쉬운 계단 수.swift
//  Algorithm
//
//  Created by 김민 on 2/26/24.
//
// 백준 10844 쉬운 계단 수 https://www.acmicpc.net/problem/10844

/*
[📌 전략][✅ 풀이]
계단 수를 만들 때 마지막 자리에 오는 수에 따라 다음 수를 결정할 수 있다.
다음 수로 올 수 있는 수는 현재 수에 -1, +1울 한 수이다. (+ 0~9 사이여야 함)
이를 이용하여 dp 테이블을 dp[i][j]: i자리이고 마지막 수가 j인 계단 수로 정의하였다.
j가 0일 때는 이전 수가 1인 경우만 가능하다.
j가 9일 때는 이전 수가 8인 경우만 가능하다.
나머지 j에서는 이전 수가 j-1이거나, j+1인 경우가 가능하다. (이전 수가 5일 경우, 올 수 있는 수는 4나 6)
이를 통해 점화식을 도출해 보면
j가 0일 때: dp[i][0] = dp[i-1][1]
j가 9일 때: dp[i][9] = dp[i-1][8]
j가 1~8일 때: dp[i][j] = dp[i-1][j-1] + dp[i-1][j+1]
*/

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: 102)
let mod = 1_000_000_000

dp[1] = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]

for i in 2...100 {
    for j in 0...9 {
        if j == 0 { dp[i][0] = dp[i-1][1] % mod }
        else if j == 9 { dp[i][9] = dp[i-1][8] % mod }
        else {
            dp[i][j] = dp[i-1][j-1] % mod + dp[i-1][j+1] % mod
        }
    }
}

print(dp[n].reduce(0, +) % mod)
