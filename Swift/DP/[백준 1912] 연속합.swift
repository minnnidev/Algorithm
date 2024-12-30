//
//  [백준 1912] 연속합.swift
//  Algorithm
//
//  Created by 김민 on 2/23/24.
//
// 백준 1912 연속합 https://www.acmicpc.net/problem/1912

/*
[📌 전략][✅ 풀이]
dp[i]: i번째 인덱스의 수를 마지막으로 하는 연속하는 수들의 최대 합
입력되는 수열을 nums라 하면, dp[i]는
1. nums[i]를 마지막으로 포함하여 연속적으로 선택을 했을 때의 최대 합 = dp[i-1] + nums[i]
2. 연속적으로 선택하지 않고 nums[i]만 선택했을 때 = nums[i]
총 2가지 경우가 올 수 있고 이중 큰 값으로 dp[i]에 저장
최종 답은 dp 값들 중 최댓값이 된다.
*/

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n)

for i in 0..<n {
    if i == 0 {
        dp[0] = nums[0]
        continue
    }

    dp[i] = max(dp[i-1] + nums[i], nums[i])
}

print(dp.max()!)
