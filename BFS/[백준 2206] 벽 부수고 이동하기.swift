//
//  [백준 2206] 벽 부수고 이동하기.swift
//  Algorithm
//
//  Created by 김민 on 1/5/24.
//
// 백준 2206 벽 부수고 이동하기 https://www.acmicpc.net/problem/2206

/*
[📝 기록]
약 3시간을 고민했지만 결국 풀지 못해서 풀이를 찾아봤던 문제다.
일반적인 bfs 문제에 생각치도 못한 부분을 응용했어야 했던 문제라, 이제 bfs 문제에 조금은 적응이 됐구나 했던 나에게 깨달음을 준 문제였다.

[📌 전략]
핵심 부분은 2가지이다.
1. visited 배열을 2개 만드는 것
visited[x][y][0] -> 오는 길에 벽을 뚫지 않고 (x, y)에 왔을 때 걸린 거리
visited[x][y][1] -> 오는 길에 벽을 부수고 (x, y)에 왔을 때 걸린 거리

2. 다음 탐색을 위해 큐에 넣을 때 벽을 뚫었는지 여부도 포함하기
큐에 좌표만 넣는 것이 아니라 벽을 뚫었을 때는 1, 벽을 뚫었을 때는 0을 넣어
큐에서 해당 칸이 dequeue된 탐색 시에 해당 정보를 사용하도록 한다.

[✅ 풀이]
큐에 (0, 0, 0) -> (좌표, 벽을 부수지 않음)을 enqueue하고, visited[0][0][0]을 1로 변경한다.

이제 큐에서 dequeue를 하며 탐색을 시작하자. 이때 큐에서 dequeue한 값은 기준 칸의 좌표와 벽을 뚫었는지의 여부이다. (x, y, w)
해당 칸의 인접 칸을 탐색하며, 일단 인접 칸들이 배열 범위 내에 있는지 확인한다.
범위 내에 있다면, 인접 칸의 값을 살펴보자.

1. 인접 칸의 값이 0이고 아직 방문하지 않았다면(w의 값과는 관련 없다), visited[w][nx][ny]를 visited[w][x][y] + 1로 갱신해 준다. (1칸 이동한다는 의미)
   큐에는 인접 칸의 좌표와 기준 칸의 w값을 그대로 넣어준다.
2. 인접 칸이 벽인데, 아직 벽을 부수지 않았다면, visited[1][nx][ny]를 visited[0][x][y] + 1로 갱신해 준다. (벽을 부수고 1칸 이동한다는 의미)
   큐에는 인접 칸의 좌표와 벽을 부쉈으므로 w는 1로 넣어준다.
큐에 enqueue해줌으로써 다음 bfs 탐색을 준비하도록 한다.

탐색 중 dequeue한 좌표가 (N-1, M-1)이면 해당 위치의 값을 출력하고, 큐 안에 있는 모든 요소들의 탐색이 끝났음에도 도달하지 못했다면 -1을 출력한다.

visited 배열이 2개이지만 큐에 벽을 부쉈는지 여부(w)에 대한 정보를 같이 넣어줌으로써, 한번에 bfs 탐색을 할 수 있다.
또한 visitied 배열을 분리함으로써 방문 여부가 벽을 부순 경우와 부수지 않은 경우가 겹치지 않는다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
var matrix = Array(repeating: [Character](), count: N)
var visited = Array(repeating: Array(repeating: Array(repeating: -1, count: M), count: N), count: 2)
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

for i in 0..<N {
    matrix[i] = readLine()!.map { $0 }
}

func bfs() {
    var q = [(0, 0, 0)]
    var index = 0
    visited[0][0][0] = 1

    while index < q.count {
        let (w, x, y) = q[index]
        index += 1

        if x == N - 1 && y == M - 1 {
            print(visited[w][x][y])
            return
        }

        for direction in directions {
            let (nx, ny) = (x + direction.0, y + direction.1)

            if 0..<N ~= nx && 0..<M ~= ny {
                if matrix[nx][ny] == "0" && visited[w][nx][ny] == -1 {
                    visited[w][nx][ny] = visited[w][x][y] + 1
                    q.append((w, nx, ny))
                } else if matrix[nx][ny] == "1" && w == 0 {
                    visited[1][nx][ny] = visited[0][x][y] + 1
                    q.append((1, nx, ny))
                }
            }
        }
    }

    print("-1")
}

bfs()
