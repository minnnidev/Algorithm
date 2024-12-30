//
//  [백준 2302] 극장 좌석.swift
//  Algorithm
//
//  Created by 김민 on 5/23/24.
//
// 백준 2302 극장 좌석 https://www.acmicpc.net/problem/2302

/*
[📌 전략]
 n개의 좌석에 규칙에 맞춰 n명이 앉을 수 있는 방법을
 1개의 좌석부터 경우의 수를 쓰다 보면 피보나치 수열임을 확인할 수 있다. -> dp로 풀이

[✅ 풀이]
 1. dp 배열 만들고 구하기
    dp[i] = i개의 좌석에 규칙에 맞춰 i명이 앉을 수 있는 방법
    피보나치 수열을 나타내면 dp[i] = dp[i-1] + dp[i-2]
    좌석 수는 최대 40개이므로 40개까지만 구하면 된다.
 2. 총 방법의 가짓수
    고정석들을 기준으로 잘랐을 때 나오는 배열들의 개수의 dp 값을 모두 곱해주면 총 조합의 개수가 나온다.
*/

var dp = Array(repeating: 0, count: 42)
dp[0] = 1
dp[1] = 1
dp[2] = 2

for i in 3...40 {
    dp[i] = dp[i-1] + dp[i-2]
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var vips = [Int]()

for _ in 0..<m {
    let t = Int(readLine()!)!
    vips.append(t)
}

var tmp = 0
var ans = 1

for vip in vips {
    ans *= dp[vip-tmp-1]
    tmp = vip
}

// tmp가 n보다 작아서 고정석을 기준으로 잘랐을 때 뒷 부분 배열이 하나 남을 경우 따로 처리
if tmp < n { ans *= dp[n-tmp] }

print(ans)
