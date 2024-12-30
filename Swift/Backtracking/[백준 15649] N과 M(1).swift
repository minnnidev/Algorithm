//
//  [백준 15649] N과 M(1).swift
//  Algorithm
//
//  Created by 김민 on 1/17/24.
//
// 백준 15649 N과 M(1) https://www.acmicpc.net/problem/15649

/*
[📝 기록]
백트래킹 유형 기본 문제

[✅ 풀이]
k개의 수를 택한 상황에서 nums[k]를 정하는 함수 printSequence(k:) 구현
k가 m과 동일해지면, m개의 수를 뽑았다는 것이므로 출력 후 재귀함수 종료
전체 수 범위 1~N 사이를 순회하며 특정한 수가 아직 쓰이지 않았을 경우 nums[k]에 추가하고 방문 표시를 한다.
탈출 조건을 만족하여 return되면, 해당 위치를 방문하지 않았다로 변경하고, 다음 반복을 이어간다.

ex. N=4, M=2
[1, 2] -> [1, 3] -> [1, 4]
[2, 1] -> [2, 3] -> [2, 4]
[3, 1] -> [3, 2] -> [3, 4]
[4, 1] -> [4, 2] -? [4, 3]
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = Array(repeating: 0, count: 10) // m개의 수열을 담을 배열
var isUsed = Array(repeating: false, count: 10) // 특정 수가 쓰였는지를 체크하는 배열
var result = ""

// k개의 수를 택한 상황에서 nums[k]를 정하는 함수
func printSequence(_ k: Int) {
    if k == m {
        for i in 0..<m {
            result += "\(nums[i]) "
        }
        result += "\n"
        return
    }

    for i in 1...n {
        if !isUsed[i] { // 특정 수가 아직 쓰이지 않았을 경우
            nums[k] = i
            isUsed[i] = true
            printSequence(k+1)
            isUsed[i] = false
        }
    }
}

printSequence(0) // 수를 하나도 택하지 않았으니 파라미터는 0
print(result)
