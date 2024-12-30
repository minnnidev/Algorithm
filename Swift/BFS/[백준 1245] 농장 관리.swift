//
//  [백준 1245] 농장 관리.swift
//  Algorithm
//
//  Created by 김민 on 10/2/24.
//
// 백준 1245 농장 관리 https://www.acmicpc.net/problem/1245

/*
[📌 전략]
 인접한 칸을 탐색 -> bfs로 접근

[✅ 풀이]
 1. 방문하지 않은 2차원 배열의 모든 요소에서 bfs 탐색을 실시함
 2. bfs 탐색 (x, y)부터 시작
    - 산봉우리의 인접한 격자가 산봉우리 높이보다 큰지를 판단하는 변수 flag 선언
    - 인접한 8개(가로, 세로, 대각선) 칸을 방문 -> 인접 칸은 (nx, ny)
    - (nx, ny)가 유효한 범위인지 체크
    - matrix[nx][ny] > matrix[x][y]이면 산봉우리 조건 만족하지 않음 -> flag를 true로 바꾸어 조건 체크
    - (nx, ny)에 방문한 적이 있다면 넘어감
    - matrix[nx][ny]와 matrix[x][y] 값이 같으면 같은 높이이므로 큐에 넣어줌
        - 이미 flag가 true여도(산봉우리 조건을 만족하지 않더라도) 같은 높이인 경우는 모두 찾고 visited 값을 변경해 줌
    - 한 높이의 bfs 탐색이 끝나면, flag가 false일 때는 산봉우리 최종 개수에 추가
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var matrix = Array(repeating: [Int](), count: n)
var visited = Array(repeating: Array(repeating: false, count: m+3), count: n+3)
var ans = 0

for i in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    matrix[i] = line
}

var dirs = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]

func bfs(_ i: Int, _ j: Int) {
    var q = [(i, j)]
    visited[i][j] = true

    var flag = false // 산봉우리의 인접한 격자가 산봉우리 높이보다 큰지를 판단하는 변수

    while !q.isEmpty {
        let f = q.removeFirst()
        let (x, y) = (f.0, f.1)

        for dir in dirs {
            let (nx, ny) = (x + dir.0, y + dir.1)

            if nx >= n || nx < 0 || ny >= m || ny < 0 { continue }
            if matrix[nx][ny] > matrix[x][y] { flag = true }
            if visited[nx][ny] { continue }

            if matrix[nx][ny] == matrix[x][y] {
                visited[nx][ny] = true
                q.append((nx, ny))
            }
        }
    }

    if !flag { ans += 1 }
}

for i in 0..<n {
    for j in 0..<m {
        if visited[i][j] { continue }

        bfs(i, j)
    }
}

print(ans)
