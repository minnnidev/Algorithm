//
//  [백준 7785] 회사에 있는 사람.swift
//  Algorithm
//
//  Created by 김민 on 5/29/24.
//
// 백준 7785 회사에 있는 사람 https://www.acmicpc.net/problem/7785

/*
[📌 전략]
  Swift에서 수정, 삭제의 시간 복잡도가 O(1)인 set을 사용하여 풀이했다.
*/


let n = Int(readLine()!)!
var set = Set<String>()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { "\($0)" }

    if line[1] == "enter" {
        set.insert(line[0])
    } else {
        set.remove(line[0])
    }
}

set.sorted(by: >)
    .forEach { print($0) }
