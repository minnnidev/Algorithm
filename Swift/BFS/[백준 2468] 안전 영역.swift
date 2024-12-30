//
//  [백준 2468] 안전 영역.swift
//  Algorithm
//
//  Created by 김민 on 1/4/24.
//
// 백준 2468 안전 영역 https://www.acmicpc.net/problem/2468

/*
비가 와서 물에 잠기지 않은 안전 영역의 개수를 구하는 문제.

비가 와서 잠기는 높이 기준은 따로 주어지지 않는다.
N의 최대가 100, 높이의 최대도 100이므로, 높이 기준에 따라 나타나는 안전 영역을 모두 구한 뒤 그중에서 최대를 구해도 되겠다고 생각했다.

높이 기준 정하기
지역의 높이들 중 최솟값보다 작은 경우에는, 어떤 지역도 물에 잠기지 않으므로 안전 영역의 개수가 1,
지역의 높이들 중 최댓값보다 큰 경우에는, 모든 지역이 물에 잠기므로 안전 영역의 개수가 0이다.

초기값을 0으로 하여, 원래 저장한 결과값보다 큰 값인 경우에 갱신하려고 한다.
따라서 높이 기준의 범위를 최솟값-1 이상 최댓값 이하로 잡았다.

하나의 높이 기준을 잡고, 안전 영역의 개수를 구해 보자.
기준 높이보다 높은 곳(잠기지 않은 영역)을 탐색 지점으로 선택한다.
큐에 enqueue한 뒤, 탐색을 위해 큐에서 dequeue한다.
상하좌우 방향으로 인접 칸을 탐색한다. 인접 칸의 높이 값이 기준 높이보다 높고, N*N 범위 내에 있다면 안전 영역이므로 방문한다.
이때는 인접 칸의 값을 h로 변경하여 방문했다는 표시를 한다.
다시 해당 칸에 대한 상하좌우 탐색을 위해 인접 칸을 enqueue한다.
큐가 비워질 때까지 반복하기!

한번의 bfs 탐색이 끝난 것은, 하나의 연결된 안전 영역 탐색이 끝났다는 것을 의미하므로 카운트한다.
하나의 높이 기준에 대한 안전 영역 개수를 저장하여, 다음 높이 기준에 대한 탐색 때 큰 값이면 갱신한다.
*/

let N = Int(readLine()!)!
var matrix = Array(repeating: [Int](), count: N)
var tmp = [[Int]]()
let directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]

for i in 0..<N {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func bfs(_ i: Int, _ j: Int, _ h: Int) {
    var q = [(i ,j)]

    while !q.isEmpty { // 큐가 비워질 때까지 반복
        let (x, y) = q.removeFirst()

        for direction in directions {
            let (nx, ny) = (x + direction.0, y + direction.1)

            // 범위 내에 있고 높이보다 크다면(잠기지 않고 방문하지 않았다면)
            if 0..<N ~= nx && 0..<N ~= ny && tmp[nx][ny] > h {
                q.append((nx, ny))
                tmp[nx][ny] = h // 방문 표시
            }
        }
    }
}

var result = 0
let flattenMatrix = matrix.flatMap { $0 }
let heights = Array(flattenMatrix.min()!-1...flattenMatrix.max()!)

for h in heights {
    var count = 0
    tmp = matrix
    for i in 0..<N {
        for j in 0..<N {
            if tmp[i][j] > h {
                bfs(i, j, h)
                count += 1
            }
        }
    }
    result = max(result, count) // 최댓값 갱신
}

print(result)
