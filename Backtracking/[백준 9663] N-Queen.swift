//
//  [백준 9663] N-Queen.swift
//  Algorithm
//
//  Created by 김민 on 1/26/24.
//
// 백준 9663 N-Queen https://www.acmicpc.net/problem/9663

/*
[📌 전략]
1. 퀸은 상하좌우, 대각선으로 공격 가능하므로 1개의 행에는 1개의 퀸만 놓을 수 있다.
2. 같은 열이거나, 같은 대각선에 있는 위치는 퀸을 놓을 수 없다.
    - ⬇️: y값이 같다
    - ↘️: |x-y|가 같다 / ex. 퀸의 위치가 (x1, y1), (x2, y2)이면 |x1-y1| == |x2-y2|
    - ↙️:  x+y가 같다 / ex. 퀸의 위치가 (x1, y1), (x2, y2) 이면 x1+y1 == x2+y2
    - 나는 ↘️↙️ 대각선의 2가지 경우를 함께 계산하기 위해서 x2-x1 == |y2-y1| 을 사용했다.
      행과 행의 차이와 열과 열의 차이가 일치하다는 점이다.

[✅ 풀이]
1. cur행에 퀸을 놓는 재귀 함수 placeQueen을 정의
cur이 n이 되면 return
cur행의 각 열을 순회하며, 해당 열에 퀸을 놓을 수 있는지 여부 확인
visited[i] -> i열에 퀸이 있는지에 대한 여부. 있다면 퀸을 놓을 수 없으므로 다음 반복문으로 넘어감,
i열에 퀸이 없다면, 대각선 조건도 만족하는지에 대한 isPossible 함수 호출

2. isPossible은 퀸을 놓을 수 있는지 여부에 대한 함수
cur의 이전 행들을 순회하며 같은 대각선에 있는지 체크한다.
같은 대각선에 존재한다면 false를, 존재하지 않는다면 true를 호출한다.

[📝 기록]
하루를 꼬박 풀고도 해결하지 못하고 자꾸 시간 초과가 떠서 여러 풀이를 참고했다... 💦
같은 열과 같은 대각선 여부를 한번에 판단했었는데, 같은 열인지 체크 후에 대각선 여부를 확인하니 시간 초과를 해결할 수 있었다.
*/

let n = Int(readLine()!)!
var board = Array(repeating: -1, count: 15) // 해당 행의 퀸의 위치를 나타내는 함수
var visited = Array(repeating: false, count: 15) // 해당 열에 퀸이 있는지를 나타내는 함수
var result = 0 // 결과 출력 변수

// 퀸을 놓을 수 있는지 여부에 대한 함수
func isPossible(_ cur: Int) -> Bool {
    for j in 0..<cur { // cur 이전 행들을 돌며
        if cur - j == abs(board[cur] - board[j]) { // 같은 대각선에 있다면
            return false
        }
    }
    return true
}

// cur행에 퀸을 놓는 함수
func placeQueen(_ cur: Int) {
    if cur == n { // n이 되면 return
        result += 1
        return
    }

    for i in 0..<n { // cur행의 각 열을 순회
        if visited[i] { continue } // 해당 i열에 퀸이 없다면
        board[cur] = i // cur행 i열에 퀸을 놓겠다는 표시

        if isPossible(cur) { // 놓을 수 있다고 판단되면
            visited[i] = true
            placeQueen(cur+1) // 다음 행에 퀸을 놓기
            visited[i] = false
        }
    }
}

placeQueen(0)
print(result)
