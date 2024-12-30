//
//  [백준 1541] 잃어버린 괄호.swift
//  Algorithm
//
//  Created by 김민 on 12/15/23.
//
// 백준 1541 잃어버린 괄호 https://www.acmicpc.net/problem/1541

/*
- 부호 기준 뒤에 오는 값들을 최대로 만들어 준다.
== - 기준으로 괄호를 쳤을 때 최솟값을 만들 수 있다.
입력받을 때 -를 기준으로 split 해 괄호를 쳐줄 범위로 나눠준다.
각 요소들은 +와 피연산자로만 구성되어 있으므로, +로 split해 준 뒤 계산을 해 준다.
첫 번째 값이 숫자이므로, 기본값을 첫 번째 요소의 연산 값으로 지정해 준다.
뒤의 요소들은 빼주며 최종 답을 구한다.
*/

func caluculate(_ expression: String) -> Int {
    let nums = expression.split(separator: "+").map { Int($0)! }
    return nums.reduce(0, +)
}

let line = readLine()!.split(separator: "-").map { String($0) }
var result = caluculate(line[0])

for i in 1..<line.count {
    result -= caluculate(line[i])
}

print(result)
