//
//  [백준 2212] 센서.swift
//  Algorithm
//
//  Created by 김민 on 5/27/24.
//
// 백준 2212 센서 https://www.acmicpc.net/problem/2212

/*
[📌 전략]
 그리디 문제
 k개로 센서들을 분할했을 때 각 집합들의 최대-최소의 합들이 최소인 경우를 찾기
 합이 최소가 되려면 일단 센서 간의 차가 가장 작아야 한다.
 센서 간의 차가 큰 곳에는 최대한 집중국을 세우지 않기

[✅ 풀이]
 1. 각 센서들의 차이를 구하기 -> diff 배열
 2. diff 배열을 내림차순으로 정렬
 3. 순서대로 총 k-1개의 합을 제거할 수 있음.
 4. 남은 차들은 각 집중국의 수신 가능영역의 거리의 합의 최솟값이 된다.
 ex. 센서 좌표가 [1, 3, 6, 6, 7, 9] 이고, 최대 집중국의 개수가 2개일 때
    diff를 구하고 내림차순 정렬하면 [3, 2, 2, 1, 0]
    집중국을 1-3, 6-9 사이에 세우면 3-6 사이를 고려하지 않아도 된다. -> 가장 큰 차 3을 삭제해도 됨.
*/

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var pos = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

if m >= n {
    print(0)
} else {
    var diff = [Int]()

    for i in 1..<n {
        diff.append(pos[i]-pos[i-1])
    }

    diff.sort(by: >)
    var ans = 0

    for i in m-1..<n-1 {
        ans += diff[i]
    }

    print(ans)
}
