//
//  [백준 11403] 경로 찾기.swift
//  Algorithm
//
//  Created by 김민 on 5/1/24.
//
// 백준 11403 경로 찾기 https://www.acmicpc.net/problem/11403

/*
[📌 전략]
 그래프 문제

[✅ 풀이]
 행으로 나타내진 각 정점을 모두 방문하여 정답을 구한다.
 한 정점 기준으로 인접 노드가 1이면 방문 처리를 하고 dfs(인접 노드)를 수행한다.
 이때 visited 배열을 전체 행렬에 대해서가 아닌 행 하나를 기준으로 만들어 시작 노드가 해당 노드로 갈 수 있는 길이 있는지를 구한다.

[📝 기록]
 어려운 문제가 아닌 게 분명한데 혼자 풀이하지 못했다. dfs 개념을 더 자세하게 봐야겠음.
*/


let n = Int(readLine()!)!
var matrix = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = Array(repeating: false, count: 102)

for i in 0..<n {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func dfs(_ v: Int) {
    for i in 0..<n {
        if !visited[i] && matrix[v][i] == 1 {
            visited[i] = true
            dfs(i)
        }
    }
}

for i in 0..<n {
    visited =  Array(repeating: false, count: 102)
    dfs(i)
    for j in 0..<n {
        if visited[j] { matrix[i][j] = 1 }
    }
}

matrix.forEach {
    print($0.map { String($0) }.joined(separator: " "))
}
