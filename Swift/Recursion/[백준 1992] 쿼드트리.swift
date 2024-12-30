//
//  [백준 1992] 쿼드트리.swift
//  Algorithm
//
//  Created by 김민 on 1/16/24.
//
// 백준 1992 쿼드트리 https://www.acmicpc.net/problem/1992

/*
[📌 전략]
1780 종이의 개수, 2630 색종이 만들기와 동일한 알고리즘이지만 괄호를 넣는 순서가 추가된 문제

[✅ 풀이]
1. 재귀 함수는 n*n 크기의 사각형을 압축하여 압축 결과를 나타내는 함수로 정의했다.
2. 종료 조건은 사각형 안의 수가 모두 한 가지 수로 이루어졌을 때이다.
3. 하나의 사각형이 하나의 수로 이루어졌는지 체크한다. 이루어져있으면 해당 수를 출력한다.
이루어져있지 않다면 사각형을 4등분으로 나누어 각각 압축해야 한다. 괄호를 열고 왼쪽 위, 오른쪽 위, 왼쪽 아래, 오른쪽 아래 사각형 순서대로 압축을 다시 시도한다.
이를 각각의 사각형이 하나의 수로 이루어질 때까지 반복한다. 하나의 사각형에 대한 압축이 성공하면 괄호를 닫는다.
*/

let N = Int(readLine()!)!
var matrix = Array(repeating: [Character](), count: N)
var answer = ""

for i in 0..<N {
    matrix[i] = readLine()!.map { $0 }
}

// 나눈 사각형이 하나의 수로 이루어져있는지 체크
func checkVideo(_ r: Int, _ c: Int, _ n: Int) -> Bool {
    for i in 0..<n {
        for j in 0..<n {
            if matrix[r][c] != matrix[r+i][c+j] { // 하나라도 첫 번째 수와 다르다면 false 리턴
                return false
            }
        }
    }
    return true
}

// 비디오 압축하기
func zipVideo(_ r: Int, _ c: Int, _ n: Int) {
    if checkVideo(r, c, n) {
        answer += "\(matrix[r][c])"
    } else {
        let half = n/2 // 4분할 하면 변의 길이는 n/2
        answer += "(" // 하나의 사각형 압축 시작 시에 괄호 열기
        /* --------
        zipVideo(r, c, half)
        zipVideo(r, c + half, half)
        zipVideo(r + half, c, half)
        zipVideo(r + half, c + half, half)
         */
        for i in 0..<2 {
            for j in 0..<2 { // 사각형을 4개로 나누는 걸 순서에 맞게 반복문으로 표현(위의 재귀 함수 4개와 동일)
                zipVideo(r + i * half, c + j * half, half) // 4개로 나누어 압축하기
            }
        }
        answer += ")" // 하나의 사각형 압축이 끝나면 괄호 닫기
    }
}

zipVideo(0, 0, N)
print(answer)
