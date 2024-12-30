//
//  [백준 13913] 숨바꼭질 4.swift
//  Algorithm
//
//  Created by 김민 on 1/22/24.
//
// 백준 13913 숨바꼭질 4 https://www.acmicpc.net/problem/13913

/*
[📝 기록]
최단 이동거리뿐만 아니라 그 경로까지 출력하는 문제

[📌 전략]
해당 위치로 오기 전에 어디에 있었는지 그 경로를 저장하여
마지막으로 동생의 위치 k부터 이전 경로를 따라와 수빈이가 있는 위치 n까지의 경로를 출력하도록 한다.

[✅ 풀이]
1. paths 배열을 만들어 움직일 때마다 모든 경로를 저장하도록 했다 -> 메모리 초과

2. 이전 경로를 딕셔너리로 저장했다. [현재 위치: 이전 위치]
n = 5, k = 17의 경우에 [4:5] -> [8:4] -> [16:8] -> [17:16]가 된다.
key값이 k가 되었을 때는 이전 경로인 value값을 이용하여 해당 value값이 key값이 되는 요소를 찾아가며 경로를 찾는다.

3. 2번과 원리는 같지만 딕셔너리를 따로 만들지 않고 visited 배열 하나로 구현했다.
visited[nx]에 nx에 도달하기 전 위치를 저장한다.
큐에서 k가 나왔을 때, visited[k]로 이전 경로를 파악하고, visited[visited[k]] ... 를 계속 탐색해가며 경로를 찾는다.
*/

// 1. 모든 경로 저장 - 메모리 초과
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, k) = (line[0], line[1])
//var paths = Array(repeating: [Int](), count: 100002)
//
//func bfs() {
//    var q = [n]
//    var index = 0
//    paths[n] = [n]
//
//    while index < q.count {
//        let x = q[index]
//        index += 1
//
//        if x == k {
//            let path = paths[k]
//            print(path.count-1)
//            print(path.map { String($0) }.joined(separator: " "))
//        }
//
//        [x-1, x+1, x*2].forEach {
//            if 0..<100002 ~= $0 && paths[$0].isEmpty {
//                paths[$0] = paths[x] + [$0]
//                q.append($0)
//            }
//        }
//    }
//}
//
//bfs()

// 2. 이전 경로를 딕셔너리로 저장
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, k) = (line[0], line[1])
//var destinations = [Int:Int]()
//var visited = Array(repeating: false, count: 100002)
//
//func bfs() {
//    var q = [n]
//    var index = 0
//    visited[n] = true
//
//    while index < q.count {
//        let x = q[index]
//        index += 1
//
//        if x == k {
//            guard var val = destinations[k] else {
//                print(0, k, separator: "\n")
//                return
//            }
//
//            var path = [Int]()
//            path.append(contentsOf: [k, val])
//            while val != n {
//                val = destinations[val]!
//                path.append(val)
//            }
//
//            print(path.count-1)
//            print(path.reversed().map { String($0) }.joined(separator: " "))
//            return
//        }
//
//        [x-1, x+1, x*2].forEach {
//            if 0..<100002 ~= $0 && !visited[$0] {
//                destinations[$0] = x
//                visited[$0] = true
//                q.append($0)
//            }
//        }
//    }
//}
//
//bfs()

// 3. 딕셔너리를 따로 사용하지 않고 방문 배열과 이전 경로를 합치기
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (line[0], line[1])
var visited = Array(repeating: -1, count: 100002)

func bfs() {
    var q = [n]
    var index = 0
    visited[n] = 0

    while index < q.count { // 큐 범위 내
        let x = q[index]
        index += 1

        if x == k { // 큐에서 k가 나왔다면
            var path = [k]
            var nx = k
            while nx != n { // nx가 n이 아닐 때는 경로를 저장 -> 이전 경로가 n일 때는 언니의 위치이므로 탈출
                path.append(visited[nx])
                nx = visited[nx]
            }
            print(path.count-1)
            print(path.reversed().map { String($0) }.joined(separator: " "))
        }

        [x-1, x+1, x*2].forEach {
            if 0..<100002 ~= $0 && visited[$0] == -1 { // 아직 방문하지 않고 범위 내에 있을 때
                visited[$0] = x
                q.append($0)
            }
        }
    }
}

bfs()
