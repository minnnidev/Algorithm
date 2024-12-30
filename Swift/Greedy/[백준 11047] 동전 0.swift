//
//  [백준 11047] 동전 0.swift
//  Algorithm
//
//  Created by 김민 on 12/10/23.
//
// 백준 11407 동전 0 https://www.acmicpc.net/problem/11047

/*
필요한 동전 개수의 최솟값을 구하기 위해서는, 가치가 큰 동전을 가장 많이 사용해야 한다. -> 그리디
따라서 가장 큰 가치의 동전을 최대한 많이 빼준 후, 차례대로 과정을 동일하게 진행한다.

[그리디의 알고리즘의 정당성]
동전의 가치가 모두 배수이므로, 작은 가치의 동전들을 종합하여 다른 최적의 해를 찾을 수 없다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
var (N, K) = (line[0], line[1])
var values = [Int]()
var result = 0
var count = 0

for _ in 0..<N {
    let input = Int(readLine()!)!
    if input <= K { values.append(input) } // K보다 큰 가치의 동전은 고려하지 않는다
}

count = values.count - 1

while K > 0 {
    result += K / values[count]
    K %= values[count]
    count -= 1
}

print(result)
