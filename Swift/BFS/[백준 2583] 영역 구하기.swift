//
//  [백준 2583] 영역 구하기.swift
//  Algorithm
//
//  Created by 김민 on 1/3/24.
//
// 백준 2583 영역 구하기 https://www.acmicpc.net/problem/2583

/*
그려지지 않은 직사각형을 기준으로 인접한 칸을 탐색해나가며 연결된 부분을 찾아 넓이를 구한다.

M*N 배열을 만들고, 모든 값을 0으로 초기화한다.
그려진 직사각형의 위치를 -1로 바꾼다.
입력받은 왼쪽 아래 (x1, y1)와 오른쪽 위 (x2, y2)를 통해 -1로 변경되는 범위는 x1<=x<x2, y1<=y<y2 사이의 모든 사각형이다.
M*N 배열을 순회하며, 그려지지 않은 사각형을 기준으로 인접한 칸을 탐색한다.
인접한 칸이 M*N 배열 범위 내에 존재하고, -1이 아닐 때는 그려지지 않은 사각형이므로 구하려는 영역에 포함할 수 있다.
탐색한 칸은 -1로 바꾸어 다시 탐색하지 않도록 한다.
bfs 탐색을 처음 실시하게 되는 칸의 개수가 분리되는 영역의 개수와 같다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (M, N, K) = (line[0], line[1], line[2])
var matrix = Array(repeating: Array(repeating: 0, count: N), count: M)
let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var count = 0
var areas = [Int]()

for _ in 0..<K {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let start = (line[0], line[1])
    let end = (line[2], line[3])

    // 왼쪽 아래 꼭짓점과 오른쪽 위 꼭짓점 범위 내에 있는 모든 사각형의 값을 -1로 변경
    for i in start.0..<end.0 {
        for j in start.1..<end.1 {
            matrix[j][i] = -1
        }
    }
}

func bfs(_ i: Int, _ j: Int) {
    var q = [(i, j)]
    var index = 0

    while index < q.count {
        // dequeue 대신 인덱스 값을 하나씩 뒤로 이동해 주는데, 이 index 값이 넓이 값과 같게 된다.
        let (x, y) = q[index]
        index += 1

        for dir in direction {
            let (nx, ny) = (x + dir.0, y + dir.1)

            // 범위 내에 있고, -1이 아닐 때(방문한 경우 혹은 사각형이 그려진 경우) 다시 인접 칸 탐색을 위해 큐에 넣어줌
            if 0..<M ~= nx && 0..<N ~= ny && matrix[nx][ny] != -1 {
                matrix[nx][ny] = -1
                q.append((nx, ny))
            }
        }
    }

    areas.append(index)
}

for i in 0..<M {
    for j in 0..<N {
        if matrix[i][j] == 0 {
            matrix[i][j] = -1
            bfs(i, j)
            count += 1
        }
    }
}

areas.sort()
print(count)
print(areas.map { String($0) }.joined(separator: " ")) // 정렬 후 각 요소들 사이 공백 포함하여 출력
