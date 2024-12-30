//
//  [백준 10814] 나이순 정렬 #2.swift
//  Algorithm
//
//  Created by 김민 on 10/11/24.
//
// 백준 10814 나이순 정렬 https://www.acmicpc.net/problem/10814

/*
[📌 전략]
 나이순, 나이가 같으면 가입한 순으로 정렬
 입력된 순서가 가입된 순서이므로 나이순 정렬만 해 주면 된다.

[✅ 풀이]
 1. (나이, 이름) 형식으로 입력받기 -> arr 배열
 2. arr 배열을 나이순으로 오름차순 정렬
 3. 순회하며 출력
*/


let n = Int(readLine()!)!
var arr = [(Int, String)]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ")
    arr.append((Int(line[0])!, String(line[1])))
}

arr.sort { $0.0 < $1.0 }

arr.forEach {
    print($0.0, $0.1)
}
