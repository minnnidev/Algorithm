//
//  [백준 15656] N과 M(7).swift
//  Algorithm
//
//  Created by 김민 on 1/21/24.
//
// 백준 15656 N과 M(7) https://www.acmicpc.net/problem/15656

/*
[📌 전략]
백트래킹으로 조합 뽑기
가능한 모든 조합을 뽑으면 되어서 방문 여부 배열을 사용하지 않아도 된다.

[✅ 풀이]
1. 사전순으로 증가하는 순서로 출력하기 위해 입력받은 nums 정렬
2. k개를 선택한 상황에서 arr[k]를 정의하는 함수 findSequence 정의
    - m개를 모두 뽑았으면 결과 저장 및 return
    - 정렬한 nums를 순회하며 조합 뽑기
    - findSequence(k+1)을 호출하여 k+1개를 선택한 상황에 대하여 판단
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var result = ""
var isUsed = Array(repeating: false, count: n)
var arr = Array(repeating: "", count: m)
var nums = readLine()!.split(separator: " ").map { Int($0)! }

nums.sort()

func findSequence(_ k: Int) {
    if k == m {
        result += arr.joined(separator: " ") + "\n"
        return
    }

    for i in 0..<n {
        arr[k] = "\(nums[i])"
        findSequence(k+1)
    }
}

findSequence(0)
print(result)
