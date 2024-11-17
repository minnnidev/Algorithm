//
//  [백준 2294] 동전 2.swift
//  Algorithm
//
//  Created by 김민 on 6/25/24.
//
// 백준 2294 동전 2 https://www.acmicpc.net/problem/2294

/*
[📌 전략]
dp를 사용하여 풀이

[✅ 풀이]
 1. 동전의 가치를 입력받기
    - 입력받을 수 있는 동전의 최대 가치는 100,000이지만, k의 최댓값이 10,000이기 때문에 10,000보다 큰 가치를 입력받아도 풀이에 사용하지 않음. 따라서 10,000 이하일 때만 coins 배열에 저장
 2. dp 배열 선언 dp[i]는 i를 만들기 위해 사용한 동전의 최소 개수
    - 입력받은 coins로 dp[coin]을 1로 만들어 준 뒤, dp로 풀이
    - dp[i+coin] = min(dp[i+coin], dp[i]+1)이 된다. 단, dp[i+coin]이 -1일 때는 아직 합이 만들어진 적이 없다는 의미이므로최소 개수로 dp[i]+1 할당
    - 이때 dp[i+coin]에서 10000보다 큰 인덱스의 dp 배열에 접근할 수 없게 조건문 지정
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (line[0], line[1])
var coins = [Int]()
var dp = Array(repeating: -1, count: 10_005)

for _ in 0..<n {
    let num = Int(readLine()!)!

    if num <= 10_000 {
        coins.append(num)
        dp[num] = 1
    }
}

for i in 1...10_000 {
    if dp[i] == -1 { continue }

    for coin in coins {
        if i+coin > 10_000 { continue }

        if dp[i+coin] == -1 {
            dp[i+coin] = dp[i] + 1
        } else {
            dp[i+coin] = min(dp[i+coin], dp[i]+1)
        }
    }
}

print(dp[k])
