//
//  [백준 1026] 보물.swift
//  Algorithm
//
//  Created by 김민 on 12/13/23.
//
// 백준 1026 보물 https://www.acmicpc.net/problem/1026

/*
A의 가장 큰 수와 B의 가장 작은 수를 곱하면 S의 최솟값을 만들 수 있다.
B 배열을 정렬하면 안 된다고 했지만, S의 최솟값 자체만 출력하면 되므로 풀이에서 A, B를 모두 정렬해도 상관 없다.
A는 내림차순, B는 오름차순으로 정렬하여 각 배열에서 해당 순서의 요소들을 곱한 뒤 더해준다.
*/

let N = Int(readLine()!)!
var A = readLine()!.split(separator: " ").map { Int($0)! }
var B = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

A.sort(by: >)
B.sort()

for i in 0..<N {
    result += (A[i] * B[i])
}

print(result)
