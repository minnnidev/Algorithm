//
//  [프로그래머스] 순위.swift
//  Algorithm
//
//  Created by 김민 on 10/25/24.
//
// 프로그래머스 순위 https://school.programmers.co.kr/learn/courses/30/lessons/49191

/*
[📌 전략]
 순위가 결정된다
 == 자신을 제외한 모든 노드와의 관계를 알 수 있다
 == 입력된 경기 결과에서 (승리 횟수 + 패배 횟수) == n-1 이다

[✅ 풀이]
 1. 입력된 경기 결과를 이긴 그래프 / 진 그래프로 나누어 그래프 배열 생성
 2. dfs 함수 생성
    - cur 노드를 기준으로, dfs를 통해 몇 명을 이겼는지 체크
    - cur 노드를 기준으로, dfs를 통해 몇 명에게 졌는지 체그
    -> 하나의 dfs 함수로 이긴 횟수, 진 횟수를 체크함
 3. 1~n까지 순회하며, 이긴 횟수와 진 횟수가 n-1이 되는 경우를 체크
*/

func dfs(_ cur: Int, _ visited: inout [Bool], _ g: [[Int]]) -> Int {
    visited[cur] = true
    var cnt = 0

    for nxt in g[cur] {
        if visited[nxt] { continue }

        visited[nxt] = true
        cnt += dfs(nxt, &visited, g) + 1
    }

    return cnt
}

func solution(_ n:Int, _ results:[[Int]]) -> Int {

    var winG = Array(repeating: [Int](), count: n+2)
    var loseG = Array(repeating: [Int](), count: n+2)
    var ans = 0

    for result in results {
        let win = result[0]
        let lose = result[1]

        winG[win].append(lose)
        loseG[lose].append(win)
    }

    for i in 1...n {
        var winVisited = Array(repeating: false, count: n+2)
        var loseVisited = Array(repeating: false, count: n+2)

        let winCnt = dfs(i, &winVisited, winG)
        let loseCnt = dfs(i, &loseVisited, loseG)

        if winCnt + loseCnt == n-1 { ans += 1 }
    }

    return ans
}
