//
//  [프로그래머스] N으로 표현.swift
//  Algorithm
//
//  Created by 김민 on 10/24/24.
//
// 프로그래머스 N으로 표현 https://school.programmers.co.kr/learn/courses/30/lessons/42895

/*
[📌 전략]
 dp[k] -> k개의 N으로 만들 수 있는 숫자들
 이전 값을 사용해서 dp[k]를 구하는 방식이므로 dp로 접근
 dp 테이블을 어떻게 정의할지를 결정하는 게 포인트 같음

[✅ 풀이]
 dp[k] -> k개의 N으로 만들 수 있는 숫자들

 TC1. N = 5, number = 12

 <5를 1번 사용해서 만들 수 있는 숫자들>
 5

 <5를 2번 사용>
 55
 5+5 / 5-5 / 5/5 / 5*5

 <5를 3번 사용>
 555
 (5+5)+5 / ... / (5+5)*5
 (5-5)+5 / ... / (5-5)*5
 (5/5)+5 / ... / (5/5)*5
 (5*5)+5 / ... / (5*5)*5
 5+(5+5) / ... / 5*(5+5)
 5+(5-5) / ... / 5*(5-5)
 5+(5/5) / ... / 5*(5/5)
 5+(5*5) / ... / 5*(5*5)
-> 5/(5-5) 와 (5-5)/5 처럼 순서가 바뀌었을 때 값이 다른 경우도 있으므로, 순서에 따라 모든 경우를 고려해 주기

 ...

 dp[k] = dp[i] + dp[j] (단, i+j = k)

 1. 최솟값이 8보다 크면 -1을 return하므로 dp[1] ~ d[8]까지만 구해줄 것
 2. 중복값들이 생기기 때문에 효율적인 처리를 위해 dp의 각 요소들은 set으로 관리한다
 3. 5, 55, 555와 같은 연속적인 수를 먼저 각 dp에 넣어준다
 4. 1...8 범위를 순회하며 k 값을 지정하고 i+j가 k가 되는 경우들 순회
    - 각 사칙연산을 한 값을 insert로 set에 넣는다.
    - 이때, 나누기의 경우 부모가 0이 되는 경우는 제외하기 위해 따로 처리를 해 준다
 5. dp 배열을 순회하며 각 요소들 중 number 값과 동일한 값이 있는지 찾고, 있다면 index를 return (dp[k] = k개의 N으로 만들 수 있는 숫자들이기 때문), 없다면 -1 return

[📝 기록]
 dp 테이블을 어떻게 정의할지를 다양하게 생각해 볼 것
*/

func solution(_ N:Int, _ number:Int) -> Int {
    var dp = Array(repeating: Set<Int>(), count: 9)

    var tmp = 0
    for i in 1...8 {
        tmp = tmp*10 + N
        dp[i].insert(tmp)
    }

    for k in 1...8 {
        for i in 1..<k {
            for j in 1..<k {
                if (i+j) != k { continue }

                for a in dp[i] {
                    for b in dp[j] {
                        dp[k].insert(a+b)

                        dp[k].insert(a-b)

                        if b != 0 { dp[k].insert(a/b) }

                        dp[k].insert(a*b)
                    }
                }
            }
        }
    }

    for (idx, nums) in dp.enumerated() {
        for num in nums {
            if num == number {
                return idx
            }
        }
    }

    return -1
}
