//
//  [프로그래머스] 네트워크.swift
//  Algorithm
//
//  Created by 김민 on 6/18/24.
//
// 프로그래머스 네트워크 https://school.programmers.co.kr/learn/courses/30/lessons/43162

/*
[📌 전략]
 그래프 탐색 문제

[✅ 풀이]
 1. dfs로 그래프 탐색
    - visited 배열을 만들어 방문 여부 체크
    - computers[k]에 접근하여 연결되어 있는 노드 중 아직 방문하지 않은 노드가 있다면 dfs(해당 노드) 실시
 2. 방문하지 않은 정점들을 방문하며 끊어져 있는 네트워크도 체크
*/

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var ans = 0

    func dfs(_ k: Int) {
        visited[k] = true

        for i in 0..<n {
            if computers[k][i] == 0 { continue }
            if visited[i] { continue }

            visited[i] = true
            dfs(i)
        }
    }

    for i in 0..<n {
        if visited[i] { continue }

        dfs(i)
        ans += 1
    }

    return ans
}
