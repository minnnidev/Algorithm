//
//  [백준 11052] 카드 구매하기.swift
//  Algorithm
//
//  Created by 김민 on 7/23/24.
//
// 백준 11052 카드 구매하기 https://www.acmicpc.net/problem/11052

/*
[📌 전략]
 N개의 카드를 구매하기 위해 민규가 지불해야 하는 금액의 최댓값을 구하기
 dp로 풀이

[✅ 풀이]
 1. 입력
 2. d[i] = i개의 카드를 구매하기 위해 민규가 지불해야 하는 금액의 최댓값
    i가 3일 땨로 가정해 보면,
    d[i] = max(d[3], d[1] + d[2], d[1] + d[1] + d[1]]

    이를 일반화해 보면 k로 1...i 범위를 순회하여, d[k] + d[i-k] 중 최댓값을 찾으면 된다.
 3. 최종 답은 d[n]
*/

let n = Int(readLine()!)!
var d = [0] + readLine()!.split(separator: " ").map { Int($0)! }

for i in 1...n {
    var mx = -1
    for k in 1...i {
        if mx < d[k] + d[i-k] {
            mx = d[k] + d[i-k]
        }
    }

    d[i] = mx
}

print(d[n])
