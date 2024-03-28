//
//  [백준 11967] 불켜기.swift
//  Algorithm
//
//  Created by 김민 on 3/28/24.
//
// 백준 11967 불켜기 https://www.acmicpc.net/problem/11967

/*
[📌 전략]
 불은 켰지만 이동할 수 없는 지역도 추후에 인접한 칸 불이 켜지면 이동할 수 있다는 점을 주의해서 풀이해야 함.

[✅ 풀이]
 1. 불이 켜진 여부와 관계 없이 인접 칸이라 이동할 수 있음을 나타내는 canMove 배열 선언
    - canMove를 통해 추후에 불이 켜져 이동할 수 있을 경우 해당 칸으로 갈 수 있도록 함
 2. 큐에 (1,1) 을 담는다.
    - 이때 (1,1) 방은 불이 켜져 있고, 방문했음을 체크
    - 해당 큐는 불이 켜져 있어 이동을 완료한 좌표가 들어갈 것이다.
 3. dequeue한 좌표가 켤 수 있는 방의 모든 불을 켠다.
 4. dequeue한 좌표의 인접 칸을 탐색하여 canMove를 갱신한다.
 5. 전체 헛간을 탐색하며 불이 켜져 있고, 이동이 가능한 상태이며, 아직 방문하지 않았다면 방문 표시 후 큐에 넣는다.
 5. 3번부터 큐가 비워질 때까지 반복한다.

[📝 기록]
 추후에 재방문 할 수 있다는 것을 어떻게 풀어야 할까? 하고 하루도 넘게 고민했었는데, 이동할 가능성이 있을 때와 정말로 이동할 수 있는 경우를 분리하여 풀이할 수 있었다.
 정말 너무 어려운 문제였다... 꼭 다시 풀어봐야 함.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var lightPos = Array(repeating: Array(repeating: [(Int, Int)](), count: n+1), count: n+1)
var light = Array(repeating: Array(repeating: false, count: n+1), count: n+1)

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    lightPos[line[0]][line[1]].append((line[2], line[3]))
}

func switchOn(_ i: Int, _ j: Int) {
    lightPos[i][j].forEach {
        light[$0.0][$0.1] = true
    }
}

func bfs() {
    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    var visited = Array(repeating: Array(repeating: false, count: n+1), count: n+1)
    var canMove = Array(repeating: Array(repeating: false, count: n+1), count: n+1)

    var q = [(1, 1)]
    visited[1][1] = true
    light[1][1] = true
    canMove[1][1] = true

    while !q.isEmpty {
        let (x, y) = q.removeFirst()
        switchOn(x, y)

        // 이동할 수 있는 방 일단 체크
        for dir in dirs {
            let (nx, ny) = (x+dir.0, y+dir.1)
            if nx < 1 || nx > n || ny < 1 || ny > n { continue }
            canMove[nx][ny] = true
        }

        // 현재 좌표에서 켤 수 있는 불을 모두 켜고, 이동할 수 있으면 큐에 넣기
        for i in 1...n {
            for j in 1...n {
                if !light[i][j] || visited[i][j] || !canMove[i][j] { continue }
                visited[i][j] = true
                q.append((i, j))
            }
        }
    }
}

bfs()
print(light.flatMap { $0 }.filter { $0 }.count)
