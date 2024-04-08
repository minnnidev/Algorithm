//
//  [백준 12904] A와 B.swift
//  Algorithm
//
//  Created by 김민 on 4/8/24.
//
// 백준 12904 A와 B https://www.acmicpc.net/problem/12904

/*
[📌 전략]
 S를 기준으로 고민하지 않고 T를 기준으로 고민하면 고려해야 할 조건이 많이 줄어든다.
 T를 기준으로 마지막이 A이면, 1번 조건에 맞게 A를 제거하고
 마지막이 B이면, 2번 조건에 맞게 B를 제거하고 남은 T 배열을 뒤집는다.

[📝 기록]
 A를 기준으로 생각하다가 고려해야 할 조건들이 상당히 많아서 고민을 했는데, T를 기준으로 고민하면 빠르게 해결되는 문제였다.
 반대로 풀이하는 법도 있다는 점 꼭 기억해 두기!
*/

let s = readLine()!.map { String($0) }
var t = readLine()!.map { String($0) }
var ans = 0

while true {
    if t.count == 0 { break }
    if s == t { ans = 1; break }

    if t.last! == "A" {
        t.removeLast()
    } else { // B이면
        t.removeLast()
        t.reverse()
    }
}

print(ans)
