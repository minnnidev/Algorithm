//
//  [백준 7570] 줄 세우기.swift
//  Algorithm
//
//  Created by 김민 on 12/21/23.
//
// 백준 7570 줄 세우기 https://www.acmicpc.net/problem/7570

/*
오름차순 수열만 유지하며 자리를 바꾸는 전략으로 접근했었는데, 결국 풀지 못했다.
내가 놓쳤던 것은 맨 앞과 맨 뒤로만 자리를 이동할 수 있다는 점 때문에 단순하게 오름차순 수열이 아닌 연속된 오름차순 수열을 지키면서 이동해야 한다는 뜻이었다.
연속된 최장 수열만 찾으면 나머지는 결국 맨 앞이든 맨 뒤로든 한번씩만 이동하면, 이것이 최소의 경우이다.
예를 들어 [5, 1, 4, 2, 3]은 [1, 2, 3]을 제외하고 4와 5를 이동시켜 답을 구할 수 있다.

[풀이]
positions 배열을 만들어  요소의 순서에 따라 해당 어린이의 위치를 저장한다.
ex.
입력받은 어린이 배열: [5, 2, 4, 1, 3]
positions: [3, 1, 4, 2, 0]
positions를 순회하며, 현재 요소가 다음 요소보다 작다면, 연속됐다는 의미이므로 카운트를 한다. 그리고 최장 연속 수열의 길이를 갱신한다.
주의해야 할 점은 전체 어린이 수(N)이 아닌, N-1에서 최장 연속 수열의 길이를 빼주어야 한다.
최장 연속 수열이 존재하든 존재하지 않든, 한 부분을 기준으로 순서를 이동시키기 때문에 이를 고려한 1을 뺀 값을 초기값으로 생각해야 한다.
*/

let N = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var positions = Array(repeating: 0, count: N)
var count = 0
var maxCount = 0

for i in 0..<N {
    positions[nums[i]-1] = i
}

print(positions)

for i in 0..<N-1 {
    if positions[i] < positions[i+1] {
        count += 1
        maxCount = max(maxCount, count)
    } else {
        count = 0
    }
}


print((N-1) - maxCount)
