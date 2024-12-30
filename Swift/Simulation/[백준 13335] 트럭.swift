//
//  [백준 13335] 트럭.swift
//  Algorithm
//
//  Created by 김민 on 3/17/24.
//
// 백준 13335 트럭 https://www.acmicpc.net/problem/13335

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, w, l) = (line[0], line[1], line[2])
var trucks = readLine()!.split(separator: " ").map { Int($0)! }
var bridge = Array(repeating: 0, count: w) // 다리 위를 나타내는 배열

// 첫 번째 트럭은 다리 위로 올라가고 시작
bridge[w-1] = trucks[0]
var time = 1 // 1초 지남

var t = 1 // 트럭을 관리할 인덱스
while t < n {
    time += 1 // 한번 while문을 돌 때마다 1초 카운트

    if bridge.reduce(0, +) > 0 { // 다리 위에 존재하는 트럭이 있으면 이동시키기
        bridge.removeFirst()
        bridge.append(0)
    }

    // 다리 위의 트럭 개수가 w보다 크거나 같다면 다른 트럭이 올라올 수 없으므로 continue
    if bridge.filter({ $0 != 0 }).count >= w { continue }
    // 다리 위의 트럭의 합과 올라올 트럭의 합이 l보다 클 때는 올라올 수 없으므로 continue
    if bridge.reduce(0, +) + trucks[t] > l { continue }

    // 위의 조건들을 통과했을 경우 트럭이 올라올 수 있으므로 다리의 마지막 인덱스에 트럭 올리기
    bridge[w-1] = trucks[t]
    t += 1 // 다음 트럭 탐색
}

print(time + w) // 마지막 트럭이 트럭을 전부 건넜을 때 답을 도출해야 하므로 w를 더하기
