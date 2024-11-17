//
//  [백준 11057] 오르막 수.swift
//  Algorithm
//
//  Created by 김민 on 8/29/24.
//
// 백준 11057 오르막 수 https://www.acmicpc.net/problem/11057

/*
[📌 전략]
 완전 탐색 시 시간 초과 발생 유력
 n자리의 오르막 수를 구할 때 n-1 자리 오르막 수를 이용한다 -> dp로 구현

[✅ 풀이]
 1. 이차원 배열 dp 선언. dp[i][j]: i의 길이에서 j로 끝나는 오르막 수
 2. dp[1]의 요소는 모두 1이 됨.
 3. dp[i][j] = dp[i-1][j] + dp[i][j-1] 점화식 도출
    ex. dp[2][2]: 2자리 오르막 수에서 2로 끝나는 수
    가능한 케이스 [02] [12] [22]
    dp[i][j-1] 즉 dp[2][1] 에서 [01], [11] 에 대한 정보를 얻을 수 있고, 이는 모두 끝자리 수를 2로 변경할 수 있음
    dp[i-1][j] 즉 d[[1][2]에서 [2] 에 대한 정보를 얻을 수 있고, 끝에 2를 붙일 수 있음
 4. 나머지 처리
 5. dp[n]을 모두 더한 후 나머지 처리 후 출력

[📝 기록]
 오랜만에 dp 문제를 풀었는데 낯설고 어렵게 느껴졌음... 😥
*/

let n = Int(readLine()!)!
let mx = 1000
let mod = 10_007
var dp = Array(repeating: Array(repeating: 0, count: 10), count: mx+3)

for i in 0...9 {
    dp[1][i] = 1
}

for i in 2...mx {
    for j in 0...9 {
        if j == 0 {
            dp[i][j] = 1
        } else {
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
            dp[i][j] %= mod
        }
    }
}

print(dp[n].reduce(0, +) % mod)
