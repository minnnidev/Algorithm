//
//  [백준 2156] 포도주 시식.swift
//  Algorithm
//
//  Created by 김민 on 4/4/24.
//
// 백준 2156 포도주 시식 https://www.acmicpc.net/problem/2156

/*
[📌 전략][✅ 풀이]
 dp[i][j] - 연속 i번째 이하로 j번째 잔에서 현재까지 마신 포도주 양의 최대

 1. dp[1][j]
 연속 1번째 이하인 순서에 j번째 잔을 들어야 하므로, 무조건 j-2번째 잔을 든 다음에 j번째 잔을 들 수 있다.
 최대를 찾아야 하므로
 dp[1][j] = max(d[1][j-2]+arr[j], d[2][j-2]+arr[j])가 된다.

 2. dp[2][j]
 연속 2번째 이하인 순서에 j번째 잔에서 가능한 경우는
 직전에 연속으로 2번 마시고 현재의 잔에서는 들지 않기
 직전에 연속 1번을 마시고 현재 잔에서 마시기 총 2가지가 존재한다.
 최대를 찾아야 하므로
 dp[2][j] = max(dp[2][j-1], dp[1][j-1]+arr[j])

 최대를 계속해서 만들어서 마지막 잔까지 가져가므로, 결과는 dp[1][n], dp[2][n] 중 큰 값이 된다.
*/


let n = Int(readLine()!)!
var arr = [0] + Array(repeating: 0, count: n)
var dp = Array(repeating: Array(repeating: 0, count: n+1), count: 3)

for i in 1...n {
    arr[i] = Int(readLine()!)!
}

for i in 1...n {
    if i == 1 {
        dp[1][1] = arr[1]
        dp[2][1] = arr[1]
    } else {
        dp[1][i] = max(dp[1][i-2], dp[2][i-2]) + arr[i]
        dp[2][i] = max(dp[2][i-1], dp[1][i-1] + arr[i])
    }
}

print(max(dp[1][n], dp[2][n]))
