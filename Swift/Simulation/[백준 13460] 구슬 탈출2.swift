//
//  [백준 13460] 구슬 탈출2.swift
//  Algorithm
//
//  Created by 김민 on 7/21/24.
//
// 백준 13460 구슬 탈출2 https://www.acmicpc.net/problem/13460

/*
[📌 전략]
 판을 움직여가며 최소 몇 번만에 빨간 구슬을 구멍을 통해 빼낼 것인가 -> bfs로 방향을 움직여가며 풀이하기
 빨강, 파란 구슬을 동시에 움직여야 하는데 어떻게 할 것인가? -> bfs 탐색을 위해 큐에 넣을 때 빨간 구슬 좌표, 파란 구슬 좌표 모두 큐에 넣기

[✅ 풀이]
 1. 입력 시 빨간, 파란 구슬 좌표 따로 저장
 2. bfs 탐색 실시
    - 큐에는 (빨간 구슬 좌표, 파란 구슬 좌표, 현재 이동 횟수) enqueue
    - dequeue 실시
    - 이동 횟수가 10을 넘었을 때는 -1 출력 후 종료
    - dequeue한 빨간 구슬 좌표가 0일 때는 현재 이동 횟수 출력 후 종료
    - 상하좌우 방향(dx, dy) 이동 실시 (우선 빨간 구슬, 파란 구슬의 행, 열의 위치 상관 없이 이동하고)
    - 이동하려는 방향에 따라 구슬들의 행 혹은 열의 위치가 같을 시, 이동이 모두 끝나면 같은 위치에 존재
        -> 이때는 두 구슬 각각이 얼마나 이동했는지에 따라 위치를 재조정
        -> 더 많이 이동한 구슬이, 아닌 구슬의 -dx, -dy에 위치하도록 함.
    - 아직 방문하지 않았다면, 방문 처리를 하고 큐에 enqueue

[📝 기록]
 최근에 풀었던 문제 중에 가장 어려웠어서 기억에 오래 남을 것 같다... 진짜 어려웠다.
 특히 구슬을 동시에 움직일 때, 같은 행이나 열에 있을 때 이동을 어떻게 처리할 것인가에 대해서 오래 고민하다가 결국 스스로 풀이하지 못했다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var matrix = Array(repeating: [String](), count: n)
var visited = Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: 12), count: 12), count: 12), count: 12)
var redPos = (0, 0)
var bluePos = (0, 0)
var ans = 0

for i in 0..<n {
    let words = readLine()!.map { "\($0)" }

    for (idx, word) in words.enumerated() {
        if word == "R" {
            redPos.0 = i
            redPos.1 = idx
        } else if word == "B" {
            bluePos.0 = i
            bluePos.1 = idx
        }
    }
    matrix[i] = words
}

func bfs() {
    var q = [(redPos.0, redPos.1, bluePos.0, bluePos.1, 0)]
    visited[redPos.0][redPos.1][bluePos.0][bluePos.1] = true

    let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]

    while !q.isEmpty {
        let f = q.removeFirst()
        let (rx, ry, bx, by, cnt) = (f.0, f.1, f.2, f.3, f.4)

        if cnt > 10 {
            print(-1)
            return
        }

        if matrix[rx][ry] == "O" {
            print(cnt)
            return
        }

        for dir in dirs {
            let (dx, dy) = (dir.0, dir.1)

            var (tmpRx, tmpRy) = (rx, ry)
            while true {
                tmpRx += dx
                tmpRy += dy

                if tmpRx < 0 || tmpRy < 0 || tmpRx >= n || tmpRy >= m {
                    continue
                }

                if matrix[tmpRx][tmpRy] == "#" {
                    tmpRx -= dx
                    tmpRy -= dy
                    break
                }

                if matrix[tmpRx][tmpRy] == "O" { break }
            }

            var (tmpBx, tmpBy) = (bx, by)
            while true {
                tmpBx += dx
                tmpBy += dy

                if tmpBx < 0 || tmpBy < 0 || tmpBx >= n || tmpBy >= m {
                    continue
                }

                if matrix[tmpBx][tmpBy] == "#" {
                    tmpBx -= dx
                    tmpBy -= dy
                    break
                }

                if matrix[tmpBx][tmpBy] == "O" { break }
            }

            if matrix[tmpBx][tmpBy] == "O" { continue }

            // 이동했을 때 두 구슬이 같은 위치에 있으면 위치 재조정
            if tmpRx == tmpBx && tmpRy == tmpBy {
                if abs(tmpRx - rx) + abs(tmpRy - ry) > abs(tmpBx - bx) + abs(tmpBy - by) {
                    tmpRx -= dx
                    tmpRy -= dy
                } else {
                    tmpBx -= dx
                    tmpBy -= dy
                }
            }


            if visited[tmpRx][tmpRy][tmpBx][tmpBy] { continue }

            visited[tmpRx][tmpRy][tmpBx][tmpBy] = true
            q.append((tmpRx, tmpRy, tmpBx, tmpBy, cnt + 1))
        }
    }

    print(-1)
}

bfs()
