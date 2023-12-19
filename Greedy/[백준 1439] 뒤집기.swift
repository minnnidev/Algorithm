//
//  [백준 1439] 뒤집기.swift
//  Algorithm
//
//  Created by 김민 on 12/18/23.
//
// 백준 1439 뒤집기 https://www.acmicpc.net/problem/1439

/*
1.
처음 떠올렸던 방법은 배열을 순회하며 숫자가 달라질 때마다를 카운트하면, 연속된 0을 뒤집는 개수와, 연속된 1을 뒤집는 개수를 알 수 있다.
이 둘을 비교해서 둘중 행동의 횟수가 적은 것을 출력한다.
*/

//let S = Array(readLine()!.map { String($0) })
//var prev = S[0]
//var sum1 = 0
//var sum0 = 0
//
//if prev == "1" {
//    sum1 += 1
//} else {
//    sum0 += 1
//}
//
//for i in 1..<S.count {
//    if S[i] != prev {
//        if S[i] == "1" {
//            sum1 += 1
//        } else {
//            sum0 += 1
//        }
//        prev = S[i]
//    }
//}
//
//print(min(sum1, sum0))

/*
2. 참고한 풀이
1번 풀이처럼 숫자가 달라질 때만 카운트한다는 아이디어를 이용하여 더 간단한 풀이를 해 보자.
101101은 결국 10101,
111010은 결국 1010 으로 표현할 수 있다.
여기서 패턴을 분석해 보면 간결하게 표현한 S의 길이 + 1을 2로 나누었을 때 몫이 최소 횟수가 된다.
*/

let S = readLine()!.map { $0 }
var count = 0

for i in 0..<S.count-1 {
    if S[i] != S[i+1] {
        count += 1
    }
}

print((count+1)/2)
