//
//  [이코테] 1이 될 때까지.swift
//  Algorithm
//
//  Created by 김민 on 12/9/23.
//

// 1. N이 1이 될 때까지 계산 과정을 최소화해야 한다 -> K로 최대한 많이 나눌 수 있도록 해야 함
let line = readLine()!.split(separator: " ").map { Int($0)! }
var (N, K) = (line[0], line[1])
var result = 0

while N >= K {
    while N % K != 0 { // N이 K로 나누어떨어질 때만 계산 가능
        N -= 1 // 나누어떨어지지 않는다면, 나누어떨어질 때까지 -1
        result += 1
    }

    N /= K
    result += 1
}

while N > 1 {
    N -= 1
    result += 1
}

print(result)
