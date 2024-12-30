//
//  [백준 2447] 별 찍기 - 10.swift
//  Algorithm
//
//  Created by 김민 on 1/16/24.
//
// 백준 2447 별 찍기 - 10 https://www.acmicpc.net/problem/2447

/*
[📌 전략]
K번째의 패턴을 이용하여 K+1번째 패턴을 구할 수 있다 -> 재귀 알고리즘

[✅ 풀이]
1. 함수 정의
크기가 n*n이고, 첫 번째 좌표기 (r, c)인 정사각형에 별을 찍는 함수
2. 재귀 함수 종료 조건
입력받은 정사각형을 계속해서 9등분했을 때 최소 사각형의 크기는 3x3이다. 따라서 9등분을 계속하여 3이 됐을 때는 패턴을 그리고 재귀 함수 종료.
3. 재귀 함수 구현
사각형을 9등분 한다 -> 변의 길이가 n/3이다.
정사각형을 9등분하며 각 사각형에 대해 계속해서 나누어간다. 이때 각 사각형의 첫 번째 좌표를 포함하여 패턴을 알맞은 자리에 그릴 수 있도록 한다.
제일 작은 3x3 사각형이 됐을 때 각 위치에 *을 그린다. 정중앙 (r+1, c+1)일 때만 비어 있다.
*/

let N = Int(readLine()!)!
var matrix = Array(repeating: Array(repeating: " ", count: N), count: N)

func makeStar(_ r: Int, _ c: Int, _ n: Int) {
    if n == 3 { // 제일 작은 사각형일 때 패턴 그리기
        for i in 0..<3 {
            for j in 0..<3 {
                if i == 1 && j == 1 { continue }
                matrix[r + i][c + j] = "*"
            }
        }
        return
    }
    let trisection = n/3 // 사각형을 9등분 하기 위해 변의 길이/3
    for i in 0..<3 {
        for j in 0..<3 {
            if i == 1 && j == 1 { continue } // 정중앙 사각형은 패턴을 그리지 않는다
            makeStar(r + i * trisection, c + j * trisection, trisection)
        }
    }
}

makeStar(0, 0, N)
for i in 0..<N {
    print(matrix[i].joined())
}



// 참고 풀이) 시간이 엄청 빨라짐!
//let N = Int(readLine()!)!
//
//// N*N 사각형의 별 패턴을 한 줄씩 저장하여 있는 배열을 반환하는 함수
//func makeStars(_ n: Int) -> [String] {
//    // 1*1보다 큰 사각형일 때 *을 리턴
//    guard n > 1 else { return ["*"] }
//
//    let stars = makeStars(n/3)
//    let space = String(repeating: " ", count: n/3) // 크기가 3일 때는 한줄에 공백 크기이 1개, 크기가 9일 때는 공백 크기가 3개
//    var result = [String]()
//
//    // n/3*n/3 크기의 패턴을 이용하여 nxn 크기의 패턴 나타내기
//    stars.forEach {
//        result.append($0 + $0 + $0)
//    }
//    stars.forEach {
//        result.append($0 + space + $0)
//    }
//    stars.forEach {
//        result.append($0 + $0 + $0)
//    }
//
//    return result
//}
//
//print(makeStars(N).joined(separator: "\n"))
