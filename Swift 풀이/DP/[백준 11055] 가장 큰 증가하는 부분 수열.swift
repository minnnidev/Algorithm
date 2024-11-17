//
//  [백준 11055] 가장 큰 증가하는 부분 수열.swift
//  Algorithm
//
//  Created by 김민 on 2/22/24.
//
// 백준 11055 가장 큰 증가하는 부분 수열 https://www.acmicpc.net/problem/11055

/*
[📌 전략]
dp[i]: i번째 인덱스까지의 가장 큰 증가하는 부분 수열의 합
i번째 인덱스의 수보다 적은 값의 dp로부터 값을 가져와야 한다.

[✅ 풀이]
1. 입력받은 수열에서 i번째 인덱스 이전의 수들 중 i번째 인덱스의 값보다 작은 수를 찾는다.
2. 해당 수들 중 dp 값이 가장 큰 값을 찾아 i번째 인덱스의 값을 더한다.
   - for문을 사용하여 i번째 인덱스 이전 수들을 찾고, 그 수들 중 dp의 max값을 찾는다.
3. 현재 수열이 증가하는 수열에 포함되어 있다면 찾은 max값을, 증가하는 수열의 첫 번째 값이라면 0을 더하기
4. 전체 dp 배열의 max 값 출력
*/

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = nums

for i in 0..<n {
    if i == 0 { continue }

    var mx = 0
    for j in 0..<i {
        if nums[j] < nums[i] {
            mx = max(mx, dp[j])
        }
    }
    dp[i] += mx
}

print(dp.max()!)
