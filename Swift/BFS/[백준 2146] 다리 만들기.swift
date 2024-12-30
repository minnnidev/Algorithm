//
//  [백준 2146] 다리 만들기.swift
//  Algorithm
//
//  Created by 김민 on 1/10/24.
//
// 백준 2146 다리 만들기 https://www.acmicpc.net/problem/2146

/*
[📌 전략]
가장 짧은 다리의 시작점과 도착점이 각 섬의 가장자리 좌표들이라는 점
-> 가장자리 좌표들부터 시작하여 다른 섬까지의 최단 거리를 구할 수 있으므로 가장자리들만 저장하는 배열 필요
다른 두 섬을 잇는 다리를 만들어야 하므로 각 섬의 구분이 필요하다는 점

[✅ 풀이]
1. 각 섬에 번호 붙여주기
입력에서 육지가 1로 표현되므로, 섬의 번호는 헷갈리지 않도록 2부터 설정한다.
인접 칸이 배열 범위 내에 있고, 1(아직 번호가 붙지 않은 육지)일 경우에는 다음 탐색을 위해 큐에 넣고, 섬 번호를 지정해 준다.
인접 칸이 배열 범위 내에 있고, 바다일 경우에는 섬의 가장자리임을 의미하므로 따로 저장 (가장자리 좌표를 여러 번 저장하지 않기 위해 set에 저장)
한번에 bfs 탐색이 끝나면, 하나의 섬에 대한 탐색이 끝났으므로 다음 섬의 번호 지정해 주기

2. 다리 잇기
한 섬의 가장자리 시작점로부터 bfs 탐색을 실시하며 도착점까지의 거리를 구해보자.
시작점으로부터 각 칸까지의 최단 거리를 저장할 distance 배열을 만든다. distance 배열은 -1로 초기화하여 방문 여부도 동시에 판단할 수 있도록 한다.
가장자리 좌표들을 저장해둔 set을 사용하여, set의 한 요소부터 상하좌우 탐색을 시작한다.
시작점(set의 요소)의 distance 값은 0으로 설정한다.

인접 칸이 범위 내에 있고, 바다일 때는 시작점부터 해당 인접 칸까지의 거리를 구하여 distance 배열 값을 변경한다. (기준 칸의 distance 값에 1을 더한다.)
큐에 enqueue하여 다시 한번 해당 인접 칸을 기준으로 탐색할 준비를 한다.
인접 칸이 범위 내에 있고, 시작점과 다른 섬일 때는 distance의 기준 칸 값만큼의 길이를 가진 다리가 완성된다. (도착점과 시작점은 다리 길이에 포함 x)
해당 길이가 최소 길이인지 판단하며 set의 각 요소들에 대해 다리를 완성한다.
*/

let N = Int(readLine()!)!
var matrix = Array(repeating: Array(repeating: 0, count: N), count: N)
let directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]
var bridgePos = Set<[Int]>()
var bridgeLength = Int.max

for i in 0..<N {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

// bfs 탐색을 통해 연결된 섬을 구하고, 그섬의 가장자리 좌표를 저장하는 함수
func getBorderBfs(_ i: Int, _ j: Int, islandNum num: Int) {
    var q = [(i ,j)]
    matrix[i][j] = num

    while !q.isEmpty {
        let (x, y) = q.removeFirst()

        for direction in directions {
            let (nx, ny) = (x + direction.0, y + direction.1)

            // 배열 범위 내에 있고, matrix에서 인접 칸의 값이 자기 섬 번호가 아닐 경우 - 섬 번호가 지정되지 않은 육지(1)이거나 바다(0)
            if 0..<N ~= nx && 0..<N ~= ny && matrix[nx][ny] != num {
                if matrix[nx][ny] == 1 { // 육지일 경우
                    q.append((nx, ny)) // 다음 탐색 준비를 위해 큐에 넣기
                    matrix[nx][ny] = num // 섬 번호 지정해 주기
                } else { // 바다일 경우
                    bridgePos.insert([x, y]) // bridgePos set에 삽입. 좌표를 중복으로 넣지 않기 위해서 set으로 저장하였음
                }
            }
        }
    }
}

// 가장 짧은 다리 길이를 구하는 함수
func makeBridge(_ i: Int, _ j: Int) {
    var distance = Array(repeating: Array(repeating: -1, count: N), count: N)
    let startIslandNum = matrix[i][j] // 다리 시작점 좌표 저장
    var q = [(i ,j)]
    distance[i][j] = 0

    while !q.isEmpty {
        let (x, y) = q.removeFirst()

        for direction in directions {
            let (nx, ny) = (x + direction.0, y + direction.1)

            // 범위 내에 있고, 아직 방문하지 않은 다른 섬이거나 바다일 때
            if 0..<N ~= nx && 0..<N ~= ny && matrix[nx][ny] != startIslandNum && distance[nx][ny] == -1 {
                if matrix[nx][ny] != 0 { // 다른 섬일 때
                    bridgeLength = min(bridgeLength, distance[x][y]) // 다리 잇기 가능. distance 배열에서 기준 칸의 값이 다리 길이
                    return
                }

                // 바다일 경우에는 다시 섬을 찾기 위해 큐에 넣음
                q.append((nx, ny))
                /*
                 (nx, ny)칸까지 오는 데 걸린 거리 갱신
                 -> (i, j)에서 탐색을 시작한 기준 칸(x, y)까지 오는 데 걸린 거리에 1을 더함. 인접 칸이니까 1칸 이동한 것을 의미
                 */
                distance[nx][ny] = distance[x][y] + 1
            }
        }
    }
}

var islandNum = 2 // 입력받을 때 육지를 1로 받으니 헷갈리지 않게 섬 번호는 2부터!
for i in 0..<N {
    for j in 0..<N {
        if matrix[i][j] == 1 {
            // 하나의 연결된 섬 탐색 시작, islandNum으로 섬 번호를 붙임
            getBorderBfs(i, j, islandNum: islandNum)
            islandNum += 1
        }
    }
}

for pos in bridgePos { // 가장자리를 모아둔 set을 순회하며 다리 잇기
    makeBridge(pos[0], pos[1])
}

print(bridgeLength)
