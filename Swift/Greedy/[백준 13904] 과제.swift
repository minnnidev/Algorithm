//
//  [백준 13904] 과제.swift
//  Algorithm
//
//  Created by 김민 on 7/15/24.
//
// 백준 13904 과제 https://www.acmicpc.net/problem/13904

/*
[📌 전략]
 최대한 점수를 많이 얻을 수 있는 문제를 최대한 미뤄서 선택하는 그리디 문제

[✅ 풀이]
 1. 입력받은 마감일 - 점수들을 점수에 대한 내림차순으로 정렬 (assignments 배열)
 2. ansArr 선언 (각 마감일에 수행하는 과제)
 3. assignments를 순회하며, 마감일부터 1일까지 거꾸로 순회하며 빈 자리가 있을 시 넣기
    거꾸로 순회함을 통해 최대한 미룬 날에 수행할 수 있게 함.
    assignments가 점수의 내림차순으로 구성되어 있기 때문에, 빈자리가 없다면 이미 해당날에 최대한의 점수를 얻기 위해 다른 문제를 풀이한 것
*/

let n = Int(readLine()!)!
var assignments = Array(repeating: [0, 0], count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    assignments[i] = input
}

assignments.sort { $0[1] > $1[1] }

var ansArr = Array(repeating: -1, count: 1003)
var ans = 0

for i in 0..<n {
    let day = assignments[i][0]
    let score = assignments[i][1]

    for j in (1...day).reversed() {
        if ansArr[j] == -1 {
            ansArr[j] = score
            ans += score
            break
        }
    }
}

print(ans)
