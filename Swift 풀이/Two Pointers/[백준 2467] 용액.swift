//
//  [백준 2467] 용액.swift
//  Algorithm
//
//  Created by 김민 on 3/14/24.
//
// 백준 2467 용액 https://www.acmicpc.net/problem/2467

/*
[📌 전략]
 - N은 10만 개 이하이므로, 완전 탐색을 통해 값을 구하는 것은 시간 초과 발생
 - 2개의 용액에 포인트를 두어 0에 가까운 합을 찾아가도록 구현
 - 입력에는 정렬된 용액의 특성값이 들어온다
 - 문제에는 알칼리성, 산성이 언급되었지만 풀이에서는 고려할 필요없다.

[✅ 풀이]
 st, en 포인터를 양쪽에 두고 용액의 합을 구한다.
 min이라는 지금까지의 가장 0과 가까운 합을 찾았을 때 저장할 변수를 만들고
 용액 합의 절댓값이 기존 min보다 작다면 갱신한다.
 합이 0보다 크다면 합을 더 작게 해야 하므로, en을 하나 감소
 합이 0보다 작다면 합을 더 크게 해야 하므로, st를 하나 증가
 합이 0과 같다면 해당 st, en 용액을 합하는 것이 정답
*/

let n = Int(readLine()!)!
var liquids = readLine()!.split(separator: " ").map { Int($0)! }

var st = 0
var en = n-1
var res = Array(repeating: 0, count: 2)
var min = Int.max

while st < en {
    let sum = liquids[st] + liquids[en]
    if abs(sum) < min {
        min = abs(sum)
        res = [liquids[st], liquids[en]]
    }

    if sum > 0 {
        en -= 1
    } else if sum < 0 {
        st += 1
    } else {
        break
    }
}

print(res[0], res[1])
