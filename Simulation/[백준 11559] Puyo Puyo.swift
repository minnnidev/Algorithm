//
//  [백준 11559] Puyo Puyo.swift
//  Algorithm
//
//  Created by 김민 on 2/25/24.
//
// 백준 11559 Puyo Puyo https://www.acmicpc.net/problem/11559

/*
[📌 전략]
 문제에서 주어진 순서대로
 터뜨릴 수 있는 뿌요 찾기 (상하좌우 탐색 -> bfs)
 하나의 뿌요에 대한 bfs 탐색 결과가 4개의 뿌요 이상이라면 터뜨리기 (좌표 이용하여 이동시키기)
 로직을 구현하면 된다.

[✅ 풀이]
 1. 입력받은 필드를 순회하며 뿌요일 때 bfs 탐색을 실시한다.
 인접 칸이 같은 색이고 범위 내에 있고, 아직 방문하지 않았다면 연결된 뿌요이므로 큐에 담고 다시 탐색 시작.
 큐를 모두 비웠을 때 탐색 결과가 4개 이상이면 해당 뿌요를 터뜨린다.
 전역 변수 isBoombed을 true로 변경하여 하나라도 연쇄되었다는 것을 나타내야 한다.
 2. 뿌요 터뜨리기
 탐색 결과 뿌요를 행 번호가 큰 순서대로 정렬하여 밑으로 밑으로 내리는 방식으로 구현했다.
 먼저 터뜨려야 하는 뿌요들을 x로 변경해 주고, 위에 있는 뿌요를 밑으로 이동시킨다.
 밑으로 이동하려는 행이 필드의 범위를 벗어났거나 뿌요가 존재하는 행일 경우 탈출하고, 이외의 경우는 행의 해당 위치끼리 바꿔가며 밑으로 이동한다.
 이동 후 남은 x들은 .으로 변경한다.
 3. 하나라도 연쇄되었다면 최종 답에 1을 더한다.
 더 이상 연쇄할 수 없으면 탈출하여 최종 답을 출력한다.
 
[📝 기록]
 풀릴 듯 말듯했지만 결국엔 스스로 풀지 못한 문제
 동시에 터뜨리는 것에 대한 로직이 처음부터 엉켰었던 것 같다.

*/

var matrix = Array(repeating: Array(repeating: "", count: 6), count: 12)
var visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
var answer = 0
var isBoombed = false

for i in 0..<12 {
    matrix[i] = readLine()!.map { String($0) }
}

func makeGroups(_ i: Int, _ j: Int) {
    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var q = [(i, j)]
    visited[i][j] = true
    var index = 0
    let color = matrix[i][j]

    while index < q.count {
        let (x, y) = q[index]
        index += 1

        for dir in dirs {
            let (nx, ny) = (x + dir.0, y + dir.1)

            if nx >= 12 || nx < 0 || ny >= 6 || ny < 0 { continue }
            if visited[nx][ny] { continue }

            if matrix[nx][ny] == color {
                q.append((nx, ny))
                visited[nx][ny] = true
            }
        }
    }

    if q.count >= 4 {
        isBoombed = true
        move(q)
    }
}


func move(_ arr: [(Int, Int)]) {
    let sortedPuyos = arr.sorted { $0.0 > $1.0}

    // 터뜨려야 하는 애들은 x로 변경
    for puyo in sortedPuyos {
        matrix[puyo.0][puyo.1] = "x"
    }

    // 위에 있는 뿌요들 이동시키기
    for i in (0..<11).reversed() {
        for j in 0..<6 {
            if matrix[i][j] == "." || matrix[i][j] == "x" { continue }

            var nx = i + 1

            while nx < 12 {
                let color = matrix[nx][j]
                if color == "R" || color == "G" || color == "B" || color == "P" || color == "Y" { break }

                matrix[nx][j] = matrix[nx-1][j]
                matrix[nx-1][j] = color

                nx += 1
            }
        }
    }

    // 남아 있는 x들은 점으로 변경해 주기
    for i in 0..<12 {
        for j in 0..<6 {
            if matrix[i][j] == "x" {
                matrix[i][j] = "."
            }
        }
    }
}

while true {
    visited = Array(repeating: Array(repeating: false, count: 6), count: 12)
    isBoombed = false

    for i in 0..<12 {
        for j in 0..<6 {
            if matrix[i][j] != "." && !visited[i][j] {
                makeGroups(i, j)
            }
        }
    }

    guard isBoombed else { break }
    answer += 1
}

print(answer)
