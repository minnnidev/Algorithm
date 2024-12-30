//
//  [백준 16985] Maaaaaaaaaze.swift
//  Algorithm
//
//  Created by 김민 on 6/30/24.
//
// 백준 16985 Maaaaaaaaaze https://www.acmicpc.net/problem/16985

/*
[📌 전략]
 백트래킹, bfs, 완전 탐색, 구현 문제

[✅ 풀이]
 고려해야 할 조건: 판은 임의로 쌓을 수 있음, 판은 회전시킬 수 있음(시계, 반시계 모두 회전할 수 있다고 했지만 결국 1판당 경우는 4개), 인접한 면만 이동 가능
 이 3가지 조건을 모두 사용하여 풀이
 1. 가능한 판의 조합을 순열로 구함
 2. 가능한 회전 조합을 조합으로 구함(0: 원본, 1: 90도 회전, 2: 180도 회전, 3: 270도 회전)으로 숫자로 조합을 구하였음
 3. 1번 2번의 모든 조합을 구함
 4. 한 개의 판들의 조합에서 bfs를 실시
    4-0. 어차피 회전 조합에서 모든 꼭짓점을 다루므로 따로 꼭짓접들의 조합은 찾지 않아도 됨
    4-1. (0,0,0)이나 (4,4,4) 중 하나라도 0이면 불가능하므로 바로 탈출
    4-2. (0,0,0)에서 (4,4,4)까지 이동하는 거리를 bfs로 계산
5. 가장 적은 길이를 답으로 출력

[📝 기록]
 판도 참가자가 임의의 순서대로 쌓을 수 있다는 조건을 놓쳐서 🐶고생한 문제.
 아는 개념들 나와서 신나게 풀었지만 결국 문제 조건 하나 놓쳐서 오랫동안 풀이함.
*/

// 판 입력받기
var plates = Array(repeating: Array(repeating: Array(repeating: 0, count: 5), count: 5), count: 5)
var ans = Int.max

for i in 0..<5 {
    for j in 0..<5 {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        plates[i][j] = input
    }
}

// 가능한 회전 조합 구하기
var arr = Array(repeating: 0, count: 5)
var rotateCombis = [[Int]]()

func findRotateCombis(_ k: Int) {
    if k == 5 {
        rotateCombis.append(arr)
        return
    }

    for i in 0..<4 {
        arr[k] = i
        findRotateCombis(k+1)
    }
}

// 판 쌓는 조합 구하기
var visited = Array(repeating: false, count: 5)
var plateOrderCombis = [[Int]]()

func findPlatesOrderCombis(_ k: Int) {
    if k == 5 {
        plateOrderCombis.append(arr)
        return
    }

    for i in 0..<5 {
        if visited[i] { continue }
        visited[i] = true
        arr[k] = i
        findPlatesOrderCombis(k+1)
        visited[i] = false
    }
}

// 회전 로직 함수
func rotate(_ arr: [[Int]], _ k: Int) -> [[Int]] {
    let tmp = arr
    var rotatedArr = Array(repeating: Array(repeating: 0, count: 5), count: 5)

    if k == 0 { return tmp }

    for i in 0..<5 {
        for j in 0..<5 {
            if k == 1 {
                rotatedArr[j][4-i] = tmp[i][j]
            } else if k == 2 {
                rotatedArr[4-i][4-j] = tmp[i][j]
            } else if k == 3 {
                rotatedArr[4-j][i] = tmp[i][j]
            }
        }
    }

    return rotatedArr
}

// bfs 이동
func bfs(_ arr: [[[Int]]]) -> Int {
    let dirs = [
        (0, 0, 1), (0, 0, -1),
        (0, 1, 0), (0, -1, 0),
        (-1, 0, 0), (1, 0, 0)
    ]

    if arr[0][0][0] == 0 || arr[4][4][4] == 0 { return Int.max }

    var q = [(0, 0, 0)]
    var index = 0
    var distance = Array(repeating: Array(repeating: Array(repeating: -1, count: 5), count: 5), count: 5)
    distance[0][0][0] = 0

    while index < q.count {
        let f = q[index]
        index += 1
        let (z, x, y) = (f.0, f.1, f.2)

        if z == 4 && x == 4 && y == 4 {
            return distance[z][x][y]
        }

        for dir in dirs {
            let (nz, nx, ny) = (z + dir.2, x + dir.0, y + dir.1)

            if nz >= 5 || nz < 0 || nx >= 5 || nx < 0 || ny >= 5 || ny < 0 { continue }
            if arr[nz][nx][ny] == 0 { continue }
            if distance[nz][nx][ny] > -1 { continue }

            distance[nz][nx][ny] = distance[z][x][y] + 1
            q.append((nz, nx, ny))
        }
     }

    return Int.max
}

func find() {
    for plateCombi in plateOrderCombis {
        var orderedPlates = [[[Int]]]()

        for i in 0..<5 {
            orderedPlates.append(plates[plateCombi[i]])
        }

        for combi in rotateCombis {
            var rotatedPlates = [[[Int]]]()

            for i in 0..<5 {
                rotatedPlates.append(rotate(orderedPlates[i], combi[i]))
            }

            let dis = bfs(rotatedPlates)

            if dis < ans { ans = dis }
        }
    }
}

findPlatesOrderCombis(0)
findRotateCombis(0)
find()
print(ans < Int.max ? ans : -1)
