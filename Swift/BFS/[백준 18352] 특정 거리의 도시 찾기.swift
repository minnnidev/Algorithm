//
//  [백준 18352] 특정 거리의 도시 찾기.swift
//  Algorithm
//
//  Created by 김민 on 10/25/24.
//
// 백준 18352 특정 거리의 도시 찾기 https://www.acmicpc.net/problem/18352

/*
[📌 전략]
 노드 x로부터 최단 거리 k에 있는 노드를 출력하는 함수
 -> bfs로 풀이

[✅ 풀이]
 x를 시작으로 bfs 탐색 실시
 bfs에 추가하는 요소는 (현재 탐색 노드, 거리)이므로 초기에 큐에 들어가는 값은 (x, 0)
 큐에서 꺼낸 값이 k+1이 될 경우, 더이상 탐색할 필요 없으므로 탈출

 인접한 노드를 탐색하다가, 거리가 k인 경우 ans 배열에 append

 ans 배열을 정렬한 후 출력
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k, x) = (line[0], line[1], line[2], line[3])
var g = Array(repeating: [Int](), count: n+1)

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    g[line[0]].append(line[1])
}

var visited = Array(repeating: false, count: n+1)
var ans = [Int]()

var q = [(x, 0)]
visited[x] = true

while !q.isEmpty {
    let f = q.removeFirst()
    let (cur, dist) = (f.0, f.1)

    if dist == k+1 { break }

    for nxt in g[cur] {
        if visited[nxt] { continue }

        visited[nxt] = true
        q.append((nxt, dist+1))

        if dist + 1 == k {
            ans.append(nxt)
        }
    }
}

if ans.count > 0 {
    ans.sorted().forEach { print($0) }
} else {
    print(-1)
}
