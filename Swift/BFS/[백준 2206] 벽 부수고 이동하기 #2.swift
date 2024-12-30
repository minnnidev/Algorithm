//
//  [백준 2206] 벽 부수고 이동하기 #2.swift
//  Algorithm
//
//  Created by 김민 on 6/18/24.
//
// 백준 2206 벽 부수고 이동하기 https://www.acmicpc.net/problem/2206

/*
[📝 기록] 2206번 문제 재도전
*/
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var matrix = Array(repeating: [Int](), count: n)
var dis = Array(repeating: Array(repeating: Array(repeating: 0, count: m), count: n), count: 2)

for i in 0..<n {
    let nums = readLine()!.map { Int(String($0))! }
    matrix[i] = nums
}

func bfs() {
    var q = [(0, 0, 0)]
    var index = 0
    dis[0][0][0] = 1

    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

    while index < q.count {
        let (x, y, w) = q[index]
        index += 1

        if x == n-1 && y == m-1 {
            print(dis[w][x][y])
            return
        }

        for dir in dirs {
            let (nx, ny) = (x + dir.0, y + dir.1)

            if nx >= n || ny >= m || nx < 0 || ny < 0 { continue }

            if matrix[nx][ny] == 1 && w == 0 {
                dis[1][nx][ny] = dis[0][x][y] + 1
                q.append((nx, ny, 1))
                continue
            }

            if matrix[nx][ny] == 0 && dis[w][nx][ny] == 0 {
                dis[w][nx][ny] = dis[w][x][y] + 1
                q.append((nx, ny, w))
            }
        }
    }

    print("-1")
}

bfs()
