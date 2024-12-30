//
//  [백준 5427] 불.swift
//  Algorithm
//
//  Created by 김민 on 1/2/24.
//
// 백준 5427 불 https://www.acmicpc.net/problem/5427

/*
불과 상근이 모두 동서남북 인접한 칸으로 이동할 수 있다. (단, 상근이는 불이 옮겨진 칸 또는 불이 붙으려는 칸으로는 이동할 수 없다.)
-> 불이 각 칸까지 번진 시간, 상근이가 각 칸으로 이동하는 데 걸리는 시간을 따로 탐색하기
-> 불이 해당 칸으로 번진 시간보다 상근이가 해당 칸으로 이동하려는 시간이 작다면 이동이 가능하다.

불에 대한 bfs 탐색을 수행하여 각 칸까지 불이 번지는 시간을 측정한다.
그후, 불이 해당 칸에 번진 시간보다 상근이가 해당 칸에 도착하는 시간이 작을 경우 이동할 수 있으므로 이때에는 이동한다.
이동 시에 가장자리에 도달하면 다음에 탈출할 수 있으므로, 해당 칸에 도착한 시간에 +1을 더해 출력한다.

불의 위치 탐색하기
처음에 입력받은 배열을 탐색하며 불의 위치를 전부 큐에 넣는다.
그리고 큐에서 하나씩 빼내며 입력받은 배열 범위 내에 있고, 방문하지 않았고, 벽이 아닐 때는 인접한 칸의 위치를 큐에 집어넣어 다음 탐색을 준비한다.
기준 칸의 값에 +1을 하여 인접 칸의 값을 갱신하여 인접 칸까지 불이 번지는 데 걸리는 시간을 나타낸다.
큐가 빌 때까지 반복한다.

상근이의 위치 탐색하기
처음에 입력받은 배열을 탐색하며 상근이의 위치를 큐에 넣는다
큐에서 빼내어 인접한 칸이 입력받은 배열 범위 내에 있고, 벽이 아니고,
방문하지 않았고, 불이 인접한 칸에 번진 시간보다 상근이가 인접한 칸으로 이동하는 시간이 적을 경우에는 이동할 수 있으므로 큐에 넣는다.
상근이가 원래 있던 기준 칸의 값에 +1을 하여 인접 칸까지 이동하는 데 걸리는 시간을 갱신한다.
상근이가 이동하려는 칸이 가장자리인 경우, 다음 이동 때 탈출할 수 있다.
*/

let T = Int(readLine()!)!
var matrix = [[Character]]()
var q = [(Int, Int)]()
var fireD = [[Int]]()
var sangD = [[Int]]()
let direction = [(-1, 0), (1, 0), (0, -1), (0, 1)]

// 불이 번진 시간을 탐색하는 bs
func fireBfs(_ h: Int, _ w: Int) {
    var index = 0

    while index < q.count {
        let (x, y) = q[index] // 큐에서 꺼내어 탐색한다
        index += 1

        for dir in direction {
            let (nx, ny) = (x + dir.0, y + dir.1)

            // 범위 내에 있고, 방문하지 않았고, 벽이 아닐 때는 큐에 집어 넣어 다음 탐색 준비
            if 0..<h ~= nx && 0..<w ~= ny && matrix[nx][ny] != "#" && fireD[nx][ny] == -1 {
                fireD[nx][ny] = fireD[x][y] + 1
                q.append((nx, ny))
            }
        }
    }
}

// 상근이의 위치를 탐색하는 bfs
func sangBfs(_ h: Int, _ w: Int) {
    var index = 0

    while index < q.count {
        let (x, y) = q[index]
        index += 1

        // 기준 칸이 가장자리에 있을 경우 1초가 지난 후 탈출 가능함
        if x == 0 || x == h - 1 || y == 0 || y == w - 1 {
            print(sangD[x][y] + 1)
            return
        }

        for dir in direction {
            let (nx, ny) = (x + dir.0, y + dir.1)

            // 벽이거나 방문한 경우 continue
            if matrix[nx][ny] == "#" || sangD[nx][ny] >= 0 { continue }
            // 상근이가 인접 칸까지 이동하는 시간이 불이 번진 시간보다 크거나 같은 경우
            if sangD[x][y] + 1 >= fireD[nx][ny] && fireD[nx][ny] != -1 { continue }

            // 이동하는 데 걸린 시간을 갱신하고 큐에 넣어준다
            sangD[nx][ny] = sangD[x][y] + 1
            q.append((nx, ny))
        }
    }

    // 여기까지 온 경우에는 탈출이 불가능한 경우
    print("IMPOSSIBLE")
}

for _ in 0..<T {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (w, h) = (line[0], line[1])
    matrix = Array(repeating: [Character](), count: h)
    fireD = Array(repeating: Array(repeating: -1, count: w), count: h)
    sangD = Array(repeating: Array(repeating: -1, count: w), count: h)
    q = [(Int, Int)]()

    for i in 0..<h {
        matrix[i] = readLine()!.map { $0 }
    }

    for i in 0..<h {
        for j in 0..<w {
            if matrix[i][j] == "*" {
                fireD[i][j] = 0
                q.append((i, j))
            }
        }
    }

    fireBfs(h, w)
    q.removeAll()

    for i in 0..<h {
        for j in 0..<w {
            if matrix[i][j] == "@" {
                sangD[i][j] = 0
                q.append((i, j))
            }
        }
    }

    sangBfs(h, w)
}
