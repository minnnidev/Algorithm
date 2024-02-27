//
//  [백준 9084] 동전.swift
//  Algorithm
//
//  Created by 김민 on 2/28/24.
//
// 백준 9084 동전 https://www.acmicpc.net/problem/9084

/*
[📌 전략][✅ 풀이]
주어진 금액을 만드는 모든 방법을 만들기 위해서는 dp 사용 필요
dp[i]: i를 만들 수 있는 모든 방법의 개수로 정의

ex. 10원을 2원, 3원, 5원으로 만들기
10원을 만들 수 있는 방법은
1. 8원을 만들 수 있는 방법에 2원을 더하기
2. 7원을 만들 수 있는 방법에 3원을 더하기
3. 5원을 만들 수 있는 방법에 5원을 더하기

점화식은 d[i] = d[i-화폐 단위들]

단, 방법의 개수는 각 동전들의 개수와 같아 해당 점화식으로 모두 계산 시 중복이 생길 수 있다.
따라서 화폐 단위를 기준으로 해당 화폐 단위보다 큰 금액부터 만들어가며 m까지 dp[i-해당 화폐 단위]를 구하기
모든 화폐 단위에 따라 dp[i-해당 화폐 단위]를 더하면, dp[n]이 n을 만들 수 있는 모든 방법이 된다.

[📝 기록]
어려웠는데 정답 비율 67%... 다들 대단하다... 💦
*/

let t = Int(readLine()!)!

for _ in 0..<t {
    let _ = Int(readLine()!)!
    var costs = readLine()!.split(separator: " ").map { Int($0)! }
    let m = Int(readLine()!)!
    var dp = Array(repeating: 0, count: m+2)
    dp[0] = 1

    for cost in costs {
        guard cost <= m else { continue } // 화페 단위가 m보다 큰 경우 고려하기 위해 guard문 구현
        for j in cost...m {
            dp[j] += dp[j-cost]
        }
    }

    print(dp[m])
}
