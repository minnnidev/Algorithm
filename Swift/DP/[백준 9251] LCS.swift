//
//  [백준 9251] LCS.swift
//  Algorithm
//
//  Created by 김민 on 2/26/24.
//
// 백준 9251 LCS https://www.acmicpc.net/problem/9251

/*
[📌 전략][✅ 풀이]
dp[i][j]는 문자열1[0...i]와 문자열2[0...j] 사이의 lcs 길이로 정의한다.
 문자열 1: ACAYKP
 문자열 2: CAPCAK이라 할 때,
 dp[0]: C와 A부터 ACAYKP까지의 lcs 길이를 나타낸다.
 dp[1]: CA와 A부터 ACAYKP까지의 lcs 길이를 나타낸다.

 C와 AC를 비교할 때처럼, 같은 문자가 나오면 이전 lcs 길이(왼쪽 대각선 값)보다 1 길어져야 한다.
 -> dp[i][j] = dp[i-1][j-1] + 1

 CA와 AC를 비교할 때처럼, 다른 문자일 때는 지금까지의 lcs 중 더 긴 lcs를 가져오기 위해
 해당 칸의 왼쪽 값, 위쪽 값 중 큰 값을 가져와야 한다.
 (ex. C-AC, CA-A 중 더 큰 값 사용)
 -> dp[i][j] = max(dp[i-1][j], dp[i][j-1])

참고) 예제의 dp는 다음과 같다. (쉬운 계산을 위해 0 배열을 가로 세로에 추가했다.
 [0, 0, 0, 0, 0, 0, 0]
 [0, 0, 1, 1, 1, 1, 1]
 [0, 1, 1, 2, 2, 2, 2]
 [0, 1, 1, 2, 2, 2, 3]
 [0, 1, 2, 2, 2, 2, 3]
 [0, 1, 2, 3, 3, 3, 3]
 [0, 1, 2, 3, 3, 4, 4]

[📝 기록]
LCS는 가끔 나오는 유형이므로 풀이를 기억해 둘 것
*/

var st1 = readLine()!.map { $0 }
var st2 = readLine()!.map { $0 }
var dp = Array(repeating: Array(repeating: 0, count: st1.count+1), count: st2.count+1)

st1.insert(" ", at: 0)
st2.insert(" ", at: 0)

let (length1, length2) = (st1.count, st2.count)

for i in 1..<length2 {
    for j in 1..<length1 {
        if st2[i] == st1[j] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i-1][j], dp[i][j-1])
        }
    }
}

print(dp[length2-1][length1-1])
