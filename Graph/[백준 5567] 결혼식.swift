//
//  [백준 5567] 결혼식.swift
//  Algorithm
//
//  Created by 김민 on 4/9/24.
//
// 백준 5567 결혼식 https://www.acmicpc.net/problem/5567

/*
[📌 전략]
 그래프 탐색으로 풀이할 수 있는 문제
 상근이의 친구, 친구의 친구까지만 탐색하기 위한 로직 필요

[✅ 풀이]
 bfs로 풀이하였고, 큐에 넣을 때 (정점, depth)를 enqueue
 상근이의 친구의 친구까지 탐색해야 하므로 depth가 3이상이 되면 더이상 탐색하지 않아도 됨.
*/

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var g = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var ans = 0

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (line[0], line[1])
    g[a].append(b)
    g[b].append(a)
}

func bfs() {
    var q = [(1, 0)] // (정점, depth)
    visited[1] = true

    while !q.isEmpty { // 큐가 빌 때까지
        let (f, cnt) = q.removeFirst()

        for nxt in g[f] { // 인접한 정점 탐색
            if visited[nxt] { continue }
            if cnt + 1 >= 3 { return } // 3 이상일 경우 탐색 중지

            visited[nxt] = true
            ans += 1
            q.append((nxt, cnt+1))
        }
    }
}

bfs()
print(ans)
