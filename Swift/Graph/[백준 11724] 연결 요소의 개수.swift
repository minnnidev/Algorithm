//
//  [백준 11724] 연결 요소의 개수.swift
//  Algorithm
//
//  Created by 김민 on 4/1/24.
//
// 백준 11724 연결 요소의 개수 https://www.acmicpc.net/problem/11724

/*
[📌 전략]
그래프의 연결 요소를 찾는 문제. 나누어진 그래프의 개수를 찾으면 된다.
bfs, dfs 모두로 풀이했다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var g = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var ans = 0

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (line[0], line[1])
    // 방향이 없는 그래프이므로 u 인덱스에 v 값, v 인덱스에 u 값 모두 삽입해야 한다.
    g[u].append(v)
    g[v].append(u)
}

// dfs로 그래프 탐색
func dfs(_ v: Int) {
    visited[v] = true

    for next in g[v] { // 현재 정점에서 인접한 정점들을 찾는다
        if visited[next] { continue } // 방문한 적이 있다면 넘어간다
        visited[next] = true
        dfs(next) // 방문하지 않았다면 해당 next 정점에서 재귀를 통해 dfs 탐색 실시
    }
}

// bfs로 그래프 탐색
func bfs(_ u: Int) {
    var q = [u]
    visited[u] = true

    // 큐가 빌 때까지 반복
    while !q.isEmpty {
        let u = q.removeFirst()

        for next in g[u] { // 인접한 정점들을 탐색
            if visited[next] { continue }
            visited[next] = true
            q.append(next) // 아직 방문한 적이 없다면 큐에 넣어 다음 bfs 탐색을 준비
        }
    }
}

for i in 1...n { // 나누어진 그래프를 찾으므로, 반복문을 통해 아직 방문하지 않은 정점을 찾아가야 한다.
    if !visited[i] {
        // 둘 중에 풀이에 맞는 함수를 호출하면 된다.
        bfs(i)
//        dfs(i)
        ans += 1 // 한번의 해당 함수가 끝날 때마다 나눠진 그래프 중 하나의 그래프에 전부 방문했으므로 카운트해줌
    }
}

print(ans)
