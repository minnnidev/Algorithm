//
//  [백준 1012] 유기농 배추.swift
//  Algorithm
//
//  Created by 김민 on 12/28/23.
//
// 백준 1012 유기농 배추 https://www.acmicpc.net/problem/1012

/*
해충을 방지하는 지렁이는 배추에 서식하며, 배추에 지렁이가 한 마리라도 살고 있으면 인접한 배추로 이동한다
-> 배추 하나에 흰 지렁이가 살면 인접한 배추에도 이동한다. 따라서 지렁이의 최소 마리수는 연결된 배추 뭉탱이들의 총 개수와 동일하다.

일반적인 bfs 탐색과 동일하게 풀이하면 된다.
배추밭 2차원 배열을 순회하면서 배추일 때는 인접한 배추(상하좌우)를 탐색해서, 배추면 방문했다는 표시를 하고, 큐에 다시 집어넣어
다시 해당 배추의 인접한 배추 탐색을 실시하도록 한다.
방문 여부를 탐색하는 배열을 따로 만들지 않고 해당 위치의 값을 1에서 0으로 바꾸어 다시 탐색하지 않아도 된다는 표시를 했다.
큐가 모두 비워지면 하나의 연결된 배추 뭉탱이 탐색이 끝났다는 뜻이다.
*/

let T = Int(readLine()!)!

for _ in 0..<T {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (M, N, K) = (line[0], line[1], line[2]) // 가로 길이, 세로 길이, 개수
    var farm = Array(repeating: Array(repeating: 0, count: M), count: N)
    let dx = [-1, 0, 0, 1]
    let dy = [0, -1, 1, 0]
    var result = 0

    func bfs(_ i: Int, _ j: Int) {
        var q = [(i, j)]
        farm[i][j] = 0

        var index = 0
        while index < q.count {
            let (x, y) = q[index]
            index += 1

            for k in 0..<4 {
                let (nx, ny) = (x + dx[k], y + dy[k])

                if 0..<N ~= nx && 0..<M ~= ny && farm[nx][ny] == 1 {
                    q.append((nx, ny))
                    farm[nx][ny] = 0
                }
            }
        }
    }

    for _ in 0..<K {
        let pos = readLine()!.split(separator: " ").map { Int($0)! }
        farm[pos[1]][pos[0]] = 1
    }

    /*
    입력은 (X, Y) 순으로 받는다. X(0 ≤ X ≤ M(가로 길이)-1), Y(0 ≤ Y ≤ N(세로 길이)-1)
    배추밭 배열을 순회할 때, 나는 한 행의 각 열들을 먼저 보도록 순회했기 때문에
    bfs 탐색해서 nx가 0..<N에 포함되고, ny가 0..<M에 포함되는지 여부를 확인했다.
     */
    for i in 0..<N {
        for j in 0..<M {
            if farm[i][j] == 1 {
                bfs(i, j)
                result += 1
            }
        }
    }

    print(result)
}
