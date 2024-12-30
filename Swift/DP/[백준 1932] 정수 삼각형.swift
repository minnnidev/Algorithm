//
//  [백준 1932] 정수 삼각형.swift
//  Algorithm
//
//  Created by 김민 on 2/21/24.
//
// 백준 1932 정수 삼각형 https://www.acmicpc.net/problem/1932

/*
[📌 전략]
dp로 풀이하되 삼각형에서 아래층으로 내려올 때 인덱스만 조심해서 풀이하면 된다.

[✅ 풀이]
dp 테이블을 따로 만들지 않고 입력받은 2차원 배열을 그대로 이용해서 풀이했다.
nums[i][j]는 이전 층에서 (i, j) 좌표로 내려왔을 때 현재까지 선택된 수의 합의 최댓값으로 정의한다.

삼각형의 행을 i라 하고 이를 순회할 때,
1. 0열의 정수는 위층의 0열에서만 내려올 수 있다.
2. i열의 정수는 위층의 i-1열에서만 내려올 수 있다.
3. 나머지 열(j)의 정수는 위층의 j-1열, j열 2가지 경우에서 내려올 수 있는데, 선택된 수의 합이 최대가 되는 경로를 구해야 하므로, 둘 중 최댓값을 고른다.

현재 층의 정수에 위층의 정수를 더해야 하므로 기존 nums[i][j]에 이전 층의 알맞은 값을 더해준다.
최종 답은 마지막 층의 최댓값이 된다.
[📝 기록]
*/

let n = Int(readLine()!)!
var nums = Array(repeating: [Int](), count: n)

for i in 0..<n {
    nums[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

for i in 1..<n {
    for j in 0..<nums[i].count {
        if j == 0 {
            nums[i][j] += nums[i-1][0]
        } else if j == i {
            nums[i][j] += nums[i-1][j-1]
        } else {
            nums[i][j] += max(nums[i-1][j-1], nums[i-1][j])
        }
    }
}

print(nums[n-1].max()!)
