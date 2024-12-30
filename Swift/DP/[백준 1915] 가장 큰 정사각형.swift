//
//  [백준 1915] 가장 큰 정사각형.swift
//  Algorithm
//
//  Created by 김민 on 2/28/24.
//
// 백준 1915 가장 큰 정사각형 https://www.acmicpc.net/problem/1915

/*
[📌 전략]
모든 점들을 돌며 가장 긴 변을 가진 정사각형을 탐색한다고 했을 때,
최악의 경우는 모든 점들을 순회 O(n^2), 각 점에서 끝까지 순회 O(n) 총 O(n^3)
n과 m의 범위가 1 ≤ n, m ≤ 1,000 이므로 완전 탐색 알고리즘은 시간 초과가 발생한다.

따라서 dp로 풀이해 보자.
dp[i][j]는 (i, j) 좌표가 정사각형의 가장 오른쪽 밑 좌표일 때 정사각형의 최대 길이이다.

(i, j)는 만들 수 있는 정사각형의 가장 오른쪽 및 사각형이므로,
dp[i][j]는 해당 좌표의 왼쪽(dp[i][j-1]), 위쪽(dp[i-1][j]), 왼쪽 대각선(dp[i-1][j-1])의 영향을 받는다.
하나라도 dp 값이 0이라면 1,
세 좌표가 모두 같아 정사각형을 세로 만들 수 있다면 세 좌표의 dp 값 + 1,
세 좌표가 다를 때도 변의 길이가 가장 작은 사각형의 영향을 받아 min(세 좌표의 dp 값) + 1,
이를 모두 합친 점화식은 dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1 이다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = Array(repeating: Array(repeating: 0, count: 1003), count: 1003)
var dp = Array(repeating: Array(repeating: 0, count: 1003), count: 1003)

for i in 1...n { // 쉬운 인덱스 처리를 위해 각 행의 1열부터 배열 시작
    nums[i] = [0] + readLine()!.map { Int(String($0))!}
}

for i in 1...n {
    for j in 1...m {
        guard nums[i][j] == 1 else { continue }
        dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
    }
}

let k = dp.flatMap { $0 }.max()!
print(k*k)
