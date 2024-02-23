//
//  [백준 9461] 파도반 수열.swift
//  Algorithm
//
//  Created by 김민 on 2/23/24.
//
// 백준 9461 파도반 수열 https://www.acmicpc.net/problem/9461

/*
[📌 전략] [✅ 풀이]
p[i]: 나선에 있는 정삼각형의 가장 긴 변의 길이라고 했을 때,
p[i] = p[i-1] + p[i-5] 이다. (i >= 6)

길이가 3인 삼각형이 추가될 때부터, 아직 삼각형이 추가되지 않은 변의 길이가 2개씩 추가된다.
이를 활용하여 계산해 보면, 길이가 3인 삼각형이 추가되는 시점 이후에는 p[i] = p[i-1] + p[i-4]임을 알 수 있다.

문제에 맞게 초깃값을 설정해 준 뒤 입력받은 n의 p[n]을 출력한다.
*/


let t = Int(readLine()!)!
var p = Array(repeating: 0, count: 103)

p[1] = 1
p[2] = 1
p[3] = 1
p[4] = 2
p[5] = 2

for i in 6...100 {
    p[i] = p[i-1] + p[i-5]
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    print(p[n])
}
