//
//  [백준 15691] 트리와 쿼리.swift
//  Algorithm
//
//  Created by 김민 on 8/19/24.
//
// 백준 15691 트리와 쿼리 https://www.acmicpc.net/problem/15681

/*
[📌 전략]
 트리 / 서브트리의 개수를 계속해서 더해가는 다이나믹 프로그래밍

[✅ 풀이]
 1. 양방향 그래프로 입력받기
 2. size 배열 선언 -> 각 인덱스를 노드로 하여, 해당 노드를 루트로 하는 서브 트리 개수를 저장
 3. 서브 트리 개수 구하기
    -> 문제의 힌트에서는 자식 노드를 따로 구했지만, visited 배열을 사용하여 풀이하였음
    3-1. 현재 cur 노드를 방문 처리하고, 자신을 포함하므로 size[cur]을 1로 갱신
    3-2. cur의 주변 노드를 순회하며 아직 방문하지 않은 노드가 존재하면(자식 노드) 해당 노드를 기준으로 재귀 함수 호출
    3-3. size[cur]에 합쳐주며 최종적인 서브트리 개수 구함
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, r, q) = (line[0], line[1], line[2])
var g = Array(repeating: [Int](), count: n+3)
var size = Array(repeating: 0, count: n+3)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (u, v) = (input[0], input[1])

    g[u].append(v)
    g[v].append(u)
}

var visited = Array(repeating: false, count: n+3)
func countSubtreeNodes(_ cur: Int) {
    visited[cur] = true
    size[cur] = 1

    for nxt in g[cur] {
        if visited[nxt] { continue }

        countSubtreeNodes(nxt)
        size[cur] += size[nxt]
    }
}

countSubtreeNodes(r)

for _ in 0..<q {
    let u = Int(readLine()!)!
    print(size[u])
}
