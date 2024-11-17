//
//  [백준 1325] 효율적인 해킹.swift
//  Algorithm
//
//  Created by 김민 on 7/11/24.
//
// 백준 1325 효율적인 해킹 https://www.acmicpc.net/problem/1325

/*
[📌 전략]
 포인트:  A가 B를 신뢰한다 == B를 해킹하면, A도 해킹할 수 있다
 무방향 그래프가 아니라 B -> A 로 향하는 방향 그래프이다.
 dfs로 계속 풀이하다 시간 초과 나서 재귀 방식 대신 큐를 사용하는 bfs로 풀이했더니 시간 초과 x

[✅ 풀이]
 1. B -> A 로 향하는 방향 그래프를 구현해 준다.
 2. 각 노드를 돌며 bfs로 연결된 정점 모두 탐색
 3. 각 노드의 최대 해킹 가능 컴퓨터 수를 비교하여 최댓값들의 정점 번호 출력

[📝 기록]
 빠른 입출력(FileIO)를 사용하면 시간 단축 가능
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])

var g = Array(repeating: [Int](), count: n+2)
var cntArr = Array(repeating: 0, count: n+2)

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }

    g[line[1]].append(line[0])
}

func bfs(_ v: Int) -> Int {
    var visited = Array(repeating: false, count: n+2)
    var q = [v]
    var cnt = 0
    var idx = 0

    visited[v] = true

    while idx < q.count {
        let f = q[idx]
        idx += 1

        for nxt in g[f] {
            if visited[nxt] { continue }

            visited[nxt] = true
            cnt += 1
            q.append(nxt)
        }
    }

    return cnt
}

for num in 1...n {
    let cnt = bfs(num)
    cntArr[num] = cnt
}

let mx = cntArr.max()!
var ans = ""

for i in 1...n {
    if cntArr[i] == mx {
        ans += "\(i) "
    }
}

print(ans)
