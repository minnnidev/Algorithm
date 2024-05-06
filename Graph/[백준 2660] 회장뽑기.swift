//
//  [백준 2660] 회장뽑기.swift
//  Algorithm
//
//  Created by 김민 on 5/5/24.
//
// 백준 2660 회장뽑기 https://www.acmicpc.net/problem/2660

/*
[📌 전략]
 한 정점을 기준으로 그래프를 탐색했을 때 가장 멀리 떨어져 있는 친구를 구했을 때, 얼마나 멀리 떨어져 있는지가 점수가 됨

[✅ 풀이]
 bfs로 풀이하였고 큐에 넣을 때 (정점, depth) 튜플 형태로 enqueue하였음
*/

let n = Int(readLine()!)!
var g = Array(repeating: [Int](), count: n+1)
var scores = Array(repeating: 60, count: n+1)

while true {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (s, d) = (line[0], line[1])
    if s == -1 && d == -1 { break }

    g[s].append(d)
    g[d].append(s)
}

func bfs(_ v: Int) {
    var visited = Array(repeating: false, count: n+1)

    var q = [(v, 0)]
    visited[v] = true
    var maxScore = 0

    while !q.isEmpty {
        let f = q.removeFirst()
        
        for nxt in g[f.0] { // dequeue한 정점을 기준으로 인접한 정점들 방문
            if visited[nxt] { continue } // 방문하였을 경우 패스
            visited[nxt] = true
            q.append((nxt, f.1+1)) // 방문하지 않았다면 depth를 1 늘려 enqueue

            if f.1+1 > maxScore { // maxScore을 최대로 갱신해가며 최대한 멀리 떨어져 있는 친구와의 거리를 찾음
                maxScore = f.1+1
            }
        }
    }

    scores[v] = maxScore
}

for i in 1...n {
    bfs(i)
}

let mn = scores.min()!
var people = [Int]()

scores.enumerated().forEach {
    if $0.element == mn { people.append($0.offset) }
}

print(mn, people.count)
print(people.map { String($0) }.joined(separator: " "))
