//
//  [백준 2178] 미로 탐색.swift
//  Algorithm
//
//  Created by 김민 on 12/26/23.
//
// 백준 2178 미로 탐색

/*
다차원 배열에서의 거리 측정 -> bfs
(0,0)으로 bfs로 순회한다고 하자.
하나의 칸을 기준으로 인접한 상하좌우 칸을 탐색하면, 시작점-인접한 칸의 거리는 시작점-기준 칸 거리보다 한번 더 이동하므로 1아 크다.
이러한 성질을 사용하면 시작점과 연결된 모든 점으로의 최단 경로를 찾을 수 있다.

[풀이]
입력이 다른 문제와 달리 특이하다. 1과 0이 붙어서 입력되기 때문에 Int가 아닌 String 형식으로 받았다.
시작점으로부터의 거리를 저장할 d 배열을 만들고 -1로 초기화해 주었다.
-1로 초기하여 방문 여부를 판단하는 배열을 따로 만들지 않도록 했다.
시작점(0,0)을 큐에 넣는다. 그리고 큐가 비게 될 때까지 while문을 순회한다.
큐에서 요소를 하나 빼내어 상하좌우를 탐색하여,
1. 해당 요소가 배열 범위 내에 있고
2. 이동할 수 있고(1)
3. 아직 방문하지 않았다면(d의 해당 위치가 -1)
원래 칸의 거리에서 +1을 하여 인접 칸의 거리를 갱신한다.
그리고 큐에 넣어 큐가 빌 때까지 탐색을 반복한다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
var d = Array(repeating: Array(repeating: -1, count: M), count: N)
var matrix = Array(repeating: [Character](), count: N)

for i in 0..<N {
    matrix[i] = readLine()!.map { $0 }
}

var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]

func bfs() {
    var q = [(0, 0)]
    d[0][0] = 1

    while !q.isEmpty {
        let (x, y) = q.removeFirst()

        for i in 0..<4 {
            let (nx, ny) = (x + dx[i], y + dy[i])

            if 0..<N ~= nx && 0..<M ~= ny && matrix[nx][ny] == "1" && d[nx][ny] == -1 {
                d[nx][ny] = d[x][y] + 1
                q.append((nx, ny))
            }
        }
    }
}

bfs()
print(d[N-1][M-1])
