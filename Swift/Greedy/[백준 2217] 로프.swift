//
//  [백준 2217] 로프.swift
//  Algorithm
//
//  Created by 김민 on 12/13/23.
//
// 백준 2217 로프 https://www.acmicpc.net/problem/2217

/*
로프들을 이용하여 들어올릴 수 있는 최대 중량 구하기(단, 모든 로프를 사용하지 않아도 된다)
최소 중량을 버틸 수 있는 로프를 최대한 많이 곱하는 게 최대 중량일 것 같지만,
ex. 20 25 70의 로프가 있는 경우에는 20, 20, 20 / 25, 25 / 70 중 70 로프만 사용하는 것이 답이다.
따라서 로프들을 버틸 수 있는 중량에 따라 정렬하고,
위의 에시처럼 사용할 수 있는 최대 개수를 구해서 최대 중량 값을 갱신해가며 답을 구한다.
로프를 버틸 수 있는 중량에 따라 정렬하면, 자기보다 크거나 같게 버틸 수 있는 중량을 가진 로프의 개수만큼 사용할 수 있다.
로프를 병렬로 연결하면 각각의 로프에는 모두 고르게 w/k 만큼의 중량이 걸리게 되기 때문.
*/

let N = Int(readLine()!)!
var nums = [Int]()
var result = 0

for _ in 0..<N {
    nums.append(Int(readLine()!)!)
}

nums.sort()

for i in 0..<N {
    result = max((N-i)*nums[i], result)
}

print(result)
