//
//  [백준 14267] 회사 문화.swift
//  Algorithm
//
//  Created by 김민 on 8/5/24.
//
// 백준 14267 회사 문화 https://www.acmicpc.net/problem/14267

/*
[📌 전략]
 트리 + dp

[✅ 풀이]
 1. 입력받은 칭찬 수치는 바로 결과 배열에 추가
 2. 사장(1번)부터 dfs 탐색 시작
    - 자식 부하를 탐색하며 자식 부하에게 부모 상사의 칭찬 수치 더하기
    - 이러한 과정을 통해 칭찬 수치의 총합을 구함
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var g = Array(repeating: [Int](), count: n+2)
var staffs = readLine()!.split(separator: " ").map { Int($0)! }
var scores = Array(repeating: 0, count: n+2)
var visited = Array(repeating: false, count: n+2)

for (idx, staff) in staffs.enumerated() {
    if idx == 0 { continue }

    g[staff].append(idx+1)
}

func dfs(cur: Int) {
    visited[cur] = true

    for nxt in g[cur] {
        if visited[nxt] { continue }

        visited[nxt] = true
        scores[nxt] += scores[cur]
        dfs(cur: nxt)
    }
}


for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, w) = (line[0], line[1])

    scores[i] += w
}

dfs(cur: 1)

print(scores[1...n].map { String($0) }.joined(separator: " "))
