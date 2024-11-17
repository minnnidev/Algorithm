//
//  [백준 2003] 수들의 합2.swift
//  Algorithm
//
//  Created by 김민 on 7/18/24.
//
// 백준 2003 수들의 합2 https://www.acmicpc.net/problem/2003

/*
[📌 전략]
 이중 for 문을 사용하면 쉽게 풀이할 수 있겠다 -> N(1 ≤ N ≤ 10,000)의 범위를 보니 투 포인터로 O(N)에 해결하자로 접근

[✅ 풀이]
 1. st를 기준으로 for문을 순회한다.
 2. 수열의 st번째 수부터 en번째 수까지의 합을 구했을 때(tmpSum), tmpSum이 M보다 크거나 같을 때까지 en을 오른쪽으로 움직인다.
 3. 수열의 st번째 수부터 en번째 수까지의 합이 M과 같으면 카운트해 준다.
 4. 후에 st를 오른쪽으로 움직이기 위해, tmpSum에서 st번째 수를 빼주어 tmpSum을 정리한다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var en = 0
var tmpSum = arr[0]
var ans = 0

for st in 0..<n {
    while en < n && tmpSum < m {
        en += 1

        if en < n { tmpSum += arr[en] }
    }

    if tmpSum == m { ans += 1 }

    tmpSum -= arr[st]
}

print(ans)
