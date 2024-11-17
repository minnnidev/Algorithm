//
//  [백준 15655] N과 M(6).swift
//  Algorithm
//
//  Created by 김민 on 1/21/24.
//
// 백준 15655 N과 M(6) https://www.acmicpc.net/problem/15655

/*
[📌 전략]
탐색 시작점을 파라미터로 받아 오름차순으로 조합 뽑기

[✅ 풀이]
1. 입력받은 수열 정렬
2. findSequence(k:i:) - k개의 숫자를 택한 상황에서, 숫자 i부터 뽑겠다고 정의한 함수
   - m개의 수가 모두 뽑혔으면 수열 조합 저장 후 탈출
   - 파라미터로 전달받은 수 i부터 순회하며 오름차순으로 수열을 뽑도록 한다
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var result = ""
var arr = Array(repeating: "", count: m)
var matrix = readLine()!.split(separator: " ").map { Int($0)! }

matrix.sort()

func findSequence(_ k: Int, _ i: Int) { //
    if k == m {
        result += arr.joined(separator: " ") + "\n"
        return
    }

    for j in i..<n {
        arr[k] = "\(matrix[j])"
        findSequence(k+1, j+1)
    }
}

findSequence(0, 0)
print(result)
