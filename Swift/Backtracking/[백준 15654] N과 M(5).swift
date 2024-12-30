//
//  [백준 15654] N과 M(5).swift
//  Algorithm
//
//  Created by 김민 on 1/19/24.
//
// 백준 15654 N과 M(5) https://www.acmicpc.net/problem/15652

/*
[📝 기록]
기존 N과 M 문제에서 1~N이 아닌 수들이 주어지는 문제

[📌 전략]
주어진 수들을 오름차순으로 정렬하여 방문하도록 하기

[✅ 풀이]
findSequence - k개를 뽑은 상황에서 arr[k]를 정하는 함수
m개를 모두 선택했다면 출력을 위해 저장 후 return
0..<n 범위를 순회하며 방문하지 않은 인덱스는 방문
수열에는 입력받은 수들을 정렬한 배열에서 해당 인덱스의 값을 넣어 준다.
수열이 뽑혀 return되면 방문했던 곳을 모두 방문하지 않았다고 표시한다.
*/

let lines = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (lines[0], lines[1])
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Array(repeating: "", count: m)
var isUsed = Array(repeating: false, count: 10)
var result = ""

nums.sort() // 증가하는 순서를 출력하기 위해 정렬

// k개를 뽑은 상황에서 num[k]를 정하는 함수
func findSequence(_ k: Int) {
    if k == m { // m개를 모두 선택했다면 출력을 위해 저장
        result += arr.joined(separator: " ") + "\n"
        return
    }

    for i in 0..<n {
        if !isUsed[i] {
            isUsed[i] = true
            arr[k] = "\(nums[i])"
            findSequence(k+1)
            isUsed[i] = false
        }
    }
}

findSequence(0) // 아직 0개를 뽑은 상황
print(result)
