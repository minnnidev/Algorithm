//
//  [백준 20207] 달력.swift
//  Algorithm
//
//  Created by 김민 on 10/4/24.
//
// 백준 20207 달력 https://www.acmicpc.net/problem/20207

/*
[📌 전략]
 문제에 일정 정렬에 대한 많은 조건이 있는데, 
 사실 문제의 핵심은 코팅지를 덮기 위한 한 일정 뭉탱이의 가로와 세로라고 생각하고 구현하였음.
 -> 뭉탱이가 될 수 있는 조건의 가로 길이와 뭉탱이 안의 일정을 나열했을 때 세로의 최댓값을 구하기

[✅ 풀이]
 1. 365개의 요소를 가지는 int형 배열 date를 생성하여, 입력받은 일정의 date[s] ~ date[e]에 1씩 더해준다.
 2. 첫 일정의 시작과, 마지막 일정의 종료 날짜를 st, en에 저장한다.
 3. st ~ en +1 사이를 순회하며, 뭉탱이를 찾기 위해 끊어진 구간을 찾는다.
    - 끊어진 구간이란, date[i]가 0인 값을 의미. 해당 부분은 코팅지를 덮지 않아도 된다.
    - date[i] > 0 일 때는, w 변수를 1 증가시켜주며 뭉탱이의 가로 길이를 구하고,
      date[i] 값 중 가장 큰 값을 구해, 최대 세로 길이(maxH)를 구한다.
    - date[0]이 0이 되면, 끊어졌다는 의미이므로 구해둔 가로 길이와 세로 최댓값으로 코팅지 면적을 구하여 ans 갱신
      maxH와 w를 0으로 초기화하여 다음 뭉탱이를 구하기 위한 준비를 한다.
*/


let n = Int(readLine()!)!
let mx = 365
var date = Array(repeating: 0, count: mx + 3)
var st = mx
var en = -1

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (s, e) = (line[0], line[1])

    st = min(st, s)
    en = max(en, e)

    for i in s...e {
        date[i] += 1
    }
}

var w = 0
var maxH = 0
var ans = 0

for i in st...en+1 {
    if date[i] > 0 {
        w += 1
        maxH = max(maxH, date[i])
    }

    if date[i] == 0 {
        ans += w * maxH
        maxH = 0
        w = 0
    }
}

print(ans)
