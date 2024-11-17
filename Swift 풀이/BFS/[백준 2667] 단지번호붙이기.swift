//
//  [백준 2667] 단지번호붙이기.swift
//  Algorithm
//
//  Created by 김민 on 1/3/24.
//
// 백준 2667 단지번호붙이기 https://www.acmicpc.net/problem/2667

/*
연결된 집의 모임인 단지의 개수를 구하고 각 단지에 포함된 집의 개수를 구하기.
집이 있는 경우는 N*N 배열에서 1로 표현되며, 상하좌우로 연결된다.

N*N 배열을 순회하며 1일 때(집이 있는 곳일 때)는 큐에 집어넣어 인접한 칸이 집인지 아닌지 탐색한다.
이전에 방문하지 않은 집인 경우에는 큐에 해당 칸을 넣어 해당 칸을 기준으로 인접한 칸을 다시 탐색하도록 한다.
해당 칸의 값은 방문했다는 것을 나타내기 위해 0으로 바꿔준다.
큐가 비워질 때까지 반복하며, 큐가 모두 비워졌을 때는 하나의 단지에 대한 탐색이 끝났단 의미이다.
*/

let N = Int(readLine()!)!
var matrix = Array(repeating: [Character](), count: N)
let directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]
var count = 0
var houses = [Int]()

for i in 0..<N {
    matrix[i] = readLine()!.map { $0 }
}

func bfs(_ i: Int, _ j: Int) {
    var q = [(i, j)]
    matrix[i][j] = "0"
    var index = 0

    // 큐를 dequeue하는 것을 index를 1씩 증가시키는 것으로 구현했는데, 이는 단지 내 집 개수와 같다
    while index < q.count {
        let (x, y) = q[index]
        index += 1

        for direction in directions {
            let (nx, ny) = (x + direction.0, y + direction.1)

            // 배열 범위 내에 있고, 인접한 칸이 1일 때(방문하지 않은 집일 때)는 큐에 집어 넣어 다시 연결된 집 탐색 준비.
            // 방문했다는 표시로 0으로 바꿔준다
            if 0..<N ~= nx && 0..<N ~= ny && matrix[nx][ny] == "1" {
                matrix[nx][ny] = "0"
                q.append((nx, ny))
            }
        }
    }

    houses.append(index)
}

for i in 0..<N {
    for j in 0..<N {
        if matrix[i][j] == "1" {
            bfs(i, j)
            count += 1 // bfs 탐색을 실시한다는 것은 하나의 단지에 대한 탐색을 의미한다
        }
    }
}

houses.sort()
print(count)
print(houses.map { String($0 )}.joined(separator: "\n")) // 단지 내 아파트 개수를 담은 배열을 정렬 후 줄바꿈하여 출력
