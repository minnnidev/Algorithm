//
//  [백준 1926] 그림.swift
//  Algorithm
//
//  Created by 김민 on 12/26/23.
//
// 백준 1926 그림 https://www.acmicpc.net/problem/1926

/*
상하좌우를 탐색하며 다차원 배열을 순회하는 문제 -> BFS

가로나 세로로 연결된 것은 연결이 된 것이고 대각선으로 연결이 된 것은 떨어진 그림이다
-> dx, dy 변수를 사용하여 상하좌우를 탐색하며 그림이 연결되었는지 여부를 구한다.

그림의 넓이 구하기
-> 일반적인 bfs 문제처럼 상하좌우를 탐색할 때, 연결되어 있으면 큐에 넣으니 이때의 개수를 세 주면 된다.

[풀이]
배열에서 1인 것이 그림이므로, 입력받은 배열의 요소들을 순회하며 1일 경우에 연결된 그림의 탐색을 시작한다.
따라서 연결된 그림의 개수는 이때 갱신한다.
순회 중 요소가 1이라면, 해당 노드는 방문했다는 표시로 값을 1에서 0으로 변경한다. 그후 상하좌우 탐색을 시작한다.
(방문 여부를 판단하는 배열을 따로 만들지 않았다.)
탐색을 할 때, 요소가 배열의 범위 안에 있고, 그림이면(== 1이면) 0으로 변경해 주고 큐에 삽입한다.
큐가 전부 비워질 때까지 반복하면 하나의 연결된 그림에 대한 탐색이 종료된다.
따라서 그림의 최대 너비는 이때 갱신해 주면 된다.
그후 입력받은 배열의 다음 1에서 bfs 탐색을 다시 시작한다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var matrix = Array(repeating: [Int](), count: n)
var dx = [1, 0, -1, 0]
var dy = [0, 1, 0, -1]
var count = 0
var maxArea = 0

for i in 0..<n {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

func bfs(_ x: Int, _ y: Int) {
    var queue = [(x, y)]
    var area = 0
    matrix[x][y] = 0

    while !queue.isEmpty {
        var (x, y) = queue.removeFirst()
        area += 1

        for i in 0..<4 {
            let (nx, ny) = (x + dx[i], y + dy[i])

            if 0..<n ~= nx && 0..<m ~= ny {
                if matrix[nx][ny] == 1 {
                    matrix[nx][ny] = 0
                    queue.append((nx, ny))
                }
            }
        }
    }
    maxArea = max(maxArea, area)
}

for x in 0..<n {
    for y in 0..<m {
        if matrix[x][y] == 1 {
            bfs(x, y)
            count += 1
        }
    }
}

print(count)
print(maxArea)

/*
dx, dy 변수를 따로 만들지 않고 forEach 구문과 하나의 상하좌우 배열로 탐색하는 풀이
*/

//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, m) = (line[0], line[1])
//var matrix = Array(repeating: [Int](), count: n)
//var count = 0
//var maxArea = 0
//
//for i in 0..<n {
//    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
//}
//
//func bfs(_ x: Int, _ y: Int) {
//    var queue = [(x, y)]
//    var area = 0
//    matrix[x][y] = 0
//
//    while !queue.isEmpty {
//        var (x, y) = queue.removeFirst()
//        area += 1
//
//        [(x+1, y), (x, y+1), (x-1, y), (x, y-1)].forEach {
//            if 0..<n ~= $0.0 && 0..<m ~= $0.1 && matrix[$0.0][$0.1] == 1 {
//                matrix[$0.0][$0.1] = 0
//                queue.append($0)
//            }
//        }
//    }
//    maxArea = max(maxArea, area)
//}
//
//for x in 0..<n {
//    for y in 0..<m {
//        if matrix[x][y] == 1 {
//            bfs(x, y)
//            count += 1
//        }
//    }
//}
//
//print(count)
//print(maxArea)
