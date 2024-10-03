//
//  [백준 4358] 생태학.swift
//  Algorithm
//
//  Created by 김민 on 10/3/24.
//
// 백준 4358 생태학 https://www.acmicpc.net/problem/4358

/*
[📌 전략]
 딕셔너리 이해, 소수점 문자열 처리

[✅ 풀이]
 1. [종 이름: 개수] 형태로 입력 받음
    - 딕셔너리[key, default: 0] 형태를 사용하여 첫 입력 시에도 올바르게 수가 추가될 수 있도록 함
 2. 입력이 끝나면 key를 기준으로 사전순 정렬
 3. 비율의 백분율: 특정 종의 나무 수 / 전체 수 * 100
    전부 double형으로 변환하여 나눠주고, String(format:_:) 사용하여 소수점 넷째자리까지 출력
[📝 기록]
*/

import Foundation

var dic = [String: Int]()
var n = 0

while let line = readLine() {
    dic[line, default: 0] += 1
    n += 1
}

let sortedDic = dic.sorted { $0.key < $1.key }

for dic in sortedDic {
    let cnt = Double(dic.value) / Double(n) * 100
    print(dic.key, String(format: "%.4f", cnt))
}
