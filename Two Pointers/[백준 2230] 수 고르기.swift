//
//  [백준 2230] 수 고르기.swift
//  Algorithm
//
//  Created by 김민 on 3/20/24.
//
// 백준 2230 수 고르기 https://www.acmicpc.net/problem/2230

/*
[📌 전략][✅ 풀이]
 차이가 m 이상인 두 수를 구하되, 차이가 가장 작은 경우를 찾는 문제
 투 포인터를 통해 풀이하였으며, 차이가 가장 적은 경우를 구하기 위해 정렬을 실시한다.
 초기 상태에는 모두 포인터 2개가 첫 번째 요소를 가리킨다.
 수의 차이가 m보다 작으면 en을 큰 수로 이동시켜가며 차이가 m보다 큰 경우를 찾아나간다.
 이 과정에서 발생한 차이에 대한 최솟값을 갱신한다.
 차이가 m보다 큰 경우가 발생하면, 바로 st를 오른쪽으로 이동시켜 st에 대한 차이를 탐색한다.
*/

//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, m) = (line[0], line[1])
//var arr = [Int]()
//
//for _ in 0..<n {
//    arr.append(Int(readLine()!)!)
//}
//
//arr.sort()
//
//var st = 0
//var en = 0
//var min = Int.max
//
//while st <= en  && en < n {
//    let sub = arr[en] - arr[st]
//    if sub > m {
//        st += 1
//        if sub < min { min = sub }
//    } else if sub < m {
//        en += 1
//    } else {
//        min = m
//        break
//    }
//}
//
//print(min)

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var arr = [Int]()

for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

arr.sort()

var en = 0
var mn = Int.max

for st in 0..<n {
    while (en < n && arr[en] - arr[st] < m) { en += 1 }
    if en == n { break } // 증가시킨 n이 en이면 탈출
    mn = min(mn, arr[en] - arr[st]) // 최소 차이 갱신
}

print(mn)
