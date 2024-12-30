//
//  [백준 10814] 나이순 정렬.swift
//  Algorithm
//
//  Created by 김민 on 2/8/24.
//
// 백준 10814 나이순 정렬

// 나이 어린순, 나이가 같으면 먼저 가입한 순임ㅋ

/*
[📌 전략]
📌 The sorting algorithm is guaranteed to be stable. - swift language doc
swift의 sorting 알고리즘은 stable함을 보장한다.
stable sort는 정렬을 진행했을 때, 중복된 값의 순서가 바뀌지 않음을 의미한다.

[✅ 풀이]
문제에서 주어진 상황이 나이순으로 정렬하고, 나이가 같으면 먼저 가입한 순으로 정렬하라 요구했다.
가입한 순서대로 입력을 받아 배열에 저장하므로, 나이순 정렬만 실시하면 된다.
[📝 기록]
*/

let n = Int(readLine()!)!
var people = [(Int, String)]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { String($0) }
    people.append((Int(line[0])!, line[1]))
}

people.sort { $0.0 < $1.0 }

people.forEach {
    print($0.0, $0.1)
}
