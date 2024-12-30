//
//  [백준 1043] 거짓말.swift
//  Algorithm
//
//  Created by 김민 on 9/3/24.
//
// 백준 1043 거짓말 https://www.acmicpc.net/problem/1043

/*
[📌 전략]
 진실을 아는 사람들을 그래프 탐색으로 구하기

[✅ 풀이]
 1. 진실을 아는 사람들 입력받기 (0명일 때, 1명 이상일 때로 구분 필요)
 2. 진실을 아는 사람들로부터 진실을 듣는 사람들을 그래프 탐색으로 구함
    - 본인은 dfs로 풀이
    - visited 배열과 진실을 아는 사람을 처리하는 배열을 따로 구분
 3. 입력받은 파티들을 순회하며, 한명이라도 진실을 아는 사람이 있다면 과장된 이야기를 할 수 없음을 처리
    - flag를 두어, 한명이라도 진실을 안다면(해당 사람의 known 값이 true이면) 바로 탈출하고 최종 값에 더하지 않음
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var mx = 50

var people = readLine()!.split(separator: " ").map { Int($0)! }
var knowns = Array(repeating: false, count: mx+3) // 진실을 아는 사람을 판단할 배열
var visited = Array(repeating: false, count: mx+3)
var g = Array(repeating: [Int](), count: mx+3)
var parties = Array(repeating: [Int](), count: mx+3)

// 진실을 아는 사람들 입력받기
if people[0] != 0 {
    for i in 1..<people.count {
        knowns[people[i]] = true
    }
}

for i in 1...m {
    var line = readLine()!.split(separator: " ").map { Int($0)! }
    let cnt = line.removeFirst()
    parties[i] = line

    for j in 0..<cnt-1 {
        let (u, v) = (line[j], line[j+1])
        g[u].append(v)
        g[v].append(u)
    }
}

func dfs(cur: Int) {
    visited[cur] = true

    for nxt in g[cur] {
        if visited[nxt] { continue }

        knowns[nxt] = true
        dfs(cur: nxt)
    }
}

// dfs로 모든 사람을 순회하며 진실을 알게 되는지 여부 판단
for i in 1...n {
    if visited[i] { continue }

    if knowns[i] {
        dfs(cur: i)
    }
}

var result = 0

// 파티를 순회하여 특정 파티에서 한 명이라도 진실을 아는 사람이 없는지 체크
for i in 1...m {
    let party = parties[i]

    var flag = false

    for person in party {
        if knowns[person] {
            flag = true
            break
        }
    }

    if !flag { result += 1 }
}

print(result)

