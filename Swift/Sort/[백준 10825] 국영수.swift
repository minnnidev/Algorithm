//
//  [백준 10825] 국영수.swift
//  Algorithm
//
//  Created by 김민 on 2/20/24.
//
// 백준 10825 국영수 https://www.acmicpc.net/problem/10825

/*
[📌 전략]
문제의 주어진 정렬 조건들만 알맞게 표현해 주면 된다.
튜플 사용 시 헷갈림을 방지하기 위해 이름, 국어 점수, 영어 점수, 수학 점수를 가지는 Student 타입을 만들어 주었다.
*/

typealias Student = (name: String, k: Int, e: Int, m: Int)
let n = Int(readLine()!)!
var students = [Student]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { String($0) }
    students.append((name: line[0],
                     k: Int(line[1])!,
                     e: Int(line[2])!,
                     m: Int(line[3])!))
}

students.sort {
    guard $0.k == $1.k else { return $0.k > $1.k } // 국어 점수가 같으면 밑으로, 같지 않으면 감소하는 순서로 정렬
    guard $0.e == $1.e else { return $0.e < $1.e } // 영어 점수도 같으면 밑으로, 같지 않으면 증가하는 순서로 정렬
    guard $0.m == $1.m else { return $0.m > $1.m } // 수학 점수도 같으면 밑으로, 같지 않으면 감소하는 순서로 정렬
    return $0.name < $1.name // 모든 점수가 같으면 이름을 사전순으로 정렬
}

students.forEach {
    print($0.name)
}
