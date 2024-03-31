//
//  [백준 20922] 겹치는 건 싫어.swift
//  Algorithm
//
//  Created by 김민 on 3/31/24.
//
// 백준 20922 겹치는 건 싫어 https://www.acmicpc.net/problem/20922

/*
[📌 전략]
 연속하는 최장 수열의 길이를 구하는 일반적인 투포인터 알고리즘 활용
 freq이라는 빈도수 배열을 통해 입력받은 숫자와 freq 배열의 인덱스를 매칭하여 횟수를 센다.
 횟수가 k개 이하일 때는 en을 계속해서 오른쪽으로 이동시키지만, k개를 초과한 경우
 st를 오른쪽으로 이동시켜 알맞은 수열을 찾아간다.
 해당 과정 중 가장 긴 길이도 계속해서 갱신한다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (line[0], line[1])
var freq = Array(repeating: 0, count: 2000003)
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var ans = 0

freq[nums[0]] = 1 // 첫 번째 수의 freq 인덱스 값을 1 증가
var en = 0

for st in 0..<n { // st를 기준으로 순회
    while en < n && freq[nums[en]] <= k { // n이 아직 범위 내에 있고, 나타난 횟수도 k 이하일 경우
        en += 1 // en 이동
        if en != n { freq[nums[en]] += 1 } // 이동시킨 en이 n이 아니라면 빈도수 업데이트
    }

    ans = max(ans, (en-1)-st+1) // k개를 초과, 혹은 범위를 벗어나 while 문을 탈출했을 경우 최장 수열 길이 측정

    freq[nums[st]] -= 1 // st 이동을 위해 현재 nums[st]에 해당하는 빈도수 1 삭제
}

print(ans)
