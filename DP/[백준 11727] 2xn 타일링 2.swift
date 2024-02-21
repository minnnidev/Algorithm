//
//  [백준 11727] 2xn 타일링 2.swift
//  Algorithm
//
//  Created by 김민 on 2/21/24.
//
// 백준 11727 2xn 타일링 2 https://www.acmicpc.net/problem/11727

/*
[📌 전략] [✅ 풀이]
dp[i] = 2*i 직사각형을 채우는 방법의 수
직사각형의 왼쪽 위쪽에 먼저
1. 1*2 타일을 놓는다고 가정
하단에는 반드시 1*2 타일 필요, 직사각형에서 채워진 부분 2*2를 제외한 나머지 부분을 채우기 dp[i-2]
2. 2*1 타일을 놓는다고 가정
직사각형에서 채워진 부분 2*1을 제외한 나머지 부분을 채우기 dp[i-1]
3. 2*2 타일을 놓는다고 가정
직사각형에서 채워진 부분 2*2를 제외한 나머지 부분을 채우기 dp[i-2]

따라서 dp[i] = 2*dp[i-2] + dp[i-1]
저장할 땐 10,007로 나눈 나머지를 저장하기
*/

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: 10003)

for i in 1...n {
    if i == 1 { dp[1] = 1 }
    else if i == 2 { dp[2] = 3 }
    else {
        dp[i] = (2 * dp[i-2] + dp[i-1]) % 10007
    }
}

print(dp[n])
