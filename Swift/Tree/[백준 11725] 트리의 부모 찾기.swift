//
//  [백준 11725] 트리의 부모 찾기.swift
//  Algorithm
//
//  Created by 김민 on 7/22/24.
//
// 백준 11725 트리의 부모 찾기 https://www.acmicpc.net/problem/11725

/*
[📌 전략]
 트리 탐색 문제

[✅ 풀이]
 1. 부모를 저장할 배열 선언 (visited를 따로 체크하지 않고 같이 사용)
 2. dfs를 통해 cur의 인접 노드를 방문한 뒤 부모 노드 채워줌
    - 인접 노드가 부모 노드일 때는 continue
*/


let n = Int(readLine()!)!
let mx = 100_000
var g = Array(repeating: [Int](), count: mx+2)
var p = Array(repeating: 0, count: mx+2)

for _ in 0..<n-1 {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (line[0], line[1])

    g[u].append(v)
    g[v].append(u)
}

func dfs(_ cur: Int) {
    for nxt in g[cur] {
        if p[cur] == nxt { continue } // 인접 노드가 부모일 때

        p[nxt] = cur
        dfs(nxt)
    }
}

dfs(1)

for i in 2...n { print(p[i]) }
