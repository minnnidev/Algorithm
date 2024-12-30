//
//  [백준 7562] 나이트의 이동.swift
//  Algorithm
//
//  Created by 김민 on 1/2/24.
//
// 백준 7562 나이트의 이동 https://www.acmicpc.net/problem/7562

/*
나이트의 이동 방향이 정해져 있고, 나이트가 이동하려는 칸까지의 최소 이동 횟수 구하기
-> bfs 탐색을 이용하여 최종 목적지까지 탐색하는 횟수를 구한다

탐색해야 할 칸이 바로 인접한 칸이 아니라, 여섯 칸을 가로 질러가는 대각선이라는 것과 총 8방향이라는 것이 주의할 점

-1로 초기화한 L*L 배열을 만든다. 큐를 하나 만들어 출발지 위치를 인큐해 준다.
출발지에서 bfs 탐색을 실시하고, 출발지 칸의 값을 0으로 바꾼다. (출발지 - 출발지의 최소 이동 횟수는 0이라는 의미를 가진다.)
큐에 들어 있는(현재는 출발지 위치) 인덱스를 꺼내어 8방향을 탐색한다.
L*L 배열 안에 있고, 값이 -1이면 아직 방문하지 않았다는 의미므로 큐에 넣어준다.
큐에 인큐해줌으로써 해당 칸을 기준으로 8방향의 탐색을 다시 진행할 수 있다.
탐색의 기준 칸이 되었던 값에 +1을 하여 해당 이동 칸까지 이동한 횟수를 갱신한다.
큐가 비워질 때까지 반복한다.
목적지 칸의 위치가 -1에서 다른 값으로 변경되면, 이동이 완료되었다는 의미로 현재 값을 출력하고 함수를 리턴한다.
*/

let T = Int(readLine()!)!
var matrix = [[Int]]()
let dir = [(1, 2), (1, -2), (2, 1), (2, -1), (-1, 2), (-1, -2), (-2, 1), (-2, -1)]

func bfs(_ start: (Int, Int), _ goal: (Int, Int), size L: Int) {
    let (i, j) = start
    var q = [(i, j)]
    matrix[i][j] = 0
    var index = 0

    while index < q.count {
        let (x, y) = q[index]
        index += 1

        if matrix[goal.0][goal.1] != -1 { // 초기값에서 값이 변경되었다면 리턴
            print(matrix[goal.0][goal.1])
            return
        }

        dir.forEach { // 8방향 탐색
            let (nx, ny) = (x + $0.0, y + $0.1)

            // 범위 내에 있고 아직 방문하지 않았다면 탐색한다
            if 0..<L ~= nx && 0..<L ~= ny && matrix[nx][ny] == -1 {
                matrix[nx][ny] = matrix[x][y] + 1 // 이동 횟수 갱신
                q.append((nx, ny))
            }
        }
    }
}

for _ in 0..<T {
    let L = Int(readLine()!)!
    matrix = Array(repeating: Array(repeating: -1, count: L), count: L)
    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let goal = readLine()!.split(separator: " ").map { Int($0)! }

    bfs((start[0], start[1]), (goal[0], goal[1]), size: L)
}
