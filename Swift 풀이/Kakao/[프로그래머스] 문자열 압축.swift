//
//  [프로그래머스] 문자열 압축.swift
//  Algorithm
//
//  Created by 김민 on 9/28/24.
//
// 프로그래머스 문자열 압축 https://school.programmers.co.kr/learn/courses/30/lessons/60057#

/*
[📌 전략]
 문제 고대로 읽고 풀이하는 구현 문제

[✅ 풀이]
[sol1]
 - 1~문자 길이 전부를 탐색하면서 최대한 압축된 길이를 찾기
 - 자르는 문자 단위에 따라 문자열을 자르고, 모두 한 배열에 담는다
 - 배열을 순회함. 합칠 수 있는지 여부를 판단하기 위해 prev 문자열과 중복된 개수를 셀 cnt 선언
    - 합칠 수 있을 때는 개수를 카운트
    - 합칠 수 없을 때는 cnt를 사용하여 결과 문자열에 추가
    - prev를 새로 갱신하여 다음 문자가 현재 문자와 같을지 판별할 때 사용
    - 마지막 문자일 때는 cnt가 1보다 크면 cnt와 마지막 문자 모두 출력, 아니면 문자만 출력

[sol2]
 - 포인트. 압축할 수 있는 최대 범위가 절반이라 자르는 문자 단위를 탐색할 때 절반만 탐색하기
 - 풀이 방법은 위와 같고 코드를 좀 더 이해하기 쉽게 변경
*/


import Foundation

func solution1(_ s:String) -> Int {
    let sArr = Array(s)
    let n = s.count
    var ans = n

    for i in 1..<n {
        var newS = [String]()

        for j in stride(from: 0, to: n, by: i) {
            let en = min(j+i, n)
            newS.append(sArr[j..<en].map { String($0) }.joined())
        }

        var prev = ""
        var cnt = 1
        var compressedStr = ""

        for k in 0..<newS.count {
            if k == 0 {
                prev = newS[k]
                continue
            }

            if newS[k] == prev {
                cnt += 1
            } else {
                if cnt > 1 { compressedStr += "\(cnt)"}
                compressedStr += "\(prev)"
                prev = newS[k]
                cnt = 1
            }

            if k == newS.count - 1 {
                if cnt > 1 { compressedStr += "\(cnt)" }
                compressedStr += "\(prev)"
            }
        }


        ans = min(ans, compressedStr.count)
    }

    return ans
}


func solution2(_ s:String) -> Int {
    let sArr = Array(s)
    let n = s.count
    var ans = n

    if n == 1 {  return 1 } // 절반(n/2)만 탐색하므로 n이 1일 때는 따로 처리 필요

    for i in 1...n/2 {
        var prev = sArr[0..<i].map { String($0) }.joined()
        var cnt = 1
        var compressedStr = ""

        for j in stride(from: i, to: n, by: i) {
            let en = min(j+i, n)
            let subStr = sArr[j..<en].map { String($0) }.joined()

            if subStr == prev {
                cnt += 1
            } else {
                if cnt > 1 { compressedStr += "\(cnt)"}
                compressedStr += "\(prev)"
                prev = subStr
                cnt = 1
            }
        }

        if cnt > 1 { compressedStr += "\(cnt)"}
        compressedStr += "\(prev)"
        ans = min(ans, compressedStr.count)
    }

    return ans
}
