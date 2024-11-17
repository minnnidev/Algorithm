//
//  [백준 14002] 가장 긴 증가하는 부분 수열 4.swift
//  Algorithm
//
//  Created by 김민 on 5/23/24.
//
// 백준 14002 가장 긴 증가하는 부분 수열 4 https://www.acmicpc.net/problem/14002

/*
[📌 전략]
 가장 긴 증가하는 부분 수열 길이를 구하고, 그 부분 수열을 직접 출력하는 문제
 가장 긴 증가하는 부분 수열은 DP로 풀이 가능

[✅ 풀이]
 1. 가장 긴 증가하는 부분 수열 길이를 구하기
    dp 배열은 현재 수를 포함하는 가장 긴 증가하는 부분 수열의 길이로 정의
    수열 A의 수를 순회하면서, 해당 수를 기준으로 앞의 수열에서 해당 수보다 작은 수들을 찾는다.
    이 작은 수들 중 dp 값이 가장 큰 값을 찾아 기준 수의 dp 값을 더해주면,
    해당 수까지의 가장 긴 증가하는 부분 수열의 길이를 구할 수 있다.
 2. 가장 긴 증가하는 부분 수열 출력하기
    가장 큰 dp값부터 시작하여 순서대로 1까지 찾아간다.
    dp의 max값이 5이면 5->4->3->2->1 순으로 찾아간다. (정답 수열이 여러가지이면 아무거나 출력하면 되므로)
    후에 배열을 뒤집어서 출력한다.
*/

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n)

for i in 0..<n {
    if i == 0 {
        dp[0] = 1
        continue
    }

    var mx = 0
    for j in 0..<i {
        if nums[j] < nums[i] {
            mx = max(mx, dp[j])
        }
    }
    dp[i] += mx
}

var mx = dp.max()!
var answer = [Int]()
var idx = n-1

while mx > 0  {
    if dp[idx] == mx {
        answer.append(nums[idx])
        mx -= 1
    }
    idx -= 1
}

print(dp.max()!)
print(answer.reversed().map { "\($0)" }.joined(separator: " "))
