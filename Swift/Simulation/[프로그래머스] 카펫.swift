//
//  [프로그래머스] 카펫.swift
//  Algorithm
//
//  Created by 김민 on 9/26/24.
//
// 프로그래머스 카펫 https://school.programmers.co.kr/learn/courses/30/lessons/42842

/*
[📌 전략]
 완전 탐색 문제
 [갈색 테두리는 무조건 1줄이기 때문에 (yellowH + 2)(yellowW + 2) + 4가 brown 개수와 같다]
 는 생각에서부터 시작하였음
[✅ 풀이]
 1. brown에서 4를 뺀 newBrwn 구함
 2. yH를 1~newBrwn/4까지 순회
    - yH <= yW 이기 때문에 위와 같은 범위가 성립
    - 알맞은 yW를 구해주기
    - yH * yW가 yellow 개수와 같을 때 return
[📝 기록]
 코드 작성 자체는 쉬웠지만 풀이 전략 및 문제 이해가 필요했던 문제
*/

// 전체 풀이 전략: (yellowH + 2)(yellowW + 2) + 4가 brown 개수와 같다
func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let newBrwn = brown - 4

    // yellowH는 yellowW보다 작거나 같기 때문에 newbrwn/4보다 클 수 없음
    for yH in 1...newBrwn/4 {
        // yellowW는 yellowH 2개를 newBrown에서 뺀 값 중 하나
        let yW = (newBrwn-2*yH)/2

        // yellow 면적과 같을 시 return
        if yH*yW == yellow {
            return [yW+2, yH+2]
        }
    }

    return []
}
