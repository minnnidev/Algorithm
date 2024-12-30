//
//  [백준 2110] 공유기 설치.swift
//  Algorithm
//
//  Created by 김민 on 3/18/24.
//
// 백준 2110 공유기 설치 https://www.acmicpc.net/problem/2110

/*
[📌 전략]
 가장 인접한 두 공유기 사이의 거리로 이분 탐색을 실시
 가장 최소 거리는 1, 가장 최대 거리는 집의 최대 좌표와 첫 좌표를 뺀 값
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, c) = (line[0], line[1])
var houses = [Int]()

for _ in 0..<n { houses.append(Int(readLine()!)!) }
houses.sort()

func solve(_ mid: Int) -> Bool {
    var cnt = 1
    var prev = houses[0]
    for i in 1..<n {
        if houses[i] - prev >= mid { // house와 prev의 차가 mid보다 크거나 같으면
            cnt += 1 // 공유기 설치가 가능하므로 cnt 1 추가
            prev = houses[i] // prev를 해당 house로 설정하여 다음 공유기 설치 대비
        }
    }
    return cnt >= c
}

var st = 1
var en = houses[n-1]-houses[0]
var res = 0

while st <= en {
    let mid = (st+en)/2

    if solve(mid) { // 설치한 공유기 개수가 c개보다 많다면 st를 mid+1로 설정하여 거리를 더 늘릴 수 있도록 탐색
        res = max(res, mid)
        st = mid + 1
    }
    else { en = mid - 1 } // en을 mid-1로 설정하여 거리를 좁혀 공유기를 더 많이 설치할 수 있도록
}

print(res)
