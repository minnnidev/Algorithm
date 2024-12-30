//
//  [백준 1018] 체스판 다시 칠하기.swift
//  Algorithm
//
//  Created by 김민 on 10/23/24.
//
// 백준 1018 체스판 다시 칠하기 https://www.acmicpc.net/problem/1018

/*
[📌 전략]
 8x8로 자름, 8 <= n, m <= 50, 맨 왼쪽 위쪽 칸이 W, B가 될 수 있음
 모든 걸 고려했을 때 완전 탐색으로 풀이해도 된다고 판단했다

[✅ 풀이]
 1. 8x8로 자르기
    맨 왼쪽 위쪽 칸이 0...n-8, 0...m-8 범위의 이중 for문에 해당
 2. 잘려진 체스판을 탐색하며 다시 칠해야 하는 최소값을 구함
    1. 맨 왼쪽 윗칸은 패스
    2. 맨 왼쪽 열은 index out of range를 방지하여 위쪽과 비교
    3. 행 중점으로, 자신의 왼쪽 칸과 색이 같으면 다시 칠해 주기
    4. 맨 왼쪽 위쪽 칸을 다른 색으로 변경한 경우도 고려하기
 3. 모든 잘린 체스판의 경우에서 최소값 구하기
*/

func sol1() {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (line[0], line[1])
    var matrix = Array(repeating: [String](), count: n)
    var ans = 64

    for i in 0..<n {
        matrix[i] = readLine()!.map { String($0) }
    }

    func transition(_ tmp: inout [[String]]) -> Int {
        var cnt = 0

        for k in 0..<8 {
            for l in 0..<8 {
                if k == 0 && l == 0 { continue }

                if l == 0 {
                    // 0일 때는 위랑 비교
                    if tmp[k-1][0] == tmp[k][0] {
                        tmp[k][0] = (tmp[k-1][0] == "B" ? "W" : "B")
                        cnt += 1
                    }
                    continue
                }

                if tmp[k][l-1] == tmp[k][l] {
                    // 같으면 바까야대
                    tmp[k][l] = (tmp[k][l-1] == "B" ? "W" : "B")
                    cnt += 1
                }
            }
        }

        return cnt
    }

    for i in 0...n-8 {
        for j in 0...m-8 {
            var tmp1 = Array(repeating: Array(repeating: "", count: 8), count: 8)
            var tmp2 = Array(repeating: Array(repeating: "", count: 8), count: 8)

            for k in 0..<8 {
                for l in 0..<8 {
                    tmp1[k][l] = matrix[i+k][j+l]
                }
            }

            tmp2 = tmp1
            tmp2[0][0] = (tmp2[0][0] == "B" ? "W" : "B")

            ans = min(ans, transition(&tmp1), transition(&tmp2)+1)
        }
    }

    print(ans)
}

func sol2() {
    let size: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let N = size[0], M = size[1]
    var chessBoard: [[String]] = []
    var result: [Int] = []

    let white =
    [["W","B","W","B","W","B","W","B"],
     ["B","W","B","W","B","W","B","W"],
     ["W","B","W","B","W","B","W","B"],
     ["B","W","B","W","B","W","B","W"],
     ["W","B","W","B","W","B","W","B"],
     ["B","W","B","W","B","W","B","W"],
     ["W","B","W","B","W","B","W","B"],
     ["B","W","B","W","B","W","B","W"]]

    let black =
    [["B","W","B","W","B","W","B","W"],
     ["W","B","W","B","W","B","W","B"],
     ["B","W","B","W","B","W","B","W"],
     ["W","B","W","B","W","B","W","B"],
     ["B","W","B","W","B","W","B","W"],
     ["W","B","W","B","W","B","W","B"],
     ["B","W","B","W","B","W","B","W"],
     ["W","B","W","B","W","B","W","B"]]

    // 입력받기
    for _ in 0..<N {
        chessBoard.append(readLine()!.map { String($0) })
    }

    // 체스판의 시작점
    for i in 0..<N-7 {
        for j in 0..<M-7 {
            var wCount = 0 // white와 다른 수 체크
            var bCount = 0 // black과 다른 수 체크

            // 각 시작점으로부터 8x8
            for a in i..<i+8 {
                for b in j..<j+8 {
                    if white[a-i][b-j] != chessBoard[a][b] {
                        wCount += 1
                    } else if black[a-i][b-j] != chessBoard[a][b] {
                        bCount += 1
                    }
                }
            }
            result.append(wCount)
            result.append(bCount)
        }
    }

    print(result.min()!)
}

func sol3() {
    let size: [Int] = readLine()!.split(separator: " ").map { Int($0)! }
    let N = size[0], M = size[1]
    var chessBoard: [[String]] = []
    var result: [Int] = []

    // 입력받기
    for _ in 0..<N {
        chessBoard.append(readLine()!.map { String($0) })
    }

    for i in 0..<N-7 {
        for j in 0..<M-7 {
            var wCount = 0
            var bCount = 0

            for a in i..<i+8 {
                for b in j..<j+8 {
                    if (a+b) % 2 == 0 {
                        if chessBoard[a][b] != "B" { // 틀린 개수 체크
                            bCount += 1
                        }
                        if chessBoard[a][b] != "W" {
                            wCount += 1
                        }
                    } else {
                        if chessBoard[a][b] != "W" {
                            bCount += 1
                        }
                        if chessBoard[a][b] != "B" {
                            wCount += 1
                        }
                    }
                }
            }
            result.append(bCount)
            result.append(wCount)
        }
    }

    print(result.min()!)
}
