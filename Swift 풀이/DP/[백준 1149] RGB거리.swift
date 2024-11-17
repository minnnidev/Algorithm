//
//  [백준 1149] RGB거리.swift
//  Algorithm
//
//  Created by 김민 on 2/16/24.
//
// 백준 1149 RGB거리

/*
[📌 전략]
문제의 규칙들은 모두 이전 집과의 색만 같지 않다면 된다는 것을 설명하고 있다.
따라서 이전 집들의 색들을 모두 고려해야 하고,
이전 집에서 가장 비용이 작은 색만 칠하기에는 다음 집들의 비용들도 고려해야 하기 때문에
이전 집에서 각 색깔에 대해 가장 적은 비용을 저장하여 현재 집에서도 사용하도록 했다.

따라서 테이블을 d[i][j]: i번째 집에 j색을 칠할 때의 최소 비용의 합(j가 0일 때 r, 1일 때 g, 2일 때 b)으로 정의했다.

d[i][0]은 i번째 집에 빨간색을 칠하는 경우이므로,
d[i-1][1](i-1번째 집에 초록색을 칠하는 경우), d[i-1][2](i-1번째 집에 파란색을 칠하는 경우)
중 작은 값을 고르고, 현재 집에 빨간색을 칠하는 비용을 더하여 구할 수 있다.
d[i][1], d[i][2]도 같은 방식으로 구할 수 있고
첫 번째집부터 계속 찾아나가며 마지막 집을 빨강, 초록, 파랑으로 칠한 각 경우 중 최솟값으로 답을 도출한다.
*/


let n = Int(readLine()!)!
var costs = Array(repeating: Array(repeating: 0, count: 3), count: n)
var d = Array(repeating: Array(repeating: 0, count: 3), count: n)

// r: 0, g: 1, b: 2
for i in 0..<n {
    costs[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

d[0][0] = costs[0][0]
d[0][1] = costs[0][1]
d[0][2] = costs[0][2]

for i in 1..<n {
    d[i][0] = min(d[i-1][1], d[i-1][2]) + costs[i][0]
    d[i][1] = min(d[i-1][0], d[i-1][2]) + costs[i][1]
    d[i][2] = min(d[i-1][0], d[i-1][1]) + costs[i][2]
}

print(min(d[n-1][0], d[n-1][1], d[n-1][2]))
