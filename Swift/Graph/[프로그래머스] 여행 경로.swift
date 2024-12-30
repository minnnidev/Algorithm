//
//  [프로그래머스] 여행 경로.swift
//  Algorithm
//
//  Created by 김민 on 8/19/24.
//
// 프로그래머스 여행 경로 https://school.programmers.co.kr/learn/courses/30/lessons/43164

/*
[📌 전략]
 dfs로 여행 경로 탐색하기
    - 주어진 항공권을 모두 활용한다는 조건을 활용
    - 가능한 경로가 2객 이상일 경우 알파벳 순서가 앞서는 경로를 선택
    - 알파벳 순서가 앞서는 경로를 선택했을 때, 주어진 항공권을 모두 활용하지 못하는 경우가 생긴다면 이 경우는 사용 불가

[✅ 풀이]
 1. 알파벳 순서로 앞서는 경로를 선택해야 함 -> 도착지 기준으로 알파벳순으로 정렬
 2. dfs 함수 구성 (cur: 현재 출발지, k: 나는 현재 k개의 공항을 방문했다)
    - 모든 항공권을 쓰려면 (티켓 개수 + 1)개의 공항 방문해야 함(출발지 ICN 포함) -> dfs 탈출 조건
    - 항공권을 순회하며, 해당 출발지에 해당하는 목적지 티켓을 찾기
    - 아직 사용하지 않은 티켓이라면 사용 후, dfs(목적지, k+1) 호출
    - 해당 dfs 함수가 끝나면 사용 처리를 해제하여 다른 여행 경로 설정에 대비
    - 가장 첫 번째로 (티켓 개수 + 1)개로 완성된 여행 경로가 알파벳 순서가 앞서는대로 설정된 경로
*/


var visited = [Bool]()
var sortedTickets = [[String]]()
var ans = [String]()
var result = [[String]]()
var n = 0

func dfs(_ cur: String, _ k: Int) {
    if k == n+1 {
        result.append(ans)
        return
    }

    for i in 0..<n {
        let tick = sortedTickets[i]

        if visited[i] { continue }
        if tick[0] != cur { continue }

        visited[i] = true
        ans[k] = tick[1]
        dfs(tick[1], k+1)
        visited[i] = false
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    n = tickets.count
    visited = Array(repeating: false, count: n+3)
    ans = Array(repeating: "", count: n+1)
    result = [[String]]()

    sortedTickets = tickets.sorted { $0[1] < $1[1] }

    ans[0] = "ICN"
    dfs("ICN", 1)

    return result[0]
}
