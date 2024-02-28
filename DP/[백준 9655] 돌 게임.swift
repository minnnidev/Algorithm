//
//  [백준 9655] 돌 게임.swift
//  Algorithm
//
//  Created by 김민 on 2/28/24.
//
// 백준 9655 돌 게임 https://www.acmicpc.net/problem/9655

/*
[📌 전략]
1. 1과 3으로 n을 만든다고 할 때, 돌을 가져간 수가 홀수면 상근이가, 짝수면 창영이가 이긴다.
이와 관련한 로직만 작성해지면 풀이할 수 있다.

2. dp[i]를 돌이 i개일 때 돌을 가져간 횟수로 정의하여 다이나믹 프로그래밍으로 풀이할 수도 있다.
예를 들어, i가 4라고 하면 dp[4] = dp[1]과 dp[3]의 횟수에 1을 더한 값이 된다.
이때 dp[i-1]과 dp[i-3]의 홀짝 여부는 같을 수밖에 없으므로 둘중 아무 값(이 풀이에서는 min값)을 선택한다.
후에 dp[i]의 홀짝 여부에 따라 승자를 출력하면 된다.
*/

// [✅ 1번 풀이]
//let n = Int(readLine()!)!
//print(n % 2 == 0 ? "CY" : "SK")

// [✅ 2번 풀이]
let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1002)

dp[1] = 1
dp[2] = 2

for i in 3...1000 {
    dp[i] = min(dp[i-1] + 1, dp[i-3] + 1)
}

print(dp[n] % 2 == 0 ? "CY" : "SK")
