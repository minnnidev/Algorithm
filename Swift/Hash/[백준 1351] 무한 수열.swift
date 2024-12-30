//
//  [백준 1351] 무한 수열.swift
//  Algorithm
//
//  Created by 김민 on 6/17/24.
//
// 백준 1351 무한 수열 https://www.acmicpc.net/problem/1351
//

/*
[📌 전략]
 피보나치 수열의 원리와 같음. 단 0 ≤ N ≤ 10^12인 점

[✅ 풀이]
 hash를 통해 풀이하기 위해 dictionary 사용
 이미 Ai의 답을 구한 적이 있다면 그 답을 그대로 재활용하여 시간 단축하기
 1. infinity라는 Ak를 구하는 함수 선언
 2. 딕셔너리에 k를 키값으로 가지는 요소가 존재하면 이미 답을 구한 것이므로 재활용
 3. 값이 없다면 재귀함수를 통해 dic[k] 구하기
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, p, q) = (line[0], line[1], line[2])
var dic = [Int: Int]()
dic[0] = 1


func infinity(_ k: Int) -> Int {
    if dic.contains(where: { $0.key == k }) {
        return dic[k]!
    } else {
        dic[k, default: 0] = infinity(k/p) + infinity(k/q)
        return dic[k]!
    }
}

print(infinity(n))
