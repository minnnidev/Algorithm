//
//  [백준 1010] 다리놓기.swift
//  Algorithm
//
//  Created by 김민 on 10/25/24.
//
// 백준 1010 다리놓기 https://www.acmicpc.net/problem/1010

/*
[📌 전략]
 m개 중에 n개를 선택하는 조합 문제
 백트래킹으로 풀면 시간 초과, 조합식을 사용해서 풀이
 (mCn = m! / (n! * (m-n)!)

[✅ 풀이]
 mCn = m! / (n! * (m-n)!)을 약분하면 최종적으로
 (m*(m-1)*(m-2)*...*(m-(n-1))) / (n*(n-1)*(n-2)*...*1)

[📝 기록]
 조합 공식 정도는 기억해 두기.....
*/

let t = Int(readLine()!)!

for _ in 0..<t {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (line[0], line[1])

    var res = 1

    for i in 0..<n {
        res *= (m-i)
        res /= (i+1)
    }

    print(res)
}
