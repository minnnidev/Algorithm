//
//  main.swift
//  Algorithm
//
//  Created by 김민 on 2023/09/17.
//
// 백준 2230 수 고르기 https://www.acmicpc.net/problem/2230

// 1. 기본 이중 for문으로 만들어 보기 -> 시간 복잡도가 O(n^2)라 시간 초과가 날 것
/*
알 수 있는 것
1. i가 증가함에 따라 a[j] - a[i]가 m 이상이 되는 최초의 지점 j 또한 증가함
2. 수열을 정렬하면, M 이상의 차이 중 가장 작은 경우를 뽑기 때문에 최초의 지점을 찾으면 그 뒤는 확인할 필요가 없음
*/
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (N, M) = (line[0], line[1]) // N: 수열 요소 개수 / M: 최소 차이
//var nums = [Int]()
//
//for _ in 0..<N {
//    nums.append(Int(readLine()!)!)
//}
//var answer = Int.max
//for i in 0..<N {
//    for j in i..<N {
//        if nums[j] - nums[i] >= M {
//            answer = min(answer, nums[j] - nums[i])
//        }
//    }
//}
//
//print(answer)

// 2. 투포인터 이용하기

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1]) // N: 수열 요소 개수 / M: 최소 차이
var nums = [Int]()

for _ in 0..<N {
    nums.append(Int(readLine()!)!)
}

nums.sort(by: <)

var start = 0
var end = 0
var diff = Int.max

while (start <= end && end < N) { // 범위를 만족할 때 순회
    if nums[end] - nums[start] < M { // 차이가 M보다 작다면
        end += 1 // end 포인터를 증가시킨다
    } else { // 차이가 M보다 크거나 같다면
        diff = min(diff, nums[end] - nums[start]) // 최소 차를 찾아 diff를 갱신한다
        start += 1
    }
}

print(diff)
