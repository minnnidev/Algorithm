//
//  [백준 1389] 케빈 베이컨의 6단계 법칙.swift
//  Algorithm
//
//  Created by 김민 on 5/8/24.
//
// 백준 1389 케빈 베이컨의 6단계 법칙 https://www.acmicpc.net/problem/1389

/*
[📌 전략]
 bfs에서 특정 위치까지의 가는 데 걸리는 시간, 거리를 구하는 문제와 비슷한 그래프 탐색 문제

[✅ 풀이]
 1. 한 노드로부터 다른 모든 노드까지의 각각 최소 거리를 구한다 -> bfs로 탐색하였음.
 2. 인접한 노드를 탐색할 때 방문한 적이 있다면 넘어가고, 방문한 적이 없다면 dequeue한 노드의 거리 + 1을 저장해 준다.
 3. 한 사람의 케빈 베이컨 수는 distance의 모든 요소들의 합과 같음
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var g = Array(repeating: [Int](), count: n+1)
var scores = Array(repeating: 0, count: n+1)
var visited = Array(repeating: false, count: n+1)

for _ in 0..<m {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    let (s, d) = (nums[0], nums[1])
    g[s].append(d)
    g[d].append(s)
}

func bfs(_ s: Int) {
    var distance = Array(repeating: -1, count: n+1)
    var q = [s]
    distance[s] = 0

    while !q.isEmpty {
        let f = q.removeFirst()

        for nxt in g[f] {
            if distance[nxt] > -1 { continue }

            distance[nxt] = distance[f] + 1
            q.append(nxt)
        }
    }

    scores[s] = distance.filter { $0 > 0 }.reduce(0, +)
}

for i in 1...n {
    bfs(i)
}

let mn = scores[1...n].min()!
print(scores.firstIndex(of: mn)!)
