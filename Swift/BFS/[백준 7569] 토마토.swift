//
//  [백준 7569] 토마토.swift
//  Algorithm
//
//  Created by 김민 on 12/30/23.
//
// 백준 7569 토마토 https://www.acmicpc.net/problem/7569

/*
7576 토마토에서 탐색 방향이 위, 아래도 추가된 문제

익은 토마토는 보관 후 하루가 지나면, 위, 아래, 왼쪽, 오른쪽, 앞, 뒤 여섯 방향에 있는 토마토를 익힌다.
상자 안의 토마토가 모두 익을 수 있는 최소 일수를 구하기
-> bfs 거리 측정 유형 / 0일차에 익은 토마토로부터 모든 토마토가 익을 때까지 bfs 탐색을 실시한다
인접한 칸을 익히게 되면 기준칸의 값의 +1을 하여 익은 일자를 표시하는 전략으로 풀이했다.

[풀이]
0일차에 익은 토마토를 큐에 담는다. 큐에서 익은 토마토 하나를 빼서 주변을 탐색한 뒤, 익지 않은 토마토는 익히고 해당 인덱스를 큐에 담는다.
이때 인접한 칸의 값을 0에서 (기준칸의 값+1)로 변경한다. 이 칸까지 오는 일 수를 체크해 주는 것이다. 그리고 큐에 넣는다.
큐가 모두 비워질 때까지, 즉 익힐 수 있는 모든 토마토를 익혔을 때, 3차원 배열에 0이 남아 있다면 모두 익히지 못하는 상황이므로 -1을 출력한다.
모두 익혔다면, 탐색하며 갱신해온 날짜의 최댓값에서 -1을 하여 출력한다. (익은 토마토가 1로 표시되어 1부터 +1씩을 해 오며 탐색했기 때문이다.)
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (M, N, H) = (line[0], line[1], line[2])
var tomatoes = Array(repeating: Array(repeating: [Int](), count: N), count: H)

for i in 0..<H {
    for j in 0..<N {
        tomatoes[i][j] = readLine()!.split(separator: " ").map { Int($0)! }
    }
}

// 탐색 방향이 총 6개이다. 위 아래 방향도 추가하기 위해 (x, y, z)로 설정한다.
let directions = [(-1, 0, 0), (1, 0, 0), (0, -1, 0), (0, 1, 0), (0, 0, 1), (0, 0, -1)]
var q = [(Int, Int, Int)]()

func bfs() {
    var index = 0

    while index < q.count {
        let (z, x, y) = q[index]
        index += 1

        directions.forEach {
            let (nz, nx, ny) = (z + $0.2, x + $0.0, y + $0.1)


            // 탐색할 칸이 범위 내에 있고, 익지 않은 토마토라면, 일수 갱신 및 해당 칸의 인접 칸 탐색을 위해 큐에 넣어준다.
            if 0..<N ~= nx && 0..<M ~= ny && 0..<H ~= nz && tomatoes[nz][nx][ny] == 0 {
                tomatoes[nz][nx][ny] = tomatoes[z][x][y] + 1
                q.append((nz, nx, ny))
            }
        }
    }
}

for h in 0..<H {
    for n in 0..<N {
        for m in 0..<M {
            // 0일차에 상자를 순회하며 익은 토마토일 때 탐색을 위해 큐에 집어넣는다.
            if tomatoes[h][n][m] == 1 {
                q.append((h, n, m))
            }
        }
    }
}

bfs()
let flattenTomatoes = tomatoes.flatMap({ $0 }).flatMap({ $0 })
/*
탐색을 모두 실시했는데도 0이 남아 있다면 -1 출력. 아닐 시에 최댓값에서 -1 뺀 값을 출력.
후자의 경우에 처음부터 모두 익은 경우가 포함된다. bfs 탐색을 실시해도 익지 않은 토마토가 없기 때문에 최댓값은 1이다. 따라서 최종 출력값은 0이 된다.
*/
print(flattenTomatoes.contains(0) ? "-1" : flattenTomatoes.max()!-1)
