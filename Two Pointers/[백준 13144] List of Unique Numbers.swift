//
//  [백준 13144] List of Unique Numbers.swift
//  Algorithm
//
//  Created by 김민 on 3/22/24.
//
// 백준 13144 List of Unique Numbers https://www.acmicpc.net/problem/13144

/*
[📌 전략]
 1 ≤ N ≤ 100,000이므로, O(N) 이하의 풀이 필요하고, 알맞은 연속한 수열을 뽑기 위해 투 포인터를 사용했다.

[📝 기록]
포인터의 숫자가 현재 선택한 배열에 존재하는지를 어떻게 시간을 단축해서 풀이하지 했는데 방문했는지 여부의 배열을 따로 만들면 풀 수 있는 문제였다.
*/

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var st = 0
var en = 0
var ans = 0
var visited = Array(repeating: false, count: arr.max()!+1) // 방문했는지 여부를 판단할 배열

for st in 0..<n { // st 기준으로 순회
    while en < n { // en을 이동시켜가며 탐색
        if visited[arr[en]] { break } // 이미 방문한 적이 있다면 탈출
        visited[arr[en]] = true // 방문한 적이 없다면 true로 변경
        en += 1 // en에 1을 더하여 한번 더 탐색
    }

    ans += (en-st) // en-st: 1, 2, 3, 4, 5 에서 st = 0, en = 5일 경우 1, 12, 123, 1234, 12345처럼 모두가 해당할 수 있음을 의미
    visited[arr[st]] = false // 방문 여부를 알맞게 탐색하기 위해 st의 값의 인덱스를 방문하지 않았다고 설정해야 함
}

print(ans)
