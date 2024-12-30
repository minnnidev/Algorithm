//
//  [백준 11659] 구간 합 구하기 4.swift
//  Algorithm
//
//  Created by 김민 on 2/19/24.
//
// 백준 11659 구간 합 구하기 4 https://www.acmicpc.net/problem/11659

/*
[📌 전략]
N과 M이 10만이기 때문에 주어진 모든 i, j 범위에 따라
입력받은 숫자들을 순회하며 합을 구하는 코드는 시간 초과가 발생한다.

따라서 누적 합 개념을 사용할 수 있는데,
예를 들어
5 4 3 2 1 의 누적 합을 구해보면
5 9 12 14 15 이다.

2~4의 구간 합을 구할 때는 세 번째 누적합 12에서 첫 번째 누적합을 빼 주면 된다.
결론적으로 i, j 범위의 구간합은 누적합[j] - 누적합[i-1]과 같아진다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = [0] // 쉬운 인덱스 처리를 위하여 0으로 초깃값 세팅
var ranges = Array(repeating: [0, 0], count: m)

nums.append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })

// 배열을 따로 만들 수도 있으나 입력받은 nums 배열을 수정하여 누적합 배열로 만듦
for i in 1...n {
    nums[i] += nums[i-1]
}

for _ in 0..<m { // 각 범위에따라 누적합[j] - 누적합[i-1] 사용하여 구간합 구하기
    let ranges = readLine()!.split(separator: " ").map { Int($0)! }
    print(nums[ranges[1]] - nums[ranges[0]-1])
}
