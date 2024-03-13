//
//  [백준 16401] 과자 나눠주기.swift
//  Algorithm
//
//  Created by 김민 on 3/12/24.
//
// 백준 16401 과자 나눠주기 https://www.acmicpc.net/problem/16401

/*
[📌 전략]
 과자의 길이가 1 ≤ L1, L2, ..., LN ≤ 1,000,000,000 범위 내이므로
 입력받은 최대의 과자길이까지 완전 탐색으로 알맞은 길이를 구하긴 어렵다.
 따라서 시간이 빠른 이분 탐색으로 알맞은 길이를 찾도록 풀이

[✅ 풀이]
 st = 1, en = 최대길이로 두고 mid = (st+en)/2
 입력받은 길이들을 mid값으로 나눴을 때 몫들을 모두 합하면, 해당 길이로 나눠줄 수 있는 조카들의 수가 된다.
 구한 수가 m보다 크거나 같다면, st를 mid+1로 이동시켜 더 긴 길이를 찾아보고,
 m보다 작다면 en을 mid-1로 이동시켜 더 작은 길이를 찾아본다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (line[0], line[1])
let lens = readLine()!.split(separator: " ").map { Int($0)! }

func findCount(_ v: Int) -> Int {
    var cnt = 0
    lens.forEach {
        cnt += $0/v
    }
    return cnt
}

var st = 1
var en = lens.max()!

while st <= en {
    let mid = (st+en)/2
    let cnt = findCount(mid)

    if cnt >= m { st = mid + 1 }
    else { en = mid - 1 }
}

print(en)
