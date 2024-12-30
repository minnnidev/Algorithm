//
//  [백준 1182] 부분수열의 합.swift
//  Algorithm
//
//  Created by 김민 on 1/28/24.
//
// 백준 1182 부분수열의 합 https://www.acmicpc.net/problem/1182

/*
[📌 전략]
 모든 조합을 구하고 각 조합의 합이 s인지를 확인한다
start번째 인덱스부터 탐색을 시작하여 수를 뽑고,
depth 정보를 받아 하나의 조합에 1개 이상의 수가 뽑혔을 때부터 s인지 확인한다.
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, s) = (line[0], line[1])
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var sum = 0
var count = 0

// start번째 인덱스부터 탐색을 시작하는 함수, depth는 하나의 조합에 선택된 수의 개수를 뜻한다.
func backTracking(_ start: Int, _ depth: Int) {
    if sum == s && depth >= 1 { // depth가 1 이상이고(공집합은 포함x), sum이 s와 같다면 count
        count += 1
    }

    for i in start..<n { // 인자로 받은 start부터 순회
        sum += nums[i]
        backTracking(i+1, depth+1) // i+1을 start 인자의 값으로 넣어 자신을 제외한 다음 수열부터 탐색하도록
        sum -= nums[i]
    }
}

backTracking(0, 0)
print(count)
