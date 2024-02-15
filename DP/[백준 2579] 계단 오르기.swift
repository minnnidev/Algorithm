//
//  [백준 2579] 계단 오르기.swift
//  Algorithm
//
//  Created by 김민 on 2/14/24.
//
// 백준 2579 계단 오르기 https://www.acmicpc.net/problem/2579

/*
[📌 전략 및 풀이]
계단 3개를 연속으로 밟을 수 없으니 연속으로 몇 번째 계단인지에 대한 정보가 필요하겠다고 생각함.
따라서 테이블을 2차원 배열로 두고
d[i][j] = 현재까지 j개의 계단을 연속으로 밟았고, i번째 계단에 왔을 때 점수 합의 최댓값
으로 정의

d[j][1]은 j-2번째 계단에 도달할 수 있는 모든 방법을 통해 j번째 계단으로 이동하는 것.
따라서 d[i][1]는 max(d[i-2][1], d[i-2][2]) + scores[i]
d[j][2]는 j-1번째 계단에서 j번째 계단으로 이동하는 것이므로
j-1번째 계단에 두 계단을 이동하여 도달해야 계단 3개를 연속으로 밟지 않는다.
따라서 d[i][2]는 d[i-1][1] + scores[i]

[📝 기록]
dp 문제를 풀 때 꼭 테이블을 1차원 배열로 하지 않아도 된다!
필요한 정보가 있으면 활용하자!
*/

let n = Int(readLine()!)!
var scores = Array(repeating: 0, count: n+1)

for i in 1...n {
    scores[i] = Int(readLine()!)!
}

var d = Array(repeating: Array(repeating: 0, count: 3), count: n+1)

for i in 1...n {
    if i == 1 {
        d[1][1] = scores[1]
        d[1][2] = 0
    } else if i == 2 {
        d[2][1] = scores[2]
        d[2][2] = scores[1] + scores[2]
    } else {
        d[i][1] = max(d[i-2][1], d[i-2][2]) + scores[i]
        d[i][2] = d[i-1][1] + scores[i]
    }
}

print(max(d[n][1], d[n][2]))
