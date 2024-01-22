//
//  [백준 15663] N과 M(10).swift
//  Algorithm
//
//  Created by 김민 on 1/22/24.
//
// 백준 15663 N과 M(10) https://www.acmicpc.net/problem/15664

/*
[📌 전략]
1. 하나의 수열 조합이 오름차순으로 이루어짐 -> 체크 필요
2. 동일한 길이의 수열일 때, 조합을 구하는 구조를 트리로 표현했을 때 같은 레벨인 경우, 마지막 항이 이전과 동일하면 중복된 조합임.
   따라서 prev라는 변수를 저장하여 중복인지 비교해야 함.
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""
var arr = Array(repeating: "", count: m)

nums.sort() // 사전순 출력 위해 정렬

func findSequence(_ k: Int, _ start: Int) {
    if k == m {
        result += arr.joined(separator: " ") + "\n"
        return
    }

    var prev = ""
    for i in start..<n {
        if prev != "\(nums[i])" {
            arr[k] = "\(nums[i])"
            prev = arr[k]
            findSequence(k+1, i+1) // i+1번째 인덱스부터 탐색하도록 하여 자신보다 크거나 같은 수만 오도록
        }
    }
}

findSequence(0, 0)
print(result)
