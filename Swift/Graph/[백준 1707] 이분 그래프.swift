//
//  [백준 1707] 이분 그래프.swift
//  Algorithm
//
//  Created by 김민 on 5/15/24.
//
// 백준 1707 이분 그래프 https://www.acmicpc.net/problem/1707

/*
[📌 전략]
 이분 그래프의 개념을 알고 이분 그래프인지를 판단하면 되는 문제
 이분 그래프란 인접한 정점끼리 서로 다른 색으로 칠하여 모든 정점을 두 가지 색으로만 칠할 수 있는 그래프
 -> 정점들을 색별로 분리하여 2개의 집합으로 나누었을 때 집합 내에 간선이 존재해선 안 된다.
*/

/*
 [✅ 풀이1]
 1. 색을 칠하는 bfs 함수 -> 인접한 정점은 각각 다른 색으로 칠하기
 2. 한 집합 내에 간선이 존재하는지 탐색

 2단계로 구별하여 풀이하였고, 아슬아슬하게 시간 초과가 나지 않은 듯.
 */
let t = Int(readLine()!)!
var v = 0, e = 0
var g = [[Int]]()
var set = [Int]()
var visited = [Bool]()

// 집합 만들기
func makeGroup(_ v: Int, _ s: Int) {
    var q = [(v, s)]

    while !q.isEmpty {
        let f = q.removeFirst()

        for nxt in g[f.0] {
            if set[nxt] != 0 { continue }

            set[nxt] = -f.1
            q.append((nxt, -f.1))
        }
    }
}

// 한 집합 내에 간선이 존재하는지 탐색
func isBipartiteGraph() -> Bool {
    for i in 1...v {
        for nxt in g[i] {
            if set[nxt] == set[i] { return false }
        }
    }
    return true
}

for _ in 0..<t {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    v = line[0]
    e = line[1]
    g = Array(repeating: [Int](), count: v+1)
    set = Array(repeating: 0, count: v+1)
    visited = Array(repeating: false, count: v+1)

    for _ in 0..<e {
        let nums = readLine()!.split(separator: " ").map { Int($0)! }
        let (s, d) = (nums[0], nums[1])
        g[s].append(d)
        g[d].append(s)
    }

    for i in 1...v {
        if set[i] != 0 { continue }
        makeGroup(i, 1)
    }

    print(isBipartiteGraph() ? "YES" : "NO")
}

/*
 [✅ 풀이2]
 dfs로 그래프를 탐색하면서 풀이1의 1단계+2단계를 한번에 탐색하며 이분 그래프인지 판단하기
 아직 방문하지 않은 정점일 때는 다른 색으로 칠하고,
 방문한 정점인데 색이 인접한 노드와 같은 경우에는 이분 그래프가 아니라고 판단하며 바로 리턴함으로써 시간 단축
 */
//let t = Int(readLine()!)!
//var v = 0, e = 0
//var g = [[Int]]()
//var set = [Int]()
//var visited = [Bool]()
//var result = true
//
//func dfs(_ v: Int) {
//    visited[v] = true
//
//    for nxt in g[v] {
//        if !visited[nxt] {
//            set[nxt] = -set[v]
//            dfs(nxt)
//        } else if set[nxt] == set[v] {
//            result = false
//            return
//        }
//    }
//}
//
//for _ in 0..<t {
//    let line = readLine()!.split(separator: " ").map { Int($0)! }
//    v = line[0]
//    e = line[1]
//    g = Array(repeating: [Int](), count: v+1)
//    set = Array(repeating: -1, count: v+1)
//    visited = Array(repeating: false, count: v+1)
//    result = true
//
//    for _ in 0..<e {
//        let nums = readLine()!.split(separator: " ").map { Int($0)! }
//        let (s, d) = (nums[0], nums[1])
//        g[s].append(d)
//        g[d].append(s)
//    }
//
//    for i in 1...v {
//        if !result { break }
//        dfs(i)
//    }
//
//    print(result ? "YES" : "NO")
//}
