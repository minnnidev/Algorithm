//
//  [백준 8980] 택배.swift
//  Algorithm
//
//  Created by 김민 on 12/20/23.
//
// 백준 8980 택배 https://www.acmicpc.net/problem/8980

/*
가장 가까운 마을에 택배를 많이 보낼수록 후에도 박스를 많이 보낼 수 있다고 생각하여
받는 마을이 빠른 순서대로 정렬을 하는 방식으로 접근했다.
아이디어를 생각하는 것 자체는 쉬웠는데 구현은 정말 어려웠다.

각 마을에서 트럭에 실을 수 있는 용량을 체크하는 배열을 하나 만든다.
박스 정보 배열을 순회하며, 출발하는 마을과 도착하는 마을 사이에서 실을 수 있는 택배를 싣는다.
이때 실을 수 있는 택배란, 출발하는 마을과 도착하는 마을 사이의 적재된 최대 용량이 주어진 C보다 작아서
전체 혹은 일부를 실을 수 있는 경우이다.
택배를 실을 수 있는 경우 최종 답안에 더해 준다.

예를 들어, N = 4, C = 40
[1, 2, 10]의 경우 마을1에서 보내고, 마을 2에서 받는다. 따라서 마을 2는 고려할 필요가 없다.
용량을 체크하는 배열은 [10, 0, 0, 0]이 된다.
다음으로 [1, 4, 50] 이 오는 경우, 마을1과 마을3 사이의 적재된 용량의 최댓값은 10이다.
C가 40이므로, 30만 실을 수 있다.
용량을 체크하는 배열은 [40, 30, 30, 0]이 된다.
이런식으로 순회하면서 찾아가면 된다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, C) = (line[0], line[1])
var M = Int(readLine()!)!
var boxes = [(Int, Int, Int)]()

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    boxes.append((input[0], input[1], input[2]))
}

boxes.sort {
    if $0.1 == $1.1 {
        return $0.0 < $1.0
    } else {
        return $0.1 < $1.1
    }
}

var capcities = Array(repeating: 0, count: N)
var result = 0

for i in 0..<M {
    let sendTownIndex = boxes[i].0 - 1
    let receiveTownIndex = boxes[i].1 - 1
    let boxCount = boxes[i].2
    let maxCapcity = capcities[sendTownIndex..<receiveTownIndex].max()!

    if maxCapcity < C {
        let remains = boxCount + maxCapcity > C ? C - maxCapcity : boxCount
        result += remains
        for j in sendTownIndex..<receiveTownIndex {
            capcities[j] += remains
        }
    }
}

print(result)
