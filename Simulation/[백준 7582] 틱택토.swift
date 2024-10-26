//
//  [백준 7582] 틱택토.swift
//  Algorithm
//
//  Created by 김민 on 10/26/24.
//
// 백준 7582 틱택토 https://www.acmicpc.net/problem/7682

/*
[📌 전략]
 주어진 조건들 이용하는 구현 문제

 포인트1. 틱택토인지 확인하기
 포인트2. 최종 상태인지 확인하기
    최종 상태: O 틱택토이거나 X 틱택토일 때는 즉시 종료, 이외에는 판이 전부 다 찼을 때 종료

[✅ 풀이]
 1. 틱택토인지 확인하기
    행 / 열 / 왼오 대각선 / 오왼 대각선으로 구분하여 모두 판단
    이중 하나라도 틱택토가 존재하면 true를 반환하도록 함.
 2. 최종 상태인지 확인하기
    tc 및 여러 경우의 수를 참고하여 최종 상태가 아닌 경우를 구하였음
    1. O 틱택토인데 x 개수가 더 많은 경우
        -> 틱택토가 완성된 이후에도 계속해서 게임을 한 것
    2. X 틱택토인데 o 개수가 같거나 더 많은 경우
        -> 틱택토가 완성된 이후에도 o를 더 둔 경우 (x를 먼저 두기 때문에 같은 경우도 포함)
    3. o, x 개수에 따른 유효성
        -> x를 먼저 두기 때문에, x 개수와 o 개수의 차이가 1보다 크면 안 됨
        -> o 개수가 x 개수보다 많을 수 없음
    4. 판이 다 채워지지 않았는데, o 틱택토도 아니고, x 틱택토도 아니면 최종 상태가 될 수 없음.
*/

while let input = readLine() {
    if input == "end" { break }

    let line = input.map { String($0) }
    var matrix = Array(repeating: Array(repeating: ".", count: 3), count: 3)

    var tmp = 0
    for i in stride(from: 0, through: 6, by: 3) {
        let arr = Array(line[i..<i+3])
        matrix[tmp] = arr
        tmp += 1
    }

    // 틱택토 체크 함수 -> word에 맞는 틱택토 존재할 시 true, 없을 시 false 리턴
    func bingo(arr: [[String]], _ word: String) -> Bool {

        // 행 빙고
        for i in 0..<3 {
            if arr[i].allSatisfy({ $0 == word }) { return true }
        }

        // 열 빙고
        var a = [String]()
        var b = [String]()
        var c = [String]()

        for i in 0..<3 {
            for j in 0..<3 {
                if j == 0 {
                    a.append(arr[i][0])
                } else if j == 1 {
                    b.append(arr[i][1])
                } else {
                    c.append(arr[i][2])
                }
            }
        }

        if a.allSatisfy({ $0 == word }) ||
            b.allSatisfy({ $0 == word }) ||
            c.allSatisfy({ $0 == word }) {
            return true
        }

        // 왼오 대각선 빙고
        var diag1 = [String]()

        for i in 0..<3 {
            for j in 0..<3 {
                if j == i { diag1.append(arr[i][j]) }
            }
        }

        // 오왼 대각선 빙고
        var diag2 = [String]()

        for i in 0..<3 {
            for j in (0..<3).reversed() {
                if i + j == 2 { diag2.append(arr[i][j]) }
            }
        }

        if diag1.allSatisfy({ $0 == word }) || diag2.allSatisfy({ $0 == word }) {
            return true
        }

        return false
    }

    func validation() -> Bool {
        let xCnt = matrix.flatMap { $0 }.filter { $0 == "X" }.count
        let oCnt = matrix.flatMap { $0 }.filter { $0 == "O" }.count

        // O 틱택토가 존재하는데, x를 더 둔 경우
        if bingo(arr: matrix, "O") && xCnt > oCnt { return false }

        // X 틱택토가 존재하는데, o를 더 둔 경우 (x륾 먼저 두기 때문에 같은 경우도 불가
        if bingo(arr: matrix, "X") && oCnt >= xCnt { return false }

        // o 개수, x 개수 차이가 1개보다 큰 경우
        if xCnt - oCnt > 1 { return false }

        // x 개수보다 o 개수가 크면 유효하지 않음
        if xCnt < oCnt { return false }

        // 아직 판이 다 채워지지 않았는데, X 틱택토도 아니고 O 틱택토도 아닐 경우 최종 상태가 될 수 없음
        if matrix.flatMap({ $0 }).filter({ $0 == "." }).count != 0
            && !bingo(arr: matrix, "X") &&
            !bingo(arr: matrix, "O") {
            return false
        }

        // 이외의 경우는 최종 상태 가능
        return true
    }

    print(validation() ? "valid" : "invalid")
}
