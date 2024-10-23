//
//  [백준 1094] 막대기.swift
//  Algorithm
//
//  Created by 김민 on 10/23/24.
//
// 백준 1094 막대기 https://www.acmicpc.net/problem/1094

/*
[✅ 풀이1 - 구현]
 1. 문제 조건 따라 구현하면 됨
    - while 문으로 x와 일치해질 떼까지 반복
    - nums 배열로 막대기들을 관리
    - nums의 합이 x보다 클 경우, 문제에 주어진 조건들을 그대로 활용하기
*/

func sol1() {
    let x = Int(readLine()!)!
    var nums = [64]

    while true {
        let sum = nums.reduce(0, +)

        if sum == x {
            print(nums.count)
            break
        }

        if sum > x {
            let min = nums.removeLast()
            let half = min / 2

            if nums.reduce(0, +) + half >= x {
                nums.append(half)
            } else {
                nums.append(contentsOf: [half, half])
            }
        }
    }
}

/*
[✅ 풀이2 - 비트마스킹]
 몇 개의 2의 배수를 사용해서 x를 만들 수 있느냐
 -> x를 이진수로 변환했을 때의 1의 개수
*/

func sol2() {
    let n = Int(readLine()!)!
    let str = String(n, radix: 2)

    print(str.filter { $0 == "1" }.count)
}

