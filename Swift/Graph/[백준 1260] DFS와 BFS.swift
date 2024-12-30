//
//  [백준 1260] DFS와 BFS.swift
//  Algorithm
//
//  Created by 김민 on 4/3/24.
//
// 백준 1260 DFS와 BFS https://www.acmicpc.net/problem/1260

/*
[📌 전략]
 그래프의 성질을 잘 활용하여 dfs, bfs로 탐색하기만 하면 되는 문제
 시작 노드 v를 입력으로 주고,
 탐색 시 정점 번호가 작은 것을 먼저 방문해야 하므로 정렬이 필요하다.
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, v) = (line[0], line[1], line[2])
var g = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var dfsAns = [Int]()
var bfsAns = [Int]()

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (line[0], line[1])
    g[a].append(b)
    g[b].append(a)
}

// 한 정점과 이어져 있는 정점에 대해 정렬 필요
for i in 1...n {
    g[i].sort()
}

// dfs 탐색
func dfs(_ v: Int) {
    visited[v] = true

    for next in g[v] {
        if visited[next] { continue }
        
        visited[next] = true
        dfsAns.append(next)
        dfs(next)
    }
}

// bfs 탐색
func bfs(_ v: Int) {
    var q = [v]
    visited[v] = true

    while !q.isEmpty {
        let f = q.removeFirst()
        
        for next in g[f] {
            if visited[next] { continue }

            bfsAns.append(next)
            visited[next] = true
            q.append(next)
        }
    }
}

dfsAns.append(v)
dfs(v)

// bfs 탐색 시 기존 visited에 영향을 받지 않기 위해서 초기화 필요
visited = Array(repeating: false, count: n+1)
bfsAns.append(v)
bfs(v)

print(dfsAns.map { "\($0)" }.joined(separator: " "))
print(bfsAns.map { "\($0)" }.joined(separator: " "))
