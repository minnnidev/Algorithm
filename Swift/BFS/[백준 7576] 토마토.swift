//
//  [백준 7576] 토마토.swift
//  Algorithm
//
//  Created by 김민 on 12/27/23.
//
// 백준 7576 토마토 https://www.acmicpc.net/problem/7576

/*
창고에 보관된 토마토들이 모두 익는 데 걸리는 최소 일수를 구하기

익은 토마토는 하루마다 상하좌우의 인접한 토마토를 익힌다
-> BFS 탐색

하루마다 익은 토마토가 인접한 토마토를 익힌다는 것은 1인 토마토 전부가 각자의 인접한 토마토를 익힌다는 것과 같다.
따라서 한번에 큐에 집어넣은 뒤 bfs 탐색을 실시한다.
인접한 토마토를 익힐 때는 각 기준 토마토의 값에 +1을 해 주어 해당 토마토를 익히는 데 필요한 최소 일수로 값을 변경한다.
맨 처음 1인 토마토에서 시작하게 되므로, 마지막 최소 일수를 구할 땐 토마토 배열의 최댓값에 1을 뺀 값을 출력한다.
bfs 탐색을 실시한 뒤에도 0인 토마토가 남아 있다면 더이상 익히는 것이 불가능하다는 의미이므로 -1을 출력한다.

📌 시간 초과
처음 풀이에서는 removeFirst()를 사용하여 dequeue하는 방식을 사용하였는데, removeFirst()를 사용할 시에 맨앞 원소를 삭제하고,
그뒤 요소들을 앞으로 이동시키기 때문에 시간 초과가 발생한다.
따라서 index 변수를 사용하여 요소를 삭제하는 대신 인덱스를 증가하는 방법으로 변경했다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (M, N) = (line[0], line[1]) // M - 가로 칸 수, N - 세로 칸 수
var tomatoes = Array(repeating: [Int](), count: N)
var dx = [1, -1, 0, 0]
var dy = [0, 0, -1, 1]
var q = [(Int, Int)]()

for i in 0..<N {
    tomatoes[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func bfs() {
    for i in 0..<N {
        for j in 0..<M {
            if tomatoes[i][j] == 1 {
                q.append((i, j))
            }
        }
    }

    var index = 0
    while index < q.count {
        let (x, y) = q[index]
        index += 1

        for i in 0..<4 {
            let (nx, ny) = (x + dx[i], y + dy[i])

            if 0..<N ~= nx && 0..<M ~= ny && tomatoes[nx][ny] == 0 {
                tomatoes[nx][ny] = tomatoes[x][y] + 1
                q.append((nx, ny))
            }
        }
    }
}

if !tomatoes.flatMap({ $0 }).contains(0) {
    print("0")
} else {
    bfs()
    let flattenTomatoes = tomatoes.flatMap({ $0 })
    print(flattenTomatoes.contains(0) ? "-1" : "\(flattenTomatoes.max()!-1)")
}
