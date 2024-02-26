//
//  main.swift
//  Algorithm
//
//  Created by 김민 on 2/26/24.
//
// 백준 제곱수의 합 1699 https://www.acmicpc.net/problem/1699

/*
[📌 전략] [✅ 풀이]
dp[i]: i의 제곱수 항의 최소 개수
dp[i]를 구하기 위해 i보다 작은 제곱수들을 이용한 모든 경우 중 항의 개수가 최소인 경우를 찾아야 한다.
18 = 4^2 + 1 + 1 = 4^2 + dp[2]
   = 3^2 + 3^2 = 3^2 + dp[9] -> 개수가 최소!
   = 2^2 + 3^2 + 2^2 + 1 = 2^2 + dp[14]
   = 1 + 1 + 4^2 = 1 + dp[17]

[📝 기록]
처음에 이전 값들 중 최대인 제곱 수 + dp[남은 값]으로 풀었었는데,
18 같은 경우는 4^2+1+1이 아니라 3^2+3^2가 아니라는 반례를 통해 다시 해결했던 문제
*/

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 100_003)

for i in 1...n {
    dp[i] = i
    for j in 1...i {
        if j*j > i { break }
        if dp[i] > 1 + dp[i-j*j] {
            dp[i] = 1 + dp[i-j*j]
        }
    }
}

print(dp[n])

// 오답 😭
/*
 let n = Int(readLine()!)!
 var dp = Array(repeating: 0, count: 100_003)

 dp[1] = 1
 dp[2] = 2
 dp[3] = 3

 var tmp = 2
 var prevPower = 4
 for i in 4...100_000 {
     if i == tmp * tmp { // 제곱 수 설정
         dp[i] = 1
         tmp += 1
         prevPower = i
         continue
     }

     dp[i] = 1 + dp[i-prevPower]
 }

 print(dp[n])
 */
