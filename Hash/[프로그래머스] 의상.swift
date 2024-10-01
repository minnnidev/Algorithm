//
//  [프로그래머스] 의상.swift
//  Algorithm
//
//  Created by 김민 on 9/30/24.
//
// 프로그래머스 의상 https://school.programmers.co.kr/learn/courses/30/lessons/42578

/*
[📌 전략]
 해시 및 조합

[✅ 풀이]
 1. [의상 종류: 의상 개수] 딕셔너리로 분리
 2. 각 의상 종류에 대해 (의상 개수 + 1)을 하여 각각 곱해줌
    - 해당 의상을 입지 않는 경우도 고려하여 1을 더해줌
 3. 전부 곱한 값에 1을 빼면 최종 답
    - 아무것도 입지 않은 경우는 제외
*/

func solution(_ clothes:[[String]]) -> Int {
    var dic = [String: Int]()
    var ans = 0

    for cloth in clothes {
        dic[cloth[1], default: 0] += 1
    }

    ans = dic.map { $0.value + 1 }.reduce(1, *) - 1

    return ans
}
