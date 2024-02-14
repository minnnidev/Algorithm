//
//  [백준 9095] 1, 2, 3 더하기.swift
//  Algorithm
//
//  Created by 김민 on 2/14/24.
//
// 백준 9095 1, 2, 3 더하기 https://www.acmicpc.net/problem/9095

/*
[📌 전략]
d[i] = i를 1, 2, 3의 합으로 나타내는 방법의 수라고 정의했을 때,
d[i]에 들어갈 수 있는 방법들은
d[i-1]의 각 방법들에 1을 더한 경우
d[i-2]의 각 방법들에 2를 더한 경우
d[i-3]의 각 방법들에 3을 더한 경우가 존재하고,
총 방법의 수는 d[i-1] + d[i-2] + d[i-3]이다.
d[4]부터 차례로 구하여 d[n]을 도출해낸다.
*/

let t = Int(readLine()!)!
var d = Array(repeating: 0, count: 12) // n의 최대는 10
d[1] = 1
d[2] = 2
d[3] = 4

for _ in 0..<t {
    let n = Int(readLine()!)!

    // n이 3 이하일 때는 지정해둔 각 값을 출력한 뒤 다음 케이스로
    guard n > 3 else { print(d[n]); continue }
    for i in 4...n { // n이 4 이상일 때는 d[i]를 구한다
        d[i] = d[i-1] + d[i-2] + d[i-3]
    }

    print(d[n])
}
