//
//  [백준 4179] 불!.swift
//  Algorithm
//
//  Created by 김민 on 12/27/23.
//
// 백준 4179 불! https://www.acmicpc.net/problem/4179

/*
지훈이가 탈출을 위해 이동하기 위해서는 불이 움직일 위치에 도달하기 전에 지훈이가 그 위치로 이동해야 함
-> 불이 해당 위치로 확산되는 시간 > 지훈이가 해당 위치로 이동하는 시간이면 이동 가능
-> 불의 전파 위치, 지훈이의 이동 가능한 위치를 따로 BFS로 탐색한다.
1. BFS 탐색을 통하여 불이 각 위치까지 확산되는 시간 구하기
2. 1번에서 구한 각 위치에 불이 확산되는 시간을 이용하여, BFS 탐색을 통해 지훈이가 이동할 수 있는 곳을 모두 구함
3. 지훈이가 가장자리에 도달했다면 탈출에 성공한 것, 더이상 이동할 수 있는 곳이 없다면 탈출이 불가능한 것
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (R, C) = (line[0], line[1])
var matrix = Array(repeating: [Character](), count: R)
var dx = [-1, 0, 0, 1]
var dy = [0, -1, 1, 0]
// 불의 전파 시간과 지훈이의 이동 시간 배열의 초깃값을 -1로 설정하여 visited 여부도 한번에 확인할 수 있도록 함
var fireMinutes = Array(repeating: Array(repeating: -1, count: C), count: R)
var jMinutes = Array(repeating: Array(repeating: -1, count: C), count: R)
var result = ""

for i in 0..<R {
    matrix[i] = readLine()!.map { $0 }
}

func fireBFS() { // 불의 확산 탐색
    var fireQ = [(Int, Int)]()

    for i in 0..<R {
        for j in 0..<C {
            if matrix[i][j] == "F" { // 불일 때 큐에 담는다
                fireQ.append((i, j))
                fireMinutes[i][j] = 0
            }
        }
    }

    var index = 0

    /*
    큐가 비워질 때까지 반복한다
    removeFirst()로 dequeue 하는 대신 인덱스를 증가시키는 방법으로 시간을 줄인다.
    */
    while index < fireQ.count {
        let (x, y) = fireQ[index]
        index += 1

        for k in 0..<4 {
            let (nx, ny) = (x + dx[k], y + dy[k])

            // 범위 내에 있고, 이전에 방문하지 않았고, 벽이 아닐 때 기준 위치의 값에 + 1을 하여 해당 위치까지 불이 오는 시간을 갱신한다.
            if 0..<R ~= nx && 0..<C ~= ny && matrix[nx][ny] != "#" && fireMinutes[nx][ny] == -1 {
                fireMinutes[nx][ny] = fireMinutes[x][y] + 1
                fireQ.append((nx, ny))
            }
        }
    }
}

func jBFS() {
    var jQ = [(Int, Int)]()

    for i in 0..<R {
        for j in 0..<C {
            if matrix[i][j] == "J" { // 지훈이의 위치를 받는다
                jQ.append((i, j))
                jMinutes[i][j] = 0
            }
        }
    }

    var index = 0

    while index < jQ.count {
        let (x, y) = jQ[index]
        index += 1

        for k in 0..<4 {
            let (nx, ny) = (x + dx[k], y + dy[k])

            /*
             범위 내를 벗어났다는 말은 x, y가 가장자리에 위치하고, 다음에 탈출할 수 있다는 의미이다.
             따라서 현재 위치까지 오는 데 걸린 시간에 1을 더하여 정답을 갱신한다.
             */
            if !(0..<R ~= nx) || !(0..<C ~= ny) {
                result = "\(jMinutes[x][y] + 1)"
                return
            }

            // 벽이거나 방문한 적이 있다면 다음 방향 탐색
            if matrix[nx][ny] == "#" || jMinutes[nx][ny] >= 0 { continue }
            // 지훈이가 이동하는 시간이 불이 번진 시간 이후일 경우에는 이동할 수 없으므로 다음 방향 탐색
            if fireMinutes[nx][ny] != -1 && fireMinutes[nx][ny] <= jMinutes[x][y] + 1 { continue }

            // 모든 조건을 통과할 시에 지훈이는 이동할 수 있으므로 시간 갱신
            jMinutes[nx][ny] = jMinutes[x][y] + 1
            jQ.append((nx, ny))
        }
    }

    // 여기에 도달했다는 것은 탈출이 불가능하다는 의미
    result = "IMPOSSIBLE"
    return
}

fireBFS()
jBFS()
print(result)
