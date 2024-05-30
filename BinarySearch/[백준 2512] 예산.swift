//
//  [백준 2512] 예산.swift
//  Algorithm
//
//  Created by 김민 on 5/30/24.
//
// 백준 2512 예산 https://www.acmicpc.net/problem/2512

/*
[📌 전략]
 상한액의 모든 경우의 수를 순회하면서 가능한 한 최대의 총 예산을 배정하면 시간 초과.
 시간 단축 위해 이분 탐색 사용

[✅ 풀이]
 상한액의 최대값은 입력받은 예산 요청 중의 최댓값이므로, 1~최댓값 범위에서 이분 탐색을 실시하며 최대 상한액을 찾는다.
*/

let n = Int(readLine()!)!
let reqs = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!

var st = 1
var en = reqs.max()!
var mx = -1

while st <= en { // 이분 탐색
    let mid = (st + en) / 2
    var sum = 0

    for req in reqs { // 요청받은 예산을 순회하기
        if req > mid { // mid 값보다 요청이 크면은 mid 값 더하기
            sum += mid
        } else { // 이외의 경우에는 요청값 사용 가능
            sum += req
        }
    }

    if sum > m { // 합이 m보다 큰 경우에는 왼쪽 범위 탐색
        en = mid - 1
    } else { // 합이 m보다 작거나 같은 경우에는 오른쪽 범위 탐색
        st = mid + 1

        if mid > mx { mx = mid }
    }
}

print(mx)
