//
//  [프로그래머스] 전력망을 둘로 나누기.swift
//  Algorithm
//
//  Created by 김민 on 9/28/24.
//
// 프로그래머스 전력망을 둘로 나누기 https://school.programmers.co.kr/learn/courses/30/lessons/86971#

/*
[📌 전략]
 모든 전선을 하나씩 끊어가면서 차이가 가장 적은 경우를 구하기
 차이를 구하기 위해서는 각 전력망에 몇 개의 송전탑이 있는지를 파악해야 하고 이 과정에서 dfs 활용
 -> dfs + 완전 탐색 문제

[✅ 풀이]
 1. 그래프 생성
    - 입력받은 배열을 사용하여 인접 리스트 형태로 그래프 생성
 2. 각 전선을 하나씩 끊어볼 것이므로 wires 배열 기준 순회
    - 전선을 끊었다를 visited 배열로 나타낼 것 -> visited[v1], visited[v2]가 true가 됨
    - 각 v1과 v2에서 dfs 탐색을 하여 최소 차를 구함
 3. dfs 탐색
    - 현재 노드(송전탑)을 cur 파라미터로 받아, 그래프[cur]을 순회하여 인접 노드 파악
    - 방문하지 않았다면 다시 dfs 탐색 실시
    - int형을 반환하여 최종 전력망 안의 송전탑 개수의 합을 구하도록 함
        - 이 과정에서 1을 더해 줘야 자신을 포함한 올바른 총합을 나타낼 수 있음
[📝 기록]
*/


import Foundation

var visited = [Bool]()
var g = [[Int]]()

func dfs(_ cur: Int) -> Int {
    var cnt = 0
    visited[cur] = true

    for nxt in g[cur] {
        if visited[nxt] { continue }

        visited[nxt] = true
        cnt += 1 + dfs(nxt)
    }

    return cnt
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    g = Array(repeating: [Int](), count: n+3)
    var ans = Int.max

    for wire in wires {
        let (u, v) = (wire[0], wire[1])

        g[u].append(v)
        g[v].append(u)
    }

    for i in 0..<wires.count {
        visited = Array(repeating: false, count: n+3)
        let (u, v) = (wires[i][0], wires[i][1])

        visited[u] = true
        visited[v] = true

        let cnt1 = dfs(u)
        let cnt2 = dfs(v)

        ans = min(abs(cnt1 - cnt2), ans)
    }

    return ans
}
