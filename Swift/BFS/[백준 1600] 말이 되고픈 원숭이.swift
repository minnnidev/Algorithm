//
//  [백준 1600] 말이 되고픈 원숭이.swift
//  Algorithm
//
//  Created by 김민 on 1/11/24.
//
// 백준 1600 말이 되고픈 원숭이 https://www.acmicpc.net/problem/1600

/*
[📝 기록]
개인적으로는 백준 2206 벽 부수고 이동하기 문제(https://www.acmicpc.net/problem/2206) 와 비슷하다는 생각이 들었다.

[📌 전략]
하나의 정점에는 능력을 사용하고 도달하는 방법, 능력을 사용하지 않고 인접 칸으로 도달하는 방법 총 2가지가 있다.
같은 정점이지만 방문하는 방법에 따라서 최소 횟수가 달라질 수 있다.
따라서 일반적인 bfs로 풀었을 때, 이미 방문한 정점이라 판단하여 그 정점을 다시 방문하지 않으면 최소 횟수임을 장담할 수 없다.
따라서 해당 정점까지 이동하는 거리를 능력을 몇 번 사용했는지에 따라 따로 저장해 두어야 한다.

=== case example ===
2
10 2
0 0 1 0 0 1 0 0 1 0
0 0 1 1 0 0 0 0 1 0

나는 이 예시를 통해 이해했는데, 일반적인 bfs로 풀면 맨 오른쪽 아래 정점에 도달할 수 없다고 나오지만, 해당 부분을 고려하여 풀이하면 답은 10이다.
따라서 생각해 볼 수 있는 핵심 전략은 다음과 같다.

1. distance 배열을 K+1개 생성하는 것(0<=K<=30) 혹은 31개를 미리 만들어 초기화하기
distance[k][x][y] -> 능력을 k번 사용하여 (x, y)까지 이동한 거리
distance[0][x][y] -> 능력을 0번 사용하여 (x, y)까지 이동한 거리
distance[1][x][y] -> 능력을 1번 사용하여 (x, y)까지 이동한 거리

2. 큐에 enqueue하는 형식
능력 사용 횟수에 대한 정보를 같이 enqueue하여 탐색 시에 활용할 수 있게 함

[✅ 풀이]
처음 출발은 (0,0)이므로 distance[0][0][0](능력을 0번 사용하여 (0, 0)까지 이동한 거리)를 0으로 설정하고 큐에 넣는다.

큐 안의 모든 요소에 대한 탐색이 끝날 때까지 반복한다. (while)
큐의 맨 첫 번째 요소의 이동 좌표 탐색을 시작한다. (x, y, k)
while문 탈출 조건은 큐의 맨 첫 번째 요소의 좌표가 맨 오른쪽 아래 좌표(H-1, W-1)일 때이다.

아직 능력을 사용할 수 있는 횟수가 남은 경우 능력을 사용하여 이동할 수 있는 좌표들을 구한다.
능력을 한번 사용하여 이동하므로 distance[k+1]번째 배열의 (x, y) 좌표의 값을 갱신해 준다.
distance[k][x][y]에서 1 이동한 것이므로, 갱신되는 값은 distance[k][x][y] + 1이다.

인접 칸에 대한 탐색은 항상 진행할 수 있다.
능력을 사용하지 않고 이동하므로 distance[k]번째 배열의 (x, y) 좌표의 값을 갱신해 준다.
distance[k][x][y]에서 1 이동한 것이므로, 갱신되는 값은 distance[k][x][y] + 1이다.

이동할 수 있는 칸은 (x, y, 이동한 뒤 능력 사용 횟수)로 큐에 enqueue하여 해당 좌표에서 다시 이동할 수 있는 좌표를 탐색할 수 있도록 준비한다.
*/

let K = Int(readLine()!)!
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (W, H) = (line[0], line[1])
var matrix = Array(repeating: Array(repeating: 0, count: W), count: H)
var distance = Array(repeating: Array(repeating: Array(repeating: -1, count: W), count: H), count: K+1)

for i in 0..<H {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let monkeyDx = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let horseDx = [(1, 2), (1, -2), (2, 1), (2, -1), (-1, 2), (-1, -2), (-2, 1), (-2, -1)]
var q = [(0, 0, 0)]
var index = 0
distance[0][0][0] = 0

func bfs() {
    while index < q.count {
        let (x, y, k) = q[index]
        let d = distance[k][x][y]
        index += 1

        if x == H - 1 && y == W - 1 { // 맨 아래 정점에 도달했을 때 탈출
            print(distance[k][H-1][W-1])
            return
        }

        if k < K { // 능력을 사용할 수 있는 횟수가 남은 경우
            for dx in horseDx {
                let (nx, ny) = (x + dx.0, y + dx.1)

                // 범위 내에 있지 않을 경우 continue
                if nx < 0 || nx >= H || ny < 0 || ny >= W { continue }
                // 능력을 k+1번을 사용하여 이미 방문하였거나 장애물일 경우 continue
                if distance[k+1][nx][ny] != -1 || matrix[nx][ny] == 1  { continue }

                distance[k+1][nx][ny] = d + 1 // 능력을 k+1번 사용하여 (nx, ny)에 도달하는 거리 갣신
                q.append((nx, ny, k+1)) // 다음 탐색 위해 큐에 넣기
            }
        }

        // 인접 칸은 매번 탐색 가능
        for dx in monkeyDx {
            let (nx, ny) = (x + dx.0, y + dx.1)

            // 범위 내에 있지 않을 경우 continue
            if nx < 0 || nx >= H || ny < 0 || ny >= W { continue }
            // 능력을 k번을 사용하여 이미 방문하였거나 장애물일 경우 continue
            if distance[k][nx][ny] != -1 || matrix[nx][ny] == 1  { continue }

            // 능력 사용 횟수가 늘어나지 않으므로 k번 사용하여 (nx, ny)에 도달하는 거리 갱신
            distance[k][nx][ny] = d + 1
            q.append((nx, ny, k)) // 다음 탐색 위해 큐에 넣기
        }
    }

    // 해당 줄에 왔다는 것은 맨 오른쪽 아래 칸에 도달하지 못했다는 뜻이므로 -1 출력
    print("-1")
}

bfs()
