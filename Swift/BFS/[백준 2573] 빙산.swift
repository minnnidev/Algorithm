//
//  [백준 2573] 빙산.swift
//  Algorithm
//
//  Created by 김민 on 1/9/24.
//
// 백준 2573 빙산 https://www.acmicpc.net/problem/2573

/*
[📌 전략]
핵심적으로 구현해야 하는 것은 빙산을 녹이는 것과, 빙산의 덩어리 개수를 세는 것이다.
빙산을 녹이는 것은 하나의 빙산에 대하여 상하좌우 탐색을 실시하여 주변 바다 개수만큼 빙산을 1씩 녹이는 것이고,
빙산의 덩어리 개수는 bfs 탐색을 실시한 총 횟수가 된다.

[✅ 풀이]
빙산 덩어리 개수가 2개 이상이 될 때까지 진행해야 하므로, while문으로 구현한다.
while문 탈출 조건은 1. 빙산 덩어리가 2개 이상일 때 2. 빙산이 모두 녹았는데도 덩어리가 2개 이상이 안 되는 경우이다.

아직 방문하지 않은 빙산일 경우에 큐에 넣어 bfs 탐색을 시작한다.
큐에서 dequeue하여 해당 좌표를 기준으로 상하좌우 인접 칸을 탐색한다.
인접 칸이 아직 방문하지 않은 빙산이라면, 연결된 덩어리로 취급되므로 큐에 넣어 인접 칸 탐색을 준비한다.
인접 칸이 바다라면 기준 칸의 빙산을 녹이되 0이 될 때까지만 녹인다.
인접 칸을 방문 처리한다.
이를 큐가 빌 때까지 반복한다.

한번의 bfs 탐색이 끝나면 하나의 연결된 빙산 덩어리에 대한 탐색이 끝났다는 의미이므로 덩어리 개수에 1을 더한다.
그리고 다음 방문하지 않은 빙산을 찾아 또다른 빙산 덩어리에 대한 탐색을 시작한다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
var matrix = Array(repeating: Array(repeating: 0, count: M), count: N)
let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for i in 0..<N {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func bfs(_ i: Int, _ j: Int, _ tmp: [[Int]], _ visited: inout [[Bool]]) {
    var q = [(i, j)]
    visited[i][j] = true

    while !q.isEmpty {
        let (x, y) = q.removeFirst()

        // 상하좌우 탐색 실시
        for dir in dirs {
            let (nx, ny) = (x + dir.0, y + dir.1)

            if 0..<N ~= nx && 0..<M ~= ny {
                if tmp[nx][ny] > 0 && !visited[nx][ny] { // 아직 방문하지 않은 빙산인 경우 큐에 넣어 다음 탐색 준비
                    q.append((nx, ny))
                }

                if tmp[nx][ny] == 0 && matrix[x][y] > 0 { // 높이가 0보다 큰 빙산이고, 인접 칸이 바다인 경우
                    matrix[x][y] -= 1 // 1씩 녹인다
                }
                visited[nx][ny] = true
            }
        }
    }
}

var iceCount = 0
var yearCount = 0

while true {
    // 전부 다 녹았은 경우 탈출
    if matrix.flatMap({ $0 }).allSatisfy({ $0 == 0 }) {
        yearCount = 0
        break
    }

    iceCount = 0
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    let tmp = matrix

    for i in 0..<N {
        for j in 0..<M {
            // 아직 방문하지 않은 빙산일 경우 탐색 실시
            if !visited[i][j] && matrix[i][j] != 0 {
                bfs(i, j, tmp, &visited)
                iceCount += 1 // 한번의 bfs 탐색이 끝났다는 것은 하나의 빙산 덩어리 탐색이 끝났다는 뜻
            }
        }
    }

    // 덩어리가 2개 이상이면 탈출
    if iceCount >= 2 { break }
    yearCount += 1 // 1년씩 추가한다
}

print(yearCount)
