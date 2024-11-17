//
//  [백준 9465] 스티커.swift
//  Algorithm
//
//  Created by 김민 on 7/30/24.
//
// 백준 9465 스티커 https://www.acmicpc.net/problem/9465

/*
[📌 전략]
 n (1 ≤ n ≤ 100,000) 완전 탐색 애초에 불가
 서로 변을 공유하지 않고 스티커를 선택하는 데는 길이 2짜리 사각형을 지나는 대각선, 길이 3짜리 사각형을 지나는 대각선 2가지 경우가 존재함을 이용

[✅ 풀이]
 1. 입력받기
 2. 스티커 입력과 동일한 개수만큼 dp배열 선언
    dp[n][i] -> (n, i) 좌표의 스티커를 뗐을 때 스티커 점수의 최댓값의 합 (n은 0, 1이 존재)
 3. (0, i) 좌표의 스티커를 뗄 수 있는 경우는 dp[1][i-1]번째 스티커를 뗐을 경우와 dp[1][i-2]를 뗐을 경우
    (1, i) 좌표의 스티커를 뗄 수 있는 경우는 dp[0][i-1]번째 스티커를 뗐을 경우와 dp[0][i-2]를 뗐을 경우
    따라서 각 좌표의 스티커를 뗄 수 있는 경우 중 최댓값에 자신의 스티커 점수를 더하여 dp[n][i] 구함

    <점화식>
     dp[0][i] = max(dp[1][i-1], dp[1][i-2]) + arr[0][i]
     dp[1][i] = max(dp[0][i-1], dp[0][i-2]) + arr[1][i]

 4. n번째 열들 중 최댓값이 스티커 점수의 최댓값이 됨

[📝 기록]
 풀고나니 전형적인 dp 문제이구나 싶었는데 당시에는 어려웠음.
 이 문제는 특이하게 행 개수가 2개로 고정되어 있는데 이런 조건을 주는 이유가 다 있구나 했었던 문제.
*/


let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var arr = Array(repeating: [0] , count: 2)
    var dp = Array(repeating: Array(repeating: 0, count: 100_002), count: 2)

    for i in 0..<2 {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        arr[i].append(contentsOf: line)
    }

    for i in 1...n {
        if i == 1 {
            dp[0][1] = arr[0][1]
            dp[1][1] = arr[1][1]
            continue
        }
        dp[0][i] = max(dp[1][i-1], dp[1][i-2]) + arr[0][i]
        dp[1][i] = max(dp[0][i-1], dp[0][i-2]) + arr[1][i]
    }

    print(max(dp[0][n], dp[1][n]))
}
