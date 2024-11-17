//
//  [백준 6593] 상범 빌딩.swift
//  Algorithm
//
//  Created by 김민 on 1/4/24.
//
// 백준 6593 상범 빌딩 https://www.acmicpc.net/problem/6593

/*
상범이의 위치(S)에서 탈출구(E)까지 가는 데 걸리는 최단 시간을 구하기.
상범이는 벽(#)을 제외하고 상하좌우남북 방향으로 움직일 수 있다.
상범이가 이동하면서 각 칸에 도착하는 데 걸리는 최단 시간을 통해 탈출하는 데 걸리는 최단 시간을 구해보자.

상범이의 위치부터 탐색을 시작해야 하므로 상범이의 위치와, 탈출구 위치까지 도달했는지 판단해야 하므로 탈출구의 위치를 저장한다.
각 칸까지 상범이가 이동하는 데 걸리는 최단 시간을 저장할 수 있는 time 배열을 만든다. 초깃값은 -1로 지정한다.
이제 상범이의 위치부터 탐색을 시작해 보자. time 배열에서 상범이의 위치의 값은 0이 된다.
총 6방향을 탐색하되, 이동하려는 칸이 입력받은 빌딩 범위 내에 있고, 방문하지 않았고(time 값이 초깃값인 -1일 경우), 벽이 아닐 경우에만 이동한다.
time 배열에서 이동한 칸 위치의 값을 time 배열의 기준 칸 위치의 값(기준 칸까지 가는 데 걸리는 시간)+1로 변경해 준다. (한 칸을 이동하는 데 1분이 걸리기 때문)
이동한 칸들을 큐에 넣어서, 다시 차례차례 그 칸들을 기준으로 탐색을 실시하도록 한다.
*/

typealias location = (l: Int, r: Int, c: Int)

while true {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (L, R, C) = (line[0], line[1], line[2]) // 행 개수: R, 열  개수: C , 높이: L
    var matrix = Array(repeating: Array(repeating: [Character](), count: R), count: L)
    var time = Array(repeating: Array(repeating: Array(repeating: -1, count: C), count: R), count: L)
    let directions = [(0, 1, 0), (0, -1, 0), (0, 0, 1), (0, 0, -1), (1, 0, 0), (-1, 0, 0)]

    // L, R, C 가 0이면 입력을 종료한다
    if L == 0 && R == 0 && C == 0 {
        break
    }

    for i in 0..<L {
        for j in 0..<R {
            matrix[i][j] = readLine()!.map { $0 }
        }
        _ = readLine()!
    }

    // 상범이의 위치와 탈출구 위치 저장하기
    var (start, end) = (location(0, 0, 0), location(0, 0, 0))
    for l in 0..<L {
        for r in 0..<R {
            for c in 0..<C {
                if matrix[l][r][c] == "S" {
                    start = (l, r, c)
                }

                if matrix[l][r][c] == "E" {
                    end = (l, r, c)
                }
            }
        }
    }

    var q = [start]
    time[start.l][start.r][start.c] = 0 // 상범이가 출발하는 위치의 시간은 0으로 설정

    // 큐가 빌 때까지 반복
    while !q.isEmpty {
        let (h, x, y) = q.removeFirst()

        for direction in directions {
            let (nh, nx, ny) = (h + direction.0, x + direction.1, y + direction.2)

            // 범위 내에 있지 않으면 다음 방향 탐색
            if nh < 0 || nh >= L || nx < 0 || nx >= R || ny < 0 || ny >= C { continue}
            // 이미 방문했거나, 벽일 경우 다음 방향 탐색
            if time[nh][nx][ny] != -1 || matrix[nh][nx][ny] == "#" { continue }

            // 기준 칸의 시간에 1을 더해 값을 갱신하고 인접 방향 탐색을 할 수 있도록 큐에 넣는다
            time[nh][nx][ny] = time[h][x][y] + 1
            q.append((nh, nx, ny))
        }
    }

    /*
     time 배열에서 탈출구 위치의 값이 초깃값(-1)에서 변경되지 않은 경우, 도달하지 못한 것이므로 Trapped 출력
     변경되었다면 탈출에 성공한 것이므로 최단 시간 출력
     */
    print(time[end.l][end.r][end.c] == -1 ? "Trapped!" : "Escaped in \(time[end.l][end.r][end.c]) minute(s).")
}
