//
//  [백준 15665] N과 M(11).swift
//  Algorithm
//
//  Created by 김민 on 1/23/24.
//
// 백준 15665 N과 M(11) https://www.acmicpc.net/problem/15665
/*
[📌 전략]
트리 구조로 모든 경우를 그려봤을 때, 같은 레벨에서 마지막항이 이전 수열의 마지막항과 같은 경우 중복이다.
따라서 변수를 하나 추가해 주어 이전 수열의 마지막항과 같은지 판단해야 한다.
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""
var arr = Array(repeating: "", count: m)

nums.sort() // 사전순 출력 위해 정렬

// k개의 수를 선택한 상황에서 nums[k]를 정의하는 함수
func findSequence(_ k: Int) {
    if k == m { // m개를 뽑았다면 겨로가 저장 후 return
        result += arr.joined(separator: " ") + "\n"
        return
    }

    var prev = 0 // prev 변수를 만들어 이전 수열의 마지막항 저장
    for i in 0..<n {
        if prev != nums[i] { // prev와 비교하여 중복인지 확인
            arr[k] = "\(nums[i])"
            prev = nums[i]
            findSequence(k+1)
        }
    }
}

findSequence(0)
print(result)
