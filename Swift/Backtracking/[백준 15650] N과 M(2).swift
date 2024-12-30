//
//  [백준 15650] N과 M(2).swift
//  Algorithm
//
//  Created by 김민 on 1/18/24.
//
// 백준 15650 N과 M(2) https://www.acmicpc.net/problem/15650

/*
[📝 기록]
조합 구하기 문제

[📌 전략]
N = 4, m = 2일 때 output:
 1 2
 1 3
 1 4
 2 3
 2 4
 3 4
하나의 조합에서 다음 수는 그 전 수보다 크다는 점을 이용하여 이를 체크할 수 있는 파라미터를 하나 더 추가한다.

[✅ 풀이]
findSequence: k개의 숫자를 택한 상황에서, 수 i부터 뽑을 수 있는 가능성이 있는 함수
k == m이 되면 뽑은 조합을 출력하고 return
아직 방문하지 않았다면 방문했다는 표시 후 findSequence 호출.
현재 findSequence 함수가 종료됐을 시 해당 위치를 방문하지 않았다고 수정
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = Array(repeating: 0, count: 10)
var isUsed = Array(repeating: false, count: 10)
var result = ""

func findsequence(_ k: Int, _ i: Int) {
    if k == m { // m개가 뽑혔을 시에는 결과 조합 저장
        for j in 0..<m {
            result += "\(nums[j]) "
        }
        result += "\n"
        return
    }

    for j in i...n { // 파라미터로 받은 i부터 순회하여 이전 수와 같은 지점부터 탐색
        if !isUsed[j] {
            isUsed[j] = true
            nums[k] = j
            findsequence(k+1, j)
            isUsed[j] = false
        }
    }
}

findsequence(0, 1) 
print(result)
