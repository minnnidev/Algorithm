//
// [프로그래머스] JadenCase.swift
//  Algorithm
//
//  Created by 김민 on 9/25/24.
//
// 프로그래머스 JadenCase 문자열 만들기 https://school.programmers.co.kr/learn/courses/30/lessons/12951

/*
[📌 전략]
 문자열 구현 문제
 조심해야 하는 조건: 공백 문자가 연속해서 나올 수 있다

[✅ 풀이]
 1. 초기값 세팅
    s의 0번째 인덱스가 공백일 때는 공백을, 문자일 때는 무조건 대문자
 2. s 순회
    쉬운 인덱스 계산을 위해 0번째 인덱스일 때는 제외
    기준 문자의 앞 문자가 공백이면 단어의 첫 번째 글자라는 뜻 -> 대문자로 변경
    이외의 경우는 단어의 첫 번째 글자가 아님 -> 소문자로 변경
*/


func solution(_ s:String) -> String {
    var ans = ""

    let sArr = Array(s)

    ans += sArr[0] == " " ? " " : "\(sArr[0].uppercased())"

    for (idx, word) in sArr.enumerated() {
        if idx == 0 { continue }

        if sArr[idx-1] == " " {
            ans += "\(word.uppercased())"
        } else {
            ans += "\(word.lowercased())"
        }
    }

    return ans
}
