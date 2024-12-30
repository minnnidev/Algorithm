//
//  [백준 2847] 게임을 만든 동준이.swift
//  Algorithm
//
//  Created by 김민 on 12/18/23.
//
// 백준 2847 게임을 만든 동준이  https://www.acmicpc.net/problem/2847

/*
역순으로 순회하면서, 이전보다 점수가 높다면, 이전보다 1 낮도록 점수를 만들어준다.
점수는 20000보다 작은 양의 정수라고 되어 있어, max값을 20000으로 설정했다.
역순으로 순회하면서, max보다 현재 점수가 낮다면, max를 현재 점수로 갱신해준다.
높거나 같다면, 이전 점수보다 낮게 해야하므로, 점수를 최소한으로 내리기 위해서 이전 점수보다 - 1 낮도록 설정한다.
출력이 감소시키는 횟수이므로, result에 더해줘야 하는 값은 (원점수 - 감소시킨 점수)이다.
max값은 이전 점수보다 - 1 낮은 값으로 갱신한다.
*/

let N = Int(readLine()!)!
var scores = [Int]()
var result = 0
var max = 20000

for _ in 0..<N {
    scores.append(Int(readLine()!)!)
}

for score in scores.reversed() {
    if max > score {
        max = score
    } else {
        let fixedScore = max - 1
        result += (score - fixedScore)
        max = fixedScore
    }
}

print(result)
