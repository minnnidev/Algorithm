//
//  [백준 16920] 확장 게임.swift
//  Algorithm
//
//  Created by 김민 on 3/7/24.
//
// 백준 16920 확장 게임 https://www.acmicpc.net/problem/16920

/*
[📌 전략]
bfs로 인접칸을 탐색하여 성을 지을 수 있는지 판단한다.
주의할 점은 Si칸만큼 이동하는 경로 내에 있는 모든 곳에는 성을 지을 수 있다는 점.
(Si칸 이내에 있다면 방향을 바꿀 수 있다.)

[✅ 풀이]
하단 코드와 함께 설명
*/
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, p) = (line[0], line[1], line[2])
let arrS = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var board = Array(repeating: Array(repeating: "", count: m), count: n)
var q = Array(repeating: [(Int, Int)](), count: 10) // p의 개수만큼의 q를 만들어 준다.
var result = Array(repeating: 0, count: 10)
var visited =  Array(repeating: Array(repeating: false, count: m), count: n)

for i in 0..<n {
    let line = readLine()!.map { String($0) }
    board[i] = line

    // input에서 성일 때는 해당 큐에 성의 좌표를 넣어준다
    for j in 0..<m where line[j] != "." && line[j] != "#" {
        let p = Int(line[j])!
        q[p].append((i, j))
        result[p] += 1
        visited[i][j] = true

    }
}

var dirs = [(-1, 0), (1, 0), (0, 1), (0, -1)] // 인접방향 탐색
func bfs(_ p: Int) { // p번의 성을 지을 위치 탐색
    let s = arrS[p] // 플레이어 p가 이동할 수 있는 칸 수
    var tmpQ = [(Int, Int, Int)]()
    // 원래 성의 큐에 있던 좌표들과 이동한 칸 수를 저장할 배열 tmpQ - 현재는 0칸 이동으로 0으로 넣어줌
    q[p].forEach { tmpQ.append(($0.0, $0.1, 0)) }
    q[p].removeAll() // q[p]를 빈 배열로 만들어 다음 턴에 지을 성에 대비

    // bfs 탐색 실시
    var index = 0
    while index < tmpQ.count {
        let (x, y, k) = tmpQ[index]
        index += 1

        for dir in dirs {
            let (nx, ny) = (x+dir.0, y+dir.1)

            if nx < 0 || nx >= n || ny < 0 || ny >= m { continue } // 인접칸이 범위 내에 있지 않다면 continue
            if visited[nx][ny] { continue } // 이미 방문했다면 continue
            if k+1 > s { continue } // 이동했을 때 s보다 커진다면 continue

            if board[nx][ny] == "." { // 빈칸일 때는 성을 짓는다
                board[nx][ny] = "\(p)"
                tmpQ.append((nx, ny, k+1))
                visited[nx][ny] = true

                // s칸 이동했을 때는 q[p]에 넣어 다음 턴 대비
                if k+1 == s { q[p].append((nx, ny)) }

                isChanged = true
                result[p] += 1 // 플레이어 p의 성 개수 업데이트
            }
        }
    }
}

var isChanged = false
while true {
    isChanged = false
    for i in 1...p { // 플레이어 1~p를 순회하며 차례로 bfs 탐색을 실시한다
        bfs(i)
    }
    if !isChanged { break } // 더이상 확장할 수 없다면 탈출
}

print(result[1...p].map { String($0) }.joined(separator: " "))
