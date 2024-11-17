//
//  [백준 15657] N과 M(8).swift
//  Algorithm
//
//  Created by 김민 on 1/21/24.
//
// 백준 15657 N과 M(8) https://www.acmicpc.net/problem/15657

/*
[📌 전략]
탐색 시작점을 파라미터로 받아 오름차순으로 조합 뽑기
N과 M(6) 문제와 동일하지만, 같은 수를 여러 번 뽑을 수 있다는 점

[✅ 풀이]
 1. 입력받은 수열 정렬
 2. findSequence(k:i:) - k개의 숫자를 택한 상황에서, 숫자 i부터 뽑겠다고 정의한 함수
    - m개의 수가 모두 뽑혔으면 수열 조합 저장 후 탈출
    - 파라미터로 전달받은 수 i부터 순회하며 오름차순으로 수열을 뽑도록 한다
    - findSequence에 k+1과, j를 그대로 파라미터로 넘겨주어 같은 수도 뽑을 수 있도록
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""
var arr = Array(repeating: "", count: m)

nums.sort()

func findSequence(_ k: Int, _ i: Int) {
    if k == m {
        result += arr.joined(separator: " ") + "\n"
        return
    }

    for j in i..<n {
        arr[k] = "\(nums[j])"
        findSequence(k+1, j)
    }
}

findSequence(0, 0)
print(result)
