//
//  [백준 4803] 트리.swift
//  Algorithm
//
//  Created by 김민 on 7/29/24.
//
// 백준 4803 트리 https://www.acmicpc.net/problem/4803

/*
[📌 전략]
 트리 개수를 찾는 문제
 싸이클을 찾는 과정에 주의할 것

[✅ 풀이]
 1. 알맞은 형식으로 입력받기
 2. dfs로 그래프 탐색
    - 받은 target 파라미터에 방문 표시
    - target의 인접 정점들 탐색
    - 인접 정점이 부모였을 경우 그냥 넘어감
    - 부모가 아닌데 방문했을 경우 싸이클 발생 -> false 반환
    - 이외의 경우 dfs 재귀로 실시 -> false로 반환이 될 경우 다시 false 반환
    - 모든 경우를 통과했을 시 true를 반환하여 트리 개수 하나 추가
*/

var caseNumber = 0

while true {
    caseNumber += 1
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (line[0], line[1])

    if n == 0 && m == 0 { break }

    var g = Array(repeating: [Int](), count: 502)
    var visited = Array(repeating: false, count: 502)
    var ans = 0

    func makeTree(target: Int, parent: Int) -> Bool {
        visited[target] = true

        for nxt in g[target] {
            if nxt == parent { continue }
            if visited[nxt] { return false }
            if !makeTree(target: nxt, parent: target) { return false }
        }

        return true
    }

    for _ in 0..<m {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        let (u, z) = (line[0], line[1])

        g[u].append(z)
        g[z].append(u)
    }

    for i in 1...n {
        if visited[i] { continue }

        if makeTree(target: i, parent: 0) { ans += 1 }
    }

    if ans == 0 {
        print("Case \(caseNumber): No trees.")
    } else if ans == 1 {
        print("Case \(caseNumber): There is one tree.")
    } else {
        print("Case \(caseNumber): A forest of \(ans) trees.")
    }
}
