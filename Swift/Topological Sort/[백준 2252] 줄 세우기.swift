//
//  [백준 2252] 줄 세우기.swift
//  Algorithm
//
//  Created by 김민 on 8/28/24.
//
// 백준 2252 줄 세우기 https://www.acmicpc.net/problem/2252

/*
[📌 전략]
 문제에 주어진 조건 -> 줄세우기 -> 위상 정렬 활용

[✅ 풀이]
 1. 각 정점에 대한 그래프 정보 입력과 indegree 배열(해당 정점으로 들어오는 간선의 수) 만들기
 2. indegree가 0인 정정들 먼저 큐에 넣어주기. 0인 정점들 중 아무거나 먼저 와도 상관없기 때문
 3. 큐에 요소가 존재할 때 무한 반복
    - 큐에는 indegree가 0인 정점만 들어감
    - 큐의 기준 요소의 인접 정점들은 큐의 기준 요소에서 보낸 간선을 없는 것으로 처리 -> ind[인접정점] - 1
    - indegree가 0이 된 경우 큐에 삽입
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var g = Array(repeating: [Int](), count: n+2)
var ind = Array(repeating: 0, count: n+2)
var q = [Int]()
var result = ""

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (line[0], line[1])

    g[a].append(b)
    ind[b] += 1
}

// indegree가 0인 정점 찾기
for i in 1...n {
    if ind[i] == 0 {
        q.append(i)
    }
}

while !q.isEmpty {
    let cur = q.removeFirst()
    result += "\(cur) "

    for nxt in g[cur] {
        ind[nxt] -= 1

        if ind[nxt] == 0 { q.append(nxt) }
    }
}

print(result)
