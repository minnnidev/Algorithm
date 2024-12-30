//
//  [프로그래머스 43165] 타겟넘버.swift
//  Algorithm
//
//  Created by 김민 on 5/28/24.
//
// 프로그래머스 43165 타겟넘버 https://school.programmers.co.kr/learn/courses/30/lessons/43165

/*
[📌 전략]
각 숫자들의 음수, 양수 값의 합을 구하여 타겟과 일치하는지 확인하는 문제

[✅ 풀이]
 1. depth, sum을 함수로 받는 dfs 함수 구현
 - depth 개의 숫자의 합이 sum이다
 - depth 0: 현재 0개의 숫자의 합을 구했고, 그합은 sum이다.
 depth가 입력받은 number의 개수와 같다면 모든 합을 더한 것이 되므로, target과 일치하는지 체크 후 return

 2. 각 숫자의 음수, 양수 경우를 모두 판단하여 더하기
 dfs(depth+1, sum + numbers[depth])
 dfs(depth+1, sum - numbers[depth])
*/


func solution(_ numbers:[Int], _ target:Int) -> Int {
    var ans = 0

    func dfs(_ depth: Int, _ sum: Int) {
        if depth == numbers.count {
            if sum == target { ans += 1 }
            return
        }

        dfs(depth+1, sum + numbers[depth])
        dfs(depth+1, sum - numbers[depth])
    }

    dfs(0, 0)

    return ans
}
