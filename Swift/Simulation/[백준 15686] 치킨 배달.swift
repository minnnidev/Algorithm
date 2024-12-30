//
//  [백준 15686] 치킨 배달.swift
//  Algorithm
//
//  Created by 김민 on 2/18/24.
//
// 백준 15686 치킨 배달 https://www.acmicpc.net/problem/15686

/*
 각 조합의 치킨 거리 최소 구하기
 하나의 조합에서 각 치킨집 - 각 집에 대한 거리 중 최솟값 구하고,
 이를 다 더하여 최종 치킨 거리를 구함
 조합들을 모두 탐색하여 치킨 거리의 최솟값을 찾는다
 */

/*
[📌 전략]
폐업하지 않을 치킨집 조합을 백트래킹으로 모두 구한 후 각 조합을 모두 탐색하며 치킨 거리의 최솟값을 찾는다.

[✅ 풀이]
하나의 조합에서 <하나의 집 - 조합에 존재하는 모든 치킨집> 간의 거리 중 최솟값을 찾는다.
모든 집들의 해당 최솟값을 찾아 더하여 조합 하나에 대한 치킨 거리의 최솟값을 찾는다.
각 조합을 탐색하여 최솟값을 갱신하여 최종 답을 도출한다.
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var storeLocs = [(Int, Int)]()
var homeLocs = [(Int, Int)]()

for i in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<n {
        if line[j] == 2 {
            storeLocs.append((i, j))
        } else if line[j] == 1 {
            homeLocs.append((i, j))
        }
    }
}

// 폐업하지 않을 치킨집 조합 고르기 (m개)
let storeCnt = storeLocs.count
var arr = Array(repeating: 0, count: m)
var result = Int.max

func backtracking(_ k: Int, _ depth: Int) {
    if k == m {
        findMininumDistances(arr)
        return
    }

    for i in depth..<storeCnt {
        arr[k] = i
        backtracking(k+1, i+1)
    }
}

// 각 조합의 치킨 거리 최솟값 찾기
func findMininumDistances(_ storeCombis: [Int]) {
    var sum = 0
    for homeLoc in homeLocs {
        var minD = Int.max
        for storeCombi in storeCombis { // 하나의 집을 기준으로 조합에 존재하는 모든 치킨집들 간의 거리 중 최솟값을 찾는다
            let storeLoc = storeLocs[storeCombi]
            minD = min(minD, abs(homeLoc.0 - storeLoc.0) + abs(homeLoc.1 - storeLoc.1))
        }
        sum += minD // sum에 더하여 하나의 조합에 대한 치킨 거리의 최솟값을 구한다
    }
    result = min(result, sum) // result를 갱신해가며 치킨 거리의 최솟값을 찾는다
}

backtracking(0, 0)
print(result)
