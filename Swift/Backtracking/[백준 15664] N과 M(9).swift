//
//  [백준 15664] N과 M(9).swift
//  Algorithm
//
//  Created by 김민 on 1/21/24.
//
// 백준 15664 N과 M(9) https://www.acmicpc.net/problem/15663

/*
[📝 기록]
기존 N과 M 문제들과 다르게 입력받는 자연수들이 모두 다르다는 보장이 없는 문제
약간의 변형이 들어가서 그런지 정답율이 뚝 떨어졌다

[📌 전략]
같은 수열 조합을 어떻게 없애야 할까에 중점을 두고 풀이하기
1. 중복된 수열이 완성되어 뽑히면 무조건 이전 수열 조합과 같다는 점
2. 이전 수열 마지막 항과 현재 수열의 마지막 항이 같다면 중복된 수열인 점
*/

// 1. 완성된 이전 수열과 비교하기
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var result = ""
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var arr = Array(repeating: "", count: m)
var isUsed = Array(repeating: false, count: n)
var prev = [String]()

nums.sort() // 사전순 출력을 위해 정렬

func findSequence(_ k: Int) {
    if prev == arr { // 이전 수열과 같다면 return
        return
    }

    if k == m { // 조합이 완성되면
        prev = arr // prev에 완성된 조합을 넣어 중복 수열 체크
        result += arr.joined(separator: " ") + "\n"
        return
    }

    for i in 0..<n{
        if !isUsed[i] {
            isUsed[i] = true
            arr[k] = "\(nums[i])"
            findSequence(k+1)
            isUsed[i] = false
        }
    }
}

findSequence(0)
print(result)

// 2. 마지막 항과 비교하기
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, m) = (line[0], line[1])
//var result = ""
//var nums = readLine()!.split(separator: " ").map { Int($0)! }
//var arr = Array(repeating: -1, count: m)
//var isUsed = Array(repeating: false, count: n)
//
//nums.sort()
//
//func findSequence(_ k: Int) {
//    if k == m {
//        result += arr.map { String($0) }.joined(separator: " ") + "\n"
//        return
//    }
//
//    var prev = 0
//    for i in 0..<n {
//        if !isUsed[i] && nums[i] != prev { // 방문하지 않았고 prev와 같지 않다면
//            isUsed[i] = true
//            arr[k] = nums[i]
//            prev = arr[k]
//            findSequence(k+1)
//            isUsed[i] = false
//        }
//    }
//}
//
//findSequence(0)
//print(result)
