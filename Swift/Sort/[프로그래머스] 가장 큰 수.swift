//
//  [프로그래머스] 가장 큰 수.swift
//  Algorithm
//
//  Created by 김민 on 2/22/24.
//
// 프로그래머스 가장 큰 수 https://school.programmers.co.kr/learn/courses/30/lessons/42746

/*
[📌 전략]
 정렬 기준은 사전순이 아니다.
 ex. 3, 30, 300 중 시전순 내림차순 정렬은 300 > 30 > 3 순이지만
 더 큰 수를 구하려면 3 > 30 > 300순이 되어야 한다. ex. 330300 > 30033

[✅ 풀이]
 위 전략을 사용하여 정렬 시 앞 원소와 뒤 원소 문자열을 더했을 때 더 큰 경우를 기준으로 정렬하도록 했다.
 ex. 3, 30을 비교하면 "330"("3" + "30") > "303"("30" + "3") 이다.

 주의할 점은 [0, 0, 0]이 들어왔을 때는 0 하나만 답으로 출력해야 한다는 점이다.
 모든 원소가 0으로만 이루어지지 않았으면 정렬 후에 첫 요소가 0이 될 수 없지만
 모든 원소가 0으로 이루어졌다면 정렬 후에 맨 첫 요소가 0이 된다.
 따라서 첫 원소가 0일 때는 0을 return해 주고 그외 경우에는 정렬된 문자들을 합친 문자열을 return한다.
*/


import Foundation

func solution(_ numbers:[Int]) -> String {
    let sortedNum = numbers.map { String($0) }.sorted {
        return $0 + $1 > $1 + $0
    }
    if sortedNum[0] == "0" { return "0" }
    return sortedNum.joined()
}
