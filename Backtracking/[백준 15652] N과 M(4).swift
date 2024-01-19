//
//  [백준 15652] N과 M(4).swift
//  Algorithm
//
//  Created by 김민 on 1/19/24.
//
// 백준 15652 N과 M(4) https://www.acmicpc.net/problem/15652

/*
[📝 기록]
수열을 뽑을 때 중복을 허용하지만, 뽑은 수열은 비내림차순이어야 함

[✅ 풀이]
findSequence(k:i:) - k개의 숫자를 택한 상황에서, 숫자 i부터 뽑겠다고 정의한 함수
고른 수열의 요소 개수가 m개가 되면 탈출
파라미터로 받은 i부터 순회하며 하나의 수열이 비내림차순이 되도록 설정
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = Array(repeating: "", count: m)
var result = ""

func findSequence(_ k: Int, _ i: Int) {
    if k == m { // 고른 수열의 요소 개수가 m개가 되면 출력을 위해 저장
        result += nums.joined(separator: " ") + "\n"
        return
    }

    for j in i...n { // 파라미터로 받은 i부터 시작하여 고른 수열이 비내림차순이도록
        nums[k] = "\(j)"
        findSequence(k+1, j)
    }
}

findSequence(0, 1)
print(result)
