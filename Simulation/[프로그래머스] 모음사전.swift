//
//  [프로그래머스] 모음사전.swift
//  Algorithm
//
//  Created by 김민 on 9/29/24.
//
// 프로그래머스 모음사전 https://school.programmers.co.kr/learn/courses/30/lessons/84512

/*
[📌 전략]
 문자열 완전 탐색 문제

[✅ 풀이]
 sol1) 규칙을 상수로 지정해서 풀이
 - 마지막 자리는 문자가 변할 때마다 1이, 4번째 자리는 6이, 3번재 자리는 31... 순서가 증가함
 - 규칙을 미리 찾아 배열로 지정해 놓음

 sol2) 규칙을 직접 작성하여 풀이
 - 첫 번째 문자를 기준으로 781을 곱해주어 이전 문자들의 개수를 구함
 - 그다음 올 수 있는 케이스를 모두 구해주었다.
 - ex. EIO이면 E____ & EI___ & EIO 를 모두 알아야 함
 - E____에 올 수 있는 경우는
    -> E_ / E__ / E___ / E____
    -> 2(A,E 가 올 수 있으므로) / 2*5(A,E가 오고 다음엔 모든 수가 올 수 있음) / 2*5*5 / 2*5*5*5
    -> 2(1 + 5 + 5*5 + 5*5*5) -> 250
 .
 .
 .
 위와 같은 원리로 모든 케이스를 구해서 더해주었음

 시간도 오래 걸리고 작성해야 할 코드도 많았는데, 규칙을 조금 더 간단하게 표현하도록 풀이를 작성해야 할 듯함.
 풀기는 했으나 이렇게 오래 걸릴 문제가 아님 😥

[📝 기록]
 규칙이 일정하고, 케이스가 적을 때는 그냥 상수값을 지정해 놓고 풀자!
*/

import Foundation

func solution1(_ word:String) -> Int {
    let base = ["A": 0, "E": 1, "I": 2, "O": 3, "U": 4]
    let const = [781, 156, 31, 6, 1]
    var ans = word.count
    var cnt = 0

    for ch in Array(word) {
        ans += base[String(ch)]! * const[cnt]
        cnt += 1
    }

    return ans
}

func solution2(_ word:String) -> Int {
    let wordArr = Array(word.map { String($0) })
    let n = wordArr.count
    let base = ["A": 0, "E": 1, "I": 2, "O": 3, "U": 4]
    var ans = n

    ans += base[wordArr[0]]! * 781

    for (idx, w) in wordArr.enumerated() {
        if idx == n-1 { break }

        let const = base[wordArr[idx+1]]!
        var tmpSum = 0

        for i in 0..<(5-(idx+1)) {
           tmpSum += Int(pow(5, Float(i)))
        }

        ans += const * tmpSum
    }

    return ans
}
