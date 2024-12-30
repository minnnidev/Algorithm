//
//  [백준 5014] 스타트링크.swift
//  Algorithm
//
//  Created by 김민 on 1/4/24.
//
// 백준 5014 스타트링크 https://www.acmicpc.net/problem/5014

/*
F: 건물의 층 수, S: 강호의 위치, G: 스타트링크 위치, U: 위로 이동할 수 있는 층, D: 아래로 이동할 수 있는 층

[전략]
강호의 위치부터 탐색을 시작하여 +U, -D을 하며 해당 위치까지 이동하는 데 걸리는 최소 횟수를 저장한다.
그 위치에서 또다시 +U, -D로 탐색하며 값을 갱신해간다.
G층에 도달하는 순간 G층까지 이동하는 데 걸린 최소 횟수를 출력해 준다.

[풀이]
초기값을 -1로 가지는 F+1 크기의 배열을 선언한다. 이 배열은 해당 층(인덱스)으로 강호가 이동하는 데 걸리는 최소 횟수를 저장한다.
1층부터 시작하기에 인덱스 처리가 쉽도록 하기 위해 F+1로 선언했다.
강호 위치 S를 큐에 넣고 +U, -D 탐색을 하며 해당 위치로 이동할 수 있는지 판별한다.
탐색을 시작하기 위해 큐에서 S를 뺀다.
이동하려는 위치가 1층~F층 내에 있고, 아직 방문하지 않았다면(그 층으로 이동할 수 있는 최소 횟수를 구하는 과정이므로)
S+1을 해당 위치에 저장해 준다. 그리고 해당 위치를 큐에 넣는다.
이제 큐를 순회하며 강호의 위치 S가 아닌 큐에서 dequeue한 값을 기준으로 똑같이 탐색하고 값을 갱신해 나가면 된다.
인덱스 G의 값이 초기값 -1에서 다른 값으로 변경이 되었다면, 강호가 스타트링크에 도달한 것이므로 이동한 최소 횟수를 출력한다.
큐를 전부 비웠는데도 G의 값이 바뀌지 않았다면, 엘리베이터를 이용해서 G층에 도달할 수 없는 것이므로 "use the stairs"를 출력한다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (F, S, G, U, D) = (line[0], line[1], line[2], line[3], line[4])
var building = Array(repeating: -1, count: F+1)

func bfs() {
    let directions = [U, -D]
    var q = [S]
    building[S] = 0
    var index = 0

    while index < q.count {
        let floor = q[index]
        index += 1

        if building[G] != -1 {
            print(building[G])
            return
        }

        for direction in directions {
            let nfloor = floor + direction

            // 이동하려는 칸이 1~F층 내에 있고 방문하지 않았다면 값을 갱신하고 큐에 넣어 다음 탐색을 준비한다.
            if 1...F ~= nfloor && building[nfloor] == -1 {
                building[nfloor] = building[floor] + 1
                q.append(nfloor)
            }
        }
    }

    print("use the stairs")
}

bfs()

/*
 [다른 풀이]
 1000000 크기의 1차원 배열이므로 인덱스를 옮기지 않고 removeFirst를 사용해도 시간 초과가 나지 않는다.
 최소 횟수를 각 배열에 저장하지 않고, 큐에 enqueue할 때 그 칸까지 이동한 횟수를 저장해서 결과를 나타낸다.
 위로 U층 이동할 때는 F보다 작거나 같게, 아래로 D층 이동할 때는 0보다 크도록 범위를 쪼갰다.
 -> 시간과 메모리 ⬇️
*/
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (F, S, G, U, D) = (line[0], line[1], line[2], line[3], line[4])
//var visitied = Array(repeating: false, count: F+1)
//
//func bfs() {
//    var q = [(S, 0)]
//    var index = 0
//    visitied[S] = true
//
//    while !q.isEmpty {
//        let (floor, moveCount) = q[index]
//
//        if floor == G {
//            print(moveCount)
//            return
//        }
//
//        let upFloor = floor + U
//        if upFloor <= F && !visitied[upFloor] {
//            visitied[upFloor] = true
//            q.append((upFloor, moveCount + 1))
//        }
//
//        let downFloor = floor - D
//        if downFloor > 0 && !visitied[downFloor] {
//            visitied[downFloor] = true
//            q.append((downFloor, moveCount + 1))
//        }
//
//    }
//    print("use the stairs")
//}
//
//bfs()
