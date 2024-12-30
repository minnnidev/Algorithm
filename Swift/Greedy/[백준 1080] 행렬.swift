//
//  [백준 1080] 행렬.swift
//  Algorithm
//
//  Created by 김민 on 3/14/24.
//
// 백준 1080 행렬 https://www.acmicpc.net/problem/1080

/*
[📌 전략]
 - 3x3 행렬을 2번 뒤집으면 원 상태로 돌아온다. 따라서 2번 뒤집는 것은 의미가 없다.
 - 한 좌표(x, y)를 기준으로 오른쪽으로 3개, 아래쪽으로 3개 3x3 행렬을 뒤집는다면, 3x3 행렬에서 (x, y)를 제외하고 다른 부분은 다른 행렬의 뒤집힘에 영향을 받는다.
 - 따라서 우리는 (x, y)를 기준으로 시작하는 3x3 행렬을 뒤집었을 때, 행렬 A의 (x, y) 값이 행렬 B의 (x, y) 값과 같다면 무조건 뒤집어야 matrixB와 같아질 수 있다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var matrixA = Array(repeating: Array(repeating: 0, count: m), count: n)
var matrixB = Array(repeating: Array(repeating: 0, count: m), count: n)
var cnt = 0

// 입력
for i in 0..<n { matrixA[i] = readLine()!.map { Int(String($0))! } }
for i in 0..<n { matrixB[i] = readLine()!.map { Int(String($0))! } }

// 뒤집는 함수
func flip(_ x: Int, _ y: Int) {
    if matrixA[x][y] != matrixB[x][y] { // matrixA[x][y]가 matrixB[x][y]와 다르다면 뒤집어서 같게 만들기
        for i in x..<x+3 {
            for j in y..<y+3 {
                matrixA[i][j] = 1 - matrixA[i][j]
            }
        }
        cnt += 1
    }
}

func solution() {
    if n < 3 || m < 3 { return } // n, m이 3보다 작은 경우 함수 종료

    for x in 0...n-3 {
        for y in 0...m-3 {
            flip(x, y)

            if matrixA == matrixB { return } // 행렬을 한번씩 뒤집을 때마다 matrixA와 matrixB가 같아지는 것을 체크
        }
    }
}

solution()
print(matrixA == matrixB ? cnt : -1)
