//
//  [프로그래머스] 가장 먼 노드.swift
//  Algorithm
//
//  Created by 김민 on 9/26/24.
//
// 프로그래머스 가장 먼 노드 https://school.programmers.co.kr/learn/courses/30/lessons/49189

/*
[📌 전략]
 최단 경로로 이동했을 때의 간선 개수를 구하기
 -> 그래프를 상상해 보고, bfs로 차레로 탐색해 나가서 답을 구할 수 있음을 인지

[✅ 풀이]
 1. 인접 노드를 나타내는 그래프 g 배열 생성, ans 배열 생성
    - g[a]는 노드a의 인접 노드를 저장한 배열
    - ans[a]는 1부터 노드 a까지 간선 개수
    - ans 요소들의 초깃값은 -1로 설정
 2. bfs 탐색 실시
    - 노드1부터 가장 먼 노드를 구하는 것이므로 큐에 1 넣음, ans[1] = 0로 설정 -> -1과 구분하여 방문했음을 나타냄
    - 큐가 빌 때까지 계속해서 탐색
    - 가장 앞 요소(cur)를 dequeue하여 노드cur의 인접 노드(nxt) 순회
    - ans[nxt]가 0보다 크거나 같으면 방문한 노드이므로 continue
    - ans[nxt]가 -1로 아직 방문하지 않은 노드이면, ans[nxt]의 값을 ans[cur]+1 하여 간선 개수가 1개 늘어남을 표시
    - 큐에 노드nxt를 append하여 다시 탐색 실시
 3. 가장 먼 노드 구하기
    - bfs 탐색을 마친 후, ans의 max 값을 찾음
    - ans 중에 max 값을 가지는 요소의 개수를 출력
*/

var ans = [Int]()
var g = [[Int]]()

// 노드 1을 기준으로 bfs 실시
func bfs() {
    var q = [1]
    ans[1] = 0

    while !q.isEmpty {
        let cur = q.removeFirst()

        for nxt in g[cur] {
            if ans[nxt] >= 0 { continue }

            ans[nxt] = ans[cur] + 1
            q.append(nxt)
        }
    }
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    g = Array(repeating: [Int](), count: n+3)
    ans = Array(repeating: -1, count: n+3)

    // 인접한 노드 표현하는 그래프 생성
    for ed in edge {
        let (u, v) = (ed[0], ed[1])
        g[u].append(v)
        g[v].append(u)
    }

    // bfs 탐색
    bfs()

    // max 값을 구하고, max값과 동일한 요소의 개수를 반환
    var mx = ans.max()!
    var cnt = 0

    ans.forEach {
        if $0 == mx { cnt += 1 }
    }

    return cnt
}
