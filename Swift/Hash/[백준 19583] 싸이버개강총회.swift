//
//  [백준 19583] 싸이버개강총회.swift
//  Algorithm
//
//  Created by 김민 on 8/13/24.
//
// 백준 19583 싸이버개강총회 https://www.acmicpc.net/problem/19583

/*
[📌 포인트]
 - Swift 무한 입력 받기
 - 출석 조건 1번 조건을 만족하는 사람, 2번 조건을 만족하는 사람의 공통 집합 구하기

[✅ 풀이]
 1. 무한 입력받기
    - while let _ = readLine() 사용
 2. 출석 조건 만족하는지 체크
    - 개강 총회 시작시간까지 채팅을 남긴 사람을 1번 set에 담기
    - 개강 총회 끝난시간 ~ 개강총회 스트리밍이 끝난 시간 내에 채팅을 남긴 사람을 2번 set에 담기
 3. 최종적으로 출석조건을 다 만족하는 사람 구하기
    - 1번과 2번의 공통 set의 요소 수 출력
*/

let times = readLine()!.split(separator: " ").map { String($0) }
let (start, end, streamingEnd) = (times[0], times[1], times[2])
var startAns = Set<String>()
var endAns = Set<String>()

while let chat = readLine() {
    let tc = chat.split(separator: " ").map { String($0) }

    let (chatTime, name) = (tc[0], tc[1])

    if start >= chatTime {
        startAns.insert(name)
    }

    if chatTime >= end && chatTime <= streamingEnd {
        endAns.insert(name)
    }
}

print(startAns.intersection(endAns).count)
