//
//  [백준 1240] 노드 사이의 거리.swift
//  Algorithm
//
//  Created by 김민 on 8/2/24.
//
// 백준 1240 노드 사이의 거리 https://www.acmicpc.net/problem/1240

/*
[📌 전략]
 트리 / 그래프 탐색 문제

[✅ 풀이]
 1. 그래프 입력 시 각 간선의 거리 포함하여 입력받기
 2. 그래프 탐색 실시
    - 거리를 알고 싶은 노드쌍의 출발 정점으로부터 bfs나 dfs 탐색을 실시하여 마지막 정점을 마주하면 함수 return
    - dfs, bfs로 모두 구현해 보았고, 자세한 풀이는 아래 코드 참고
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var g = Array(repeating: [(Int, Int)](), count: n+2)
var visited = Array(repeating: false, count: n+2)
var ans = 0

for _ in 0..<n-1 {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v, d) = (line[0], line[1], line[2])

    // 무방향 그래프임과 거리까지 포함하여 입력받기
    g[u].append((v, d))
    g[v].append((u, d))
}

func bfs(st: Int, en: Int) {
    var q = [(st, 0)]
    visited[st] = true

    // 큐가 비워질 때까지 탐색
    while !q.isEmpty {
        let f = q.removeFirst()
        let (v, d) = (f.0, f.1)

        // 현재 dequeue된 요소의 인접 정점 탐색
        for nxt in g[v] {
            let (nv, nd) = (nxt.0, nxt.1)
            if visited[nv] { continue }

            // 인접 정점이 타겟인 경우
            if nv == en { // 최종 거리를 더하여 출력
                print(d + nd)
                return
            }

            // 이외의 경우는 방문처리를 하고 거리 갱신하여 다시 큐에 넣기
            visited[nv] = true
            q.append((nv, d + nd))
        }
    }
}

func dfs(cur: Int, target: Int, dis: Int) {
    visited[cur] = true

    // 인접 정점 탕색
    for nxt in g[cur] {
        if visited[nxt.0] { continue }
        if nxt.0 == target { // 인접 정점이 타겟인 경우 거리 갱신 후 함수 return
            ans += (dis + nxt.1)
            return
        }

        // 이외의 경우 인접 정점부터 다시 dfs 탐색 실시
        dfs(cur: nxt.0, target: target, dis: dis + nxt.1)
    }
}


for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (st, en) = (line[0], line[1])
    visited = Array(repeating: false, count: n+2)

    // BFS
    bfs(st: st, en: en)

    // DFS
//    ans = 0
//    dfs(cur: st, target: en, dis: 0)
//    print(ans)
}
