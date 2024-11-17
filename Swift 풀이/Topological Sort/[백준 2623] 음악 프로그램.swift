//
//  [백준 2623] 음악 프로그램.swift
//  Algorithm
//
//  Created by 김민 on 9/2/24.
//
// 백준 2623 음악 프로그램 https://www.acmicpc.net/problem/2623 

/*
[📌 전략]
 가수의 출연 순서(노드)를 선형적으로 정렬 -> 위상 정렬로 풀이

[✅ 풀이]
 1. 그래프 정보(g) / 해당 인덱스 번호의 노드에 들어오는 간선 정보 입력(ind)
 2. ind가 0인 노드는 순서 상관없이 우선 정렬 가능하므로 큐에 저장
 3. 큐가 빌 때까지 반복
    - 맨 첫 요소를 dequeue
    - 해당 요소에서 이어지는 간선을 삭제 처리(목적지 노드의 ind 값을 1 감소시킴)
    - 목적지 노드의 ind 값이 0이 되면, 우선 정렬이 가능해지므로 큐에 enqueue
 4. 순서를 정하는 것이 불가능한 경우는 싸이클이 존재하는 경우
    - 이를 걸러내기 위해 최종 정렬한 값이 n개가 아닐 경우에는 0을 출력
    - 이외의 경우에는 최종 정렬한 값을 출력
[📝 기록]
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var g = Array(repeating: [Int](), count: n+3)
var ind = Array(repeating: 0, count: n+3)

for _ in 0..<m {
    var line = readLine()!.split(separator: " ").map { Int($0)! }

    for i in 1..<line.count-1 {
        let (u, v) = (line[i], line[i+1])

        g[u].append(v)
        ind[v] += 1
    }
}

var q = [Int]()
var result = [Int]()

for i in 1...n {
    if ind[i] == 0 {
        q.append(i)
    }
}

while !q.isEmpty {
    let cur = q.removeFirst()
    result.append(cur)

    for nxt in g[cur] {
        ind[nxt] -= 1

        if ind[nxt] == 0 { q.append(nxt) }
    }
}

if result.count != n {
    print(0)
} else {
    for num in result {
        print(num)
    }
}
