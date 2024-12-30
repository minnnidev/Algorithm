//
//  [백준 14921] 용액 합성하기.swift
//  Algorithm
//
//  Created by 김민 on 4/2/24.
//
// 백준 14921 용액 합성하기 https://www.acmicpc.net/problem/14921

/*
[📌 전략]
 n이 100,000 이하이므로 모든 용액을 탐색해가며 조합을 구하는 것은 시간 초과가 나 투 포인터로 풀이했다.
 st와 en 포인터를 양끝에 두고,
 두 용액 합이 0보다 작다면 st를 오른쪽으로 이동시켜 특성합을 크게 하고
 두 용액 합이 0보다 크다면 en을 왼쪽으로 이동시켜 특성합을 작게한다.

 두 용약의 합의 절댓값이 원래 저장되어 있는 값보다 작다면 갱신한다.
*/

let n = Int(readLine()!)!
var liquids = readLine()!.split(separator: " ").map { Int($0)! }

var st = 0
var en = n-1
var ans = Int.max

while st < en {
    let sum = liquids[st]+liquids[en]
    
    if abs(sum) < abs(ans) { ans = sum }

    if sum == 0 { break }
    else if sum < 0 { st += 1 }
    else { en -= 1 }
}

print(ans)
