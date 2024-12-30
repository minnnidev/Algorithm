//
//  [백준 10026] 적록색약.swift
//  Algorithm
//
//  Created by 김민 on 12/29/23.
//
// 백준 10026 적록색약 https://www.acmicpc.net/problem/10026

/*
N*N 배열에 R, G, B가 주어지고, 같은 색상이 상하좌우로 인접한 경우에 같은 구역에 속할 때 총 구역의 개수는?
-> 인접한 같은 색상이 모여 있는 구역의 개수를 구하기 위해서 bfs 탐색하기

적록색약은 빨간색과 초록색의 차이를 거의 느끼지 못한다.
-> 입력받을 배열에서 R을 G로 변경해 주고 똑같이 bfs 탐색하여 총 구역 개수 구함

입력받은 배열을 순회한다.
방문하지 않은 색상일 때는 큐에 넣고 해당 위치에서부터 인접한 곳에 같은 색이 있는지 탐색하면 된다.
큐에서 하나를 dequeue하여 해당 인덱스를 기준으로 인접한 칸 탐색을 한다.
인접한 칸에 같은 색상이 존재한다면, 큐에 넣고 방문했다는 표시를 한다.
큐가 모두 비워질 때까지 탐색을 반복하고, 큐가 비워졌다는 것은 한 구역이 끝났다는 것을 의미한다.
*/

let N = Int(readLine()!)!
var matrix1 = Array(repeating: [Character](), count: N)
var visitied = Array(repeating: Array(repeating: false, count: N), count: N)
let direction = [(-1, 0), (0, -1), (0, 1), (1, 0)]
var result = [0, 0]

for i in 0..<N {
    matrix1[i] = readLine()!.map { $0 }
}

// R -> G로 바꾸는 방법
// 1. 이중 for문을 돌며 R인 것을 G로 바꿔준다
var matrix2 = matrix1
for i in 0..<N {
    for j in 0..<N {
        if matrix1[i][j] == "R" {
            matrix2[i][j] = "G"
        }
    }
}

// 2. map을 사용하여 고차함수로 표현한 것
//var matrix2 = matrix1.map { $0.map { $0 == "R" ? "G" : $0 }}

// 3. replacingOccurrences 사용하기 (matrix를 [String]으로 선언해야 하고, Foundation import 필요)
//for i in 0..<N {
//    let line = readLine()!
//    matrix1[i] = line.map { String($0) }
//    matrix2[i] = line.replacingOccurrences(of: "R", with: "G").map { String($0) }
//}

func bfs(_ i: Int, _ j: Int, _ matrix: inout [[Character]]) {
    var q = [(i, j)]

    var index = 0
    while index < q.count {
        let (x, y) = q[index]
        visitied[x][y] = true
        index += 1

        direction.forEach {
            let (nx, ny) = (x + $0.0, y + $0.1)

            // 배열 범위 내에 있고, 기준 색상과 인접한 칸의 색상이 같고, 아직 방문하지 않았다면 큐에 집어넣고 방문했다고 표시
            if 0..<N ~= nx && 0..<N ~= ny && matrix[x][y] == matrix[nx][ny] && !visitied[nx][ny] {
                q.append((nx, ny))
                visitied[nx][ny] = true
            }
        }
    }
}

// 적록색약이 아닐 경우
for i in 0..<N {
    for j in 0..<N {
        // 방문하지 않은 색상은 인접칸 탐색을 실시한다
        if !visitied[i][j] {
            bfs(i, j, &matrix1)
            result[0] += 1
        }
    }
}

// 방문 배열을 초기화해 준다
visitied = Array(repeating: Array(repeating: false, count: N), count: N)

// 적록색약일 경우
for i in 0..<N {
    for j in 0..<N {
        // 방문하지 않은 색상은 인접칸 탐색을 실시한다
        if !visitied[i][j] {
            bfs(i, j, &matrix2)
            result[1] += 1
        }
    }
}

print(result[0], result[1])
