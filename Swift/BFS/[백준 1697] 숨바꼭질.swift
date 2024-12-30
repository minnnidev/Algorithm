//
//  [백준 1697] 숨바꼭질.swift
//  Algorithm
//
//  Created by 김민 on 12/28/23.
//
// 백준 1697 숨바꼭질 https://www.acmicpc.net/problem/1697

/*
수빈이와 동생의 위치가 주어질 때,
수빈이는 걸어서 +1칸, -1칸, 순간이동으로 2배 이동할 수 있음. 이때 수빈이가 동생을 찾을 수 있는 가장 빠른 시간은?

수빈이의 위치를 X라고 할 때, 수빈이의 다음 위치는 [X-1, X+1, X*2]
그리고 그 다음 가능한 위치도 각 위치에서 [X-1, X+1, X*2]을 한 값
-> 상하좌우로 BFS 탐색을 하는 것처럼 [X-1, X+1, X*2]을 탐색하여 이동할 수 있다면 도달할 수 있는 최소 거리를 저장하자

📌 주의할 점
수빈이와 동생의 위치가 0~100000 사이로 주어지기는 하지만, 수빈이는 계산 과정 중 음수로도, 100000 초과로도 갈 수는 있음
다만 음수로 가는 것과 +1을 여러번해서 100000을 넘어가는 건 무조건적으로 손해이다.
곱하기 2로 100000을 넘긴 뒤 -1을 여러번 하는 대신, -1을 먼저 여러번 하고 곱하기 2를 해줄 수 있다.
따라서 탐색 범위를 0~100000 사이로 잡아도 됨.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (line[0], line[1])
var distance = Array(repeating: -1, count: 100001)

func bfs() {
    var index = 0
    var q = [N]
    distance[N] = 0

    while index < q.count {
        let x = q[index]
        index += 1

        [x-1, x+1, x*2].forEach {
            /*
             범위 내에 있고, 방문하지 않았다면 시간 갱신
             이미 방문했다면, 그게 최소 방문 시간임
             */
            if 0..<100001 ~= $0 && distance[$0] == -1 {
                distance[$0] = distance[x] + 1
                q.append($0)
            }
        }

        // 동생이 있는 곳에 도달했을 때 함수 리턴
        if distance[K] != -1 { return }
    }
}

bfs()
print(distance[K])

