//
//  [백준 2805] 나무 자르기.swift
//  Algorithm
//
//  Created by 김민 on 3/13/24.
//
// 백준 2805 나무 자르기 https://www.acmicpc.net/problem/2805

/*
[📌 전략]
 나무를 자를 수 있는 총 범위는 0보다 크고 1,000,000,000와 같거나 작은 범위
 모든 수들을 탐색하며 h를 판단하려면 시간 초과.
 O(logN)에 탐색할 수 있는 이분 탐색 알고리즘 사용 필요

[✅ 풀이]
 0~입력받은 나무의 길이 중 최댓값 사이 범위 이분 탐색 실시
 각 나무에서 mid 값을 뺀 값이 상근이가 집에 가져갈 수 있는 나무 길이이므로,
 나무들을 순회하며 집에 가져갈 수 있는 나무 길이 합을 구한다.
 합이 m보다 크거나 같은 경우 h를 더 길게 할 수 있으므로 st = mid + 1로 이동하여 다시 탐색
 m보다 작은 경우 h를 더 짧게 해야 하므로 en = mid-1로 이동하여 다시 탐색 실시
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
var heights = readLine()!.split(separator: " ").map { Int($0)! }

var st = 0
var en = heights.max()!

func solve(_ h: Int) -> Bool {
    var res = 0
    for height in heights {
        if height > h { // 빼기를 실시하므로 입력받은 나무가 현재 h보다 클 때만 빼야 양수가 나와 답에 영향을 주지 않는다
            res += (height-h)
        }
    }
    return res >= line[1]
}

while st <= en {
    let mid = (st+en)/2

    if solve(mid) { st = mid + 1 }
    else { en = mid - 1}
}

print(st-1)

