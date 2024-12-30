//
//  [백준 1541] 잃어버린 괄호.swift
//  Algorithm
//
//  Created by 김민 on 10/25/24.
//
// 백준 1541 잃어버린 괄호 https://www.acmicpc.net/problem/1541

/*
[📌 전략]
 최솟값을 만들기 위해서는 빼기 뒤에 최대한 큰 수를 두기
 - 를 기준으로 - 수식 뒤에 +가 오면 빼기로, -가 오면 그대로 -로 두기

 1. -를 기준으로 수식을 split
 2. split한 수식을 순회하며, 각 요소들의 누적합 구하기
 3. index 0일 때는 - 부호가 없는 양수이거나, +로 이루어진 값들이므로 answer에 그대로 더해주기
 4. 나머지 index일 때는 -로 split된 요소들이므로, answer에 음수로 더해주기
*/

let line = readLine()!.split(separator: "-")
var ans = 0

for i in 0..<line.count {
    let sum = line[i].split(separator: "+").map { Int($0)! }.reduce(0, +)

    if i == 0 {
        ans += sum
    } else {
        ans -= sum
    }
}

print(ans)
