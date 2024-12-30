//
//  [백준 1806] 부분합.swift
//  Algorithm
//
//  Created by 김민 on 3/20/24.
//
// 백준 1806 부분합 https://www.acmicpc.net/problem/1806

/*
[📌 전략][✅ 풀이]
 선택된 수들의 부분합을 가질 변수 sum이 필요하다.
 st, en 포인터를 만들고
 합이 s보다 작다면 en을 이동시켜 s보다 크게 만든다.
 이때 길이를 측정하여 최솟값일 시 갱신한다.
 s보다 합이 커지면 바로 st를 이동시켜 다시 부분합에 대한 탐색을 이어간다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, s) = (line[0], line[1])
var arr = readLine()!.split(separator: " ").map { Int($0)! }

var mn = Int.max
var en = 0
var sum = arr[0]

for st in 0..<n {
    while (en < n && sum < s) {
        en += 1
        if en < n { sum += arr[en] }
    }
    if (en == n) { break } // 증가시킨 en이 n이면 탈출
    mn = min(mn, en-st+1) // 최소 길이 갱신
    sum -= arr[st] // 합에서 st값을 빼준다
}

print(mn == Int.max ? 0 : mn)
