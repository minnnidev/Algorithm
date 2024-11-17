//
//  [백준 2630] 색종이 만들기.swift
//  Algorithm
//
//  Created by 김민 on 1/16/24.
//
// 백준 2630 색종이 만들기 https://www.acmicpc.net/problem/2630

/*
[📝 기록]
1780 종이의 개수와 풀이 완벽하게 동일함.
9등분에서 4등분으로만 변경
*/

let N = Int(readLine()!)!
var matrix = Array(repeating: Array(repeating: 0, count: N), count: N)
var answer = Array(repeating: 0, count: 2)

for i in 0..<N {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

// 종이가 하나의 수로 이루어졌는지 체크
func checkPaper(_ row: Int, _ col: Int, _ n: Int) -> Bool {
    for i in 0..<n {
        for j in 0..<n {
            if matrix[row][col] != matrix[row + i][col + j] {
                return false
            }
        }
    }
    return true
}

// 9등분으로 나누기
func divide(_ row: Int, _ col: Int, _ n: Int) {
    // 종이가 하나로 이루어져 있으면
    if checkPaper(row, col, n) {
        answer[matrix[row][col]] += 1
    } else { // 종이가 하나로 이루어져 있지 않으면
        let size = n / 2
        for i in 0..<2 {
            for j in 0..<2 { // 분할된 각 사각형의 첫 번째 좌표 (row + size * i, col + size * j)
                divide(row + size * i, col + size * j, size)
            }
        }
    }
}

divide(0, 0, N)
answer.forEach { print($0) }
