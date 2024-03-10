//
//  [백준 14499] 주사위 굴리기.swift
//  Algorithm
//
//  Created by 김민 on 3/10/24.
//
// 백준 14499 주사위 굴리기 https://www.acmicpc.net/problem/14499

/*
[📌 전략]
 주사위를 이동시키는 것만 잘 고려해서 로직을 짜주면 된다.

[✅ 풀이]
 주사위의 각 위치를 1차원 배열로 나타냄 1이 윗면, 3이 가장 아랫면, 5가 동쪽
    [1]
 [5][2][6]
    [3]
    [4]
 1. 북쪽으로 이동할 때는 위쪽으로 주사위를 한칸 굴리기
    주사위 배열로 나타내면 [1, 2, 3, 4, 5, 6] -> [2, 3, 4, 1, 5, 6]
    맨앞 1번 요소를 제거한 뒤 3번째 인덱스 자리에 넣어주기
 2. 남쪽으로 이동할 때는 아래쪽으로 주사위를 한칸 굴리기
    주사위 배열로 나타내면 [1, 2, 3, 4, 5, 6] -> [4, 1, 2, 3, 5, 6]
    3번째 인덱스를 제거한 뒤 맨 앞에 삽입하기
 3. 동쪽으로 이동할 때는 오른쪽으로 한칸 굴리기
    주사위 배열로 나타내면 [1, 2, 3, 4, 5, 6] -> [1, 5, 3, 6, 4, 2]
    5번째 인덱스가 3번째 인덱스로, 3번째 인덱스가 4번째 인덱스로
    1번째 인덱스가 5번째 인덱스로, 4번째 인덱스가 1번째 인덱스로
    값이 이동해야 함.
    이동하기 전에 각 값들을 모두 저장하여 알맞은 인덱스에 값을 넣기
 4. 서쪽으로 이동할 때는 왼쪽으로 한칸 굴리기
    주사위 배열로 나타내면 [1, 2, 3, 4, 5, 6] -> [1, 6, 3, 5, 2, 4]
    4번째 인덱스가 3번째 인덱스로, 3번째 인덱스가 5번째 인덱스로
    5번째 인덱스가 1번째 인덱스로, 1번째 인덱스가 4번째 인덱스로
    값이 이동해야 함.
    이동하기 전에 각 값들을 모두 저장하여 알맞은 인덱스에 값을 넣기

    각 명령에 따랐을 때 범위 내에 있는지 체크하고, 이동을 한 뒤 주사위와 지도의 값을 바꾼 후에는 주사위의 윗면인 dice[1]을 출력
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
var (n, m, x, y, k) = (line[0], line[1], line[2], line[3], line[4])
var board = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n {
    board[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

let orders = readLine()!.split(separator: " ").map { Int($0)! }
var dice = Array(repeating: 0, count: 6)

func changeValue() {
    if board[x][y] == 0 {
        board[x][y] = dice[3]
    } else {
        dice[3] = board[x][y]
        board[x][y] = 0
    }

    print(dice[1])
}

func moveEast() {
    if y+1 >= m { return }
    y += 1

    let (w, s, e, m) = (dice[4], dice[3], dice[5], dice[1])
    dice[4] = s
    dice[3] = e
    dice[5] = m
    dice[1] = w

    changeValue()
}

func moveWest() {
    if y-1 < 0 { return }
    y -= 1

    let (w, s, e, m) = (dice[4], dice[3], dice[5], dice[1])
    dice[3] = w
    dice[5] = s
    dice[4] = m
    dice[1] = e

    changeValue()
}

func moveNorth() {
    if x-1 < 0 { return }
    x -= 1

    let tmp = dice.removeFirst()
    dice.insert(tmp, at: 3)

    changeValue()
}

func moveSouth() {
    if x+1 >= n { return }
    x += 1

    let tmp = dice.remove(at: 3)
    dice.insert(tmp, at: 0)

    changeValue()
}

orders.forEach { order in
    switch order {
    case 1:
        moveEast()
    case 2:
        moveWest()
    case 3:
        moveNorth()
    default:
        moveSouth()
    }
}
