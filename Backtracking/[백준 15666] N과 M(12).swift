//
//  [백준 15666] N과 M(12).swift
//  Algorithm
//
//  Created by 김민 on 1/23/24.
//
// 백준 15666 N과 M(12) https://www.acmicpc.net/problem/15666

/*
[📌 전략]
트리 구조로 모든 경우를 그려봤을 때, 같은 레벨에서 마지막항이 이전 수열의 마지막항과 같은 경우 중복이다.
따라서 변수를 하나 추가해 주어 이전 수열의 마지막항과 같은지 판단해야 한다.
함수 파라미터로 인덱스를 받아 해당 위치부터 수를 뽑아 고른 수열이 비내림차순이도록 한다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""
var arr = Array(repeating: "", count: m)

nums.sort() // 사전순 출력 위해 정렬

// k개의 수를 뽑은 상태에서 arr[k]를 정의. start 인덱스 위치부터 arr[k] 정의 가능
func findSequence(_ k: Int, _ start: Int) {
    if k == m { // m개가 뽑혔다면 결과 출력 및 return
        result += arr.joined(separator: " ") + "\n"
        return
    }

    var prev = 0 // 마지막 항 저장 위한 변수 선언
    for i in start..<n {
        if prev != nums[i] { // 마지막 항과 다르다면 중복 x
            arr[k] = "\(nums[i])"
            prev = nums[i]
            findSequence(k+1, i)
        }
    }
}

findSequence(0, 0)
print(result)

