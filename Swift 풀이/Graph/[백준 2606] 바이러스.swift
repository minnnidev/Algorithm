//
//  [백준 2606] 바이러스.swift
//  Algorithm
//
//  Created by 김민 on 4/8/24.
//
// 백준 2606 바이러스 https://www.acmicpc.net/problem/2606

/*
[📌 전략]
 그래프 탐색으로 풀 수 있는 문제. dfs/bfs 모두 가능하고 dfs 탐색으로 풀이하였다.
*/


let n = Int(readLine()!)!
var m = Int(readLine()!)!
var g = Array(repeating: [Int](), count: 102)

// 그래프 입력 받기 - 무방향 그래프이므로 두 번 append 필요
while m > 0 {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (line[0], line[1])
    g[a].append(b)
    g[b].append(a)
    m -= 1
}

var visited = Array(repeating: false, count: 102)
var ans = 0

// dfs
func dfs(_ k: Int) {
    visited[k] = true

    for nxt in g[k] { // k 정점의 인접 정점 중 방문하지 않은 정점 방문하기
        if visited[nxt] { continue }

        ans += 1
        dfs(nxt)
    }
}

dfs(1) // 1번 컴퓨터부터 시작
print(ans)
