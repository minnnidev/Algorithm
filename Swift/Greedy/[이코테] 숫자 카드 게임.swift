//
//  [이코테] 숫자 카드 게임.swift
//  Algorithm
//
//  Created by 김민 on 12/9/23.
//

// 각 행마다 가장 작은 수를 찾고, 그 중 가장 큰 수를 구한다
// 입력
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (line[0], line[1])
var nums = Array(repeating: [Int](), count: N)
var result = 0

// 각 행마다 가장 작은 수를 찾고, 그보다 큰 수가 나오면 갱신
for i in 0..<N {
    nums[i] = readLine()!.split(separator: " ").map { Int($0)! }

    let minValue = nums[i].min()!
    result = max(minValue, result)
}

print(result )
