//
//  [백준 4796] 캠핑.swift
//  Algorithm
//
//  Created by 김민 on 2/26/24.
//
// 백준 4796 캠핑 https://www.acmicpc.net/problem/4796

/*
[✅ 풀이]
입력받은 l, p, v 중
v를 p로 나눈 몫에 사용할 수 있는 휴가일(l)을 곱해준 값을 구한다.
v를 p로 나눈 나머지는 l보다 작은 경우에는 나머지를,
나머지막 l과 같거나 큰 경우에는 l만큼 캠핑장을 사용할 수 있다.
*/

var cnt = 1
while let input = readLine() {
    let line = input.split(separator: " ").map { Int($0)! }
    guard line[0] > 0 else { break }

    let (l, p, v) = (line[0], line[1], line[2])
    print("Case \(cnt):", v/p*l + (v%p<l ? v%p : l))
    cnt += 1
}
