//
//  [백준 16987] 계란으로 계란치기.swift
//  Algorithm
//
//  Created by 김민 on 1/29/24.
//
// 백준 16987 계란으로 계란치기 https://www.acmicpc.net/problem/16987

/*
[📌 전략]
다른 모든 계란과 부딪혀봐야 하는 점을 중점으로 생각하기

[✅ 풀이]
cur번째 계란을 드는 backtracking(cur:) 선언
cnt는 깨진 계란 개수

cur이 n이 되면, 더이상 들 계란이 없으므로 현재 깨진 계란 개수를 저장하고 탈출.
이때 깨진 계란의 개수가 최대여야 하므로, 각 조합들의 깨진 계란 개수를 최대로 갱신해 주는 과정 필요

cur번째 계란이 이미 깨진 상태면, 다음 계란으로.
현재 계란을 제외하고 모두 깨진 상태이면, 더이상 부딪혀볼 수 없음.

위 조건을 모두 통과했다면, cur번째 계란과 다른 모든 계란을 부딪혀 보기
다른 모든 계란과 부딪혀 보기 위해 for문을 사용하는데,
이때 index가 cur인 경우와 부딪힐 계란이 이미 깨진 경우에는 다음 계란으로 넘어가야 함.
cur번째 계란과 i번째 계란을 부딪힌 뒤, 깨진 계란의 개수 세어주기
backtracking(cur+1)을 호출하여 cur+1번째 계란을 들고 계란 부딪혀주기

cnt 값과 내구성 값을 원상복구하여 다음 계란을 깰 때 영향을 주지 않도록 설정
*/

let n = Int(readLine()!)!
var d = Array(repeating: 0, count: n)
var w = Array(repeating: 0, count: n)
var mx = 0
var cnt = 0 // 깨진 계란의 수

for i in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    d[i] = line[0]
    w[i] = line[1]
}

func backtracking(_ cur: Int) { // cur번째(index) 계란을 든다
    if cur == n { // 더이상 들 계란이 없을 때
        mx = max(mx, cnt) // 깨진 계란 개수를 최대로 갱신
        return
    }

    // 현재 든 계란이 이미 깨졌으면(내구도 0 이하) cur+1번째 계란을 들기 bactracking(cur+1)
    // 현재 계란을 제외하고 다른 계란이 모두 깨져있으면, 더이상 들 계란이 없는 backtraking(n)으로
    if d[cur] <= 0 || cnt == n-1 {
        backtracking(cur+1)
        return
    }

    // 다른 계란과 모두 부딪혀 보기
    for i in 0..<n {
        // 나 자신이거나, 해당 계란이 이미 깨졌을 때는 다음 계란으로
        if i == cur || d[i] <= 0 { continue }

        // 계란 부딪히기
        d[cur] -= w[i]
        d[i] -= w[cur]
        if d[cur] <= 0 { cnt += 1 }
        if d[i] <= 0 { cnt += 1 }

        backtracking(cur+1)

        // 원상복구
        if d[cur] <= 0 { cnt -= 1 }
        if d[i] <= 0 { cnt -= 1 }
        d[cur] += w[i]
        d[i] += w[cur]
    }
}

backtracking(0)
print(mx)
