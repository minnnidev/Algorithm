//
//  [백준 14442] 벽 부수고 이동하기 2.swift
//  Algorithm
//
//  Created by 김민 on 2/5/24.
//
// 백준 14442 벽 부수고 이동하기 2 https://www.acmicpc.net/problem/14442

/*
[📌 전략]
bfs 문제이고, 벽을 부술 수 있는 횟수가 정해져 있다.
인접 칸 탐색 시에 해당 벽을 부술 수 있는지 없는지에 대해 판단해야 하기 때문에 현재까지 벽을 몇 번 부쉈는지에 대한 정보가 항상 필요하다.
또한 벽을 부순 횟수에 따라 각 위치에 도달하는 최단 거리를 구하기 위해, 벽을 부순 횟수로 구분한 2차원 배열 k개를 선언해야 함.

[✅ 풀이]
k번의 벽을 부숴 해당 위치까지 도달했을 때 최단 거리를 저장하는 distances 배열을 만든다.
bfs 탐색 실시한다.
큐에 저장하는 정보는 탐색을 시작할 위치(x, y)와 현재까지 벽을 부순 횟수(k)
큐를 순회하며, 큐에서 dequeue한 요소의 위치가 (N-1, M-1)일 경우, 최단 거리를 출력 후 함수를 return한다.
인접 칸을 탐색하여 인접칸이 범위 내에 있는지 체크한다.
인접 칸이 벽이 아닐 때는 그냥 이동할 수 있으므로 k를 유지하여 distances[k][nx][ny]에 1을 더하여 갱신
인접 칸이 벽일 때는, 벽을 더 부술 수 있고, 아직 k+1번 벽을 부숴 해당 위치에 도달하지 않았다면,
이동하여 distances[k+1][nx][ny]에 1을 더하여 갱신
이동에 성공하면 큐에 인접 칸의 위치와 인접 칸에 도달하기 위해 벽을 부순 위치를 큐에 enqueue

[📝 기록]
2206 벽 부수기에서 벽을 k번 부술 수 있다는 조건이 추가된 경우
*/

typealias elem = (x: Int, y: Int, k: Int)
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, K) = (line[0], line[1], line[2])
var matrix = Array(repeating: Array(repeating: "", count: M), count: N)
var distances = Array(repeating: Array(repeating: Array(repeating: -1, count: M), count: N), count: K+1)
var dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for i in 0..<N {
    matrix[i] = readLine()!.map { String($0) }
}

func bfs() {
    var q = [elem(x: 0, y: 0, k: 0)]
    var index = 0
    distances[0][0][0] = 1

    while index < q.count {
        let (x, y, k) = q[index]
        index += 1

        if x == N-1 && y == M-1 {
            print(distances[k][x][y])
            return
        }

        // 인접 방향 탐색
        for dir in dirs {
            let (nx, ny) = (x + dir.0, y + dir.1)
            // 인접 칸이 범위 내에 있지 않다면 다음 칸으로
            if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }

            // 인접 칸이 벽이 아니고, 벽을 k번 부숴 위치에 방문하지 않았을 경우
            if matrix[nx][ny] == "0" && distances[k][nx][ny] == -1 {
                q.append(elem(x: nx, y: ny, k: k))
                distances[k][nx][ny] = distances[k][x][y] + 1
                continue
            }

            /*
             인접 칸이 벽이어서 벽을 부순다고 가정했을 때,
             아직 부술 수 있는 횟수가 남았고, 1번 더 부쉈을 때 위치에 방문하지 않았을 경우
             */
            if matrix[nx][ny] == "1" && k < K && distances[k+1][nx][ny] == -1 {
                q.append(elem(x: nx, y: ny, k: k+1))
                distances[k+1][nx][ny] = distances[k][x][y] + 1
            }
        }
    }

    print(-1)
}

bfs()
