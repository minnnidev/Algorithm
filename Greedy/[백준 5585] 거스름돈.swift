//
//  [백준 5585] 거스름돈.swift
//  Algorithm
//
//  Created by 김민 on 1/13/24.
//
// 백준 5585 거스름돈 https://www.acmicpc.net/problem/5585

/*
[📌 전략]
거스름돈 개수가 가장 적게 잔돈을 주려면, 가치가 큰 동전을 더 많이 써야 한다.

[✅ 풀이]
1. 거슬러 받아야 할 돈을 구한다.
2. 가치가 큰 동전부터 반복문으로 순회한다.
가치가 큰 동전을 최대한 많이 사용하기 위해서, 현재 동전의 가치보다 남아있는 돈이 크다면 계속해서 해당 동전으로 거슬러 주도록 while문으로 구현한다.
거슬러 줄 돈이 0이 되면 탈출한다.
*/

var n = 1000 - Int(readLine()!)!
let coins = [500, 100, 50, 10, 5, 1]
var count = 0

for coin in coins {
    if n == 0 { break }
    while n >= coin {
        n -= coin
        count += 1
    }
}

print(count)
