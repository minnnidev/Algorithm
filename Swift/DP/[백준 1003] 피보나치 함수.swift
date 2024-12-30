//
//  [백준 1003] 피보나치 함수.swift
//  Algorithm
//
//  Created by 김민 on 2/21/24.
//
// 백준 1003 피보나치 함수 https://www.acmicpc.net/problem/1003

/*
[📌 전략]
 재귀 함수로 이루어진 fibonacci를 직접 호출하며 fibonacci(0)과 fibonacci(1) 횟수를 구하는 것이 아니라,
 0과 1의 출력 횟수만을 사용하여 dp로 풀이하기
[✅ 풀이]
 dp[i]: fibonacci(i)을 출력했을 때 (0의 출력 횟수와 1의 출력 횟수)로 정의
 dp[0] = (1, 0)
 dp[1] = (0, 2)

 fibonacci(i) = fibonacci(i-1) + fibonacci(i-2)임을 이용하면,
 dp[i]의 0 출력 횟수: dp[i-1]의 0 출력 횟수 + dp[i-2]의 0 출력 횟수
 dp[i]의 1 출력 횟수: dp[i-1]의 1 출력 횟수 + dp[i-2]의 1 출력 횟수
[📝 기록]
*/

let t = Int(readLine()!)!
var dp = Array(repeating: (0, 0), count: 41) // (0 출력 횟수, 1 출력 횟수)

dp[0].0 = 1
dp[1].1 = 1

for i in 2..<41 {
    dp[i].0 = dp[i-1].0 + dp[i-2].0
    dp[i].1 = dp[i-1].1 + dp[i-2].1
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(dp[n].0, dp[n].1)
}
