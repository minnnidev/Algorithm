//
//  [백준 1476] 날짜 계산.swift
//  Algorithm
//
//  Created by 김민 on 9/25/24.
//
// 백준 1476 날짜 계산 https://www.acmicpc.net/problem/1476

/*
[📌 전략]
 따로 전략은 없음. 문제 그대로 구현.

[✅ 풀이]
 입력받은 연도와 일치할 때까지 반복해야 하니 while문 선택
    - 각 e, s, m을 늘려가며 최댓값 초과 시 1로 설정
    - 연도 카운트

[📝 기록]
 신한 대비 하려구 문자열 + 날짜 키워드로 검색해서 풀었는데 일케 쉬운 문제일 줄은 몰랐네 🥲
*/

let line = readLine()!
var ans = 1
var (e, s, m) = (1, 1, 1)

while true {
    if "\(e) \(s) \(m)" == line { break }

    e += 1
    s += 1
    m += 1

    if e > 15 { e = 1 }
    if s > 28 { s = 1 }
    if m > 19 { m = 1 }

    ans += 1
}

print(ans)
