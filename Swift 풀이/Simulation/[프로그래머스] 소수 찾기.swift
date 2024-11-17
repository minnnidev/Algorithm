//
//  [프로그래머스] 소수 찾기.swift
//  Algorithm
//
//  Created by 김민 on 9/25/24.
//
// 프로그래머스 소수 찾기 https://school.programmers.co.kr/learn/courses/30/lessons/42839

/*
[📌 전략]
 만들어진 모든 숫자의 소수를 판별하는 완전 탐색 문제
 모든 숫자 조합 만들기(백트래킹) + 소수 판별(반복문) 사용

[✅ 풀이]
 1. 백트래킹으로 모든 숫자 조합 만들기
    - numbers를 순회
        - 해당 문자를 아직 사용하지 않았다면 체크하고 arr에 추가. 재귀함수 호출
        - 방문 해제 및 arr에서 삭제
 2. set으로 숫자 조합 중복 제거
    - ex. 011이 입력되었을 때, 1이 2개이므로 101이 2번 조합됨
    - set으로 중복 제거
 3. 소수 판별
    - 약수가 1과 자기 자신만 있는지 체크
*/

import Foundation

var visited = [Bool]()
var arr = [Int]()
var nums = [Int]()
var combis = [Int]()

func appendToCombis(_ arr: [Int]) {
    var strArr = ""
    arr.forEach {
        strArr += "\($0)"
    }

    let intArr = Int(strArr)!

    if intArr > 0 {
        combis.append(intArr)
    }
}

func findNums() {
    for i in 0..<nums.count {
        if visited[i] { continue }

        visited[i] = true
        arr.append(nums[i])

        appendToCombis(arr)
        findNums()

        visited[i] = false
        arr.removeLast()
    }
}

func solution(_ numbers:String) -> Int {
    visited = Array(repeating: false, count: numbers.count)
    nums = numbers.map { Int(String($0))! }

    findNums()

    let setCombis = Set(combis)
    var ans = 0

    for combi in setCombis {
        if combi == 1 { continue }

        var isPrimary = true

        for i in 1...combi {
            if i == 1 { continue }
            if i == combi { continue }

            if combi % i == 0 {
                isPrimary = false
                break
            }
        }

        if isPrimary { ans += 1 }
    }

    return ans
}
