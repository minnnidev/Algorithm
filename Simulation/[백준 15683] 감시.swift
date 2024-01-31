//
//  [백준 15683] 감시.swift
//  Algorithm
//
//  Created by 김민 on 1/31/24.
//
// 백준 감시 15683 https://www.acmicpc.net/problem/15683

/*
[📌 전략]
각 CCTV는 번호에 따라 해당 방향으로 감시를 할 수 있다.
위쪽 - 위 / 오른쪽 - 오 / 아래쪽 - 밑 / 왼쪽 - 왼 (시계 방향순)
1번 CCTV: 4가지 경우 - 위, 오, 밑, 왼
2번 CCTV: 2가지 경우 - 상하, 좌우
3번 CCTV: 4가지 경우 - 위오, 오밑, 밑왼, 왼위
4번 CCTV: 4가지 경우 - 왼위오, 위오밑, 오밑왼, 밑왼위
5번 CCTV: 1가지 경우 - 상하좌우

1. 입력받은 배열 중 CCTV 번호에 따른 방향의 모든 조합을 만든다. -> 백트래킹 사용
   ex. 1번, 2번 cctv가 있다면 (위, 상하) (오, 상하) (밑, 상하) (왼, 상하) (왼, 좌우) (오, 좌우) (밑, 좌우) (왼, 좌우)
       이렇게 총 8가지의 조합이 나올 것이다.
2. 각 조합의 번호와 배열에 따라 감시 영역을 체크한다.
3. 사각지대의 개수를 구하고, 최솟값을 찾아 갱신한다.

해당 순서로 풀이하기 위해서는 CCTV 번호, 번호에 따른 방향, 배열에서의 인덱스가 필요하여 CCTV라는 타입을 새로 만들어 풀이했다.
-> typealias CCTV = (num: Int, dir: Int, x: Int, y: Int)

[📝 기록]
역시 구현 문제는 미쳤다. 어렵다!!!!!!!
입력받는 수가 작을 시에는 모든 조합을 구할 확률이 높다는 점 꼭 명심하기
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])

typealias CCTV = (num: Int, dir: Int, x: Int, y: Int)
var matrix = Array(repeating: Array(repeating: 0, count: m), count: n)
var inputCCTVs = [CCTV]() // 입력 중에서 카메라 번호를 저장할 배열
var mn = Int.max

// 입력받기
for i in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    matrix[i] = line
    for j in 0..<m where line[j] > 0 && line[j] < 6 { // cctv일 경우 배열에 담기
        inputCCTVs.append(CCTV(num: matrix[i][j], dir: 0, x: i, y: j))
    }
}

var tmpMatrix = [[Int]]()
var cctvCombi = Array(repeating: CCTV(num: 0, dir: 0, x: 0, y: 0), count: inputCCTVs.count)
let cameraCnt = inputCCTVs.count

// 조합을 만드는 함수. 파라미터 k는 현재 k개를 선택했다는 것을 의미
// 0:북/ 1:동 / 2:남 / 3:서
func backtracking(_ k: Int) {
    if k == cameraCnt { // 전체 CCTV 감시 방향 조합 완료 시
        tmpMatrix = matrix // 입력받은 matrix 복사 -> 각 조합에 따라 새로 감시 영역을 나타내기 때문에 복사 필요

        // CCTV 감시 방향 표시하기
        for cctv in cctvCombi {
            switch cctv.num {
            case 1:
                checkCCTV1(cctv)
            case 2:
                checkCCTV2(cctv)
            case 3:
                checkCCTV3(cctv)
            case 4:
                checkCCTV4(cctv)
            default:
                checkCCTV5(cctv)
            }
        }

        // 사각지대 개수 체크 및 최소 갱신
        mn = min(mn, tmpMatrix.flatMap { $0 }.filter { $0 == 0 }.count)
        return // 반환하여 다음 조합 찾기
    }

    // 감시 방향 조합 만들기
    // 0: 위쪽, 1: 오른쪽, 2: 아래쪽, 3: 왼쪽
    for d in 0..<4 {
        let camera = inputCCTVs[k]
        cctvCombi[k] = CCTV(num: camera.num, dir: d, x: camera.x, y: camera.y)
        backtracking(k+1)
    }
}

// 감시하기
func checkArea(_ dir: Int, _ i: Int, _ j: Int) {
    switch dir {
    case 0: // 위
        for k in (0..<i).reversed() {
            if tmpMatrix[k][j] == 6 { break } // 벽이면 통과 불가
            if tmpMatrix[k][j] != 0 { continue } // CCTV일 때는 다음 영역으로
            tmpMatrix[k][j] = 7 // 입력받은 배열의 값들과 겹치지 않도록 감시 영역은 7로 표시
        }
    case 1: // 오
        for k in j+1..<m {
            if tmpMatrix[i][k] == 6 { break }
            if tmpMatrix[i][k] != 0 { continue }
            tmpMatrix[i][k] = 7
        }
    case 2: // 밑
        for k in i+1..<n {
            if tmpMatrix[k][j] == 6 { break }
            if tmpMatrix[k][j] != 0 { continue }
            tmpMatrix[k][j] = 7
        }
    default: // 왼
        for k in (0..<j).reversed() {
            if matrix[i][k] == 6 { break }
            if matrix[i][k] != 0 { continue }
            tmpMatrix[i][k] = 7
        }
    }
}

func checkCCTV1(_ cctv: CCTV) {
    let (i, j, dir) = (cctv.x, cctv.y, cctv.dir)
    switch dir {
    case 0: checkArea(0, i, j) // 위
    case 1: checkArea(1, i, j) // 오
    case 2: checkArea(2, i, j) // 밑
    default: checkArea(3, i, j) // 왼
    }
}

func checkCCTV2(_ cctv: CCTV) {
    let (i, j, dir) = (cctv.x, cctv.y, cctv.dir)
    switch dir {
    case 0, 2: // 상하
        checkArea(0, i, j)
        checkArea(2, i, j)
    default: // 좌우
        checkArea(1, i, j)
        checkArea(3, i, j)
    }
}

func checkCCTV3(_ cctv: CCTV) {
    let (i, j, dir) = (cctv.x, cctv.y, cctv.dir)
    switch dir {
    case 0:  // 위, 오
        checkArea(0, i, j)
        checkArea(1, i, j)
    case 1:  // 오, 밑
        checkArea(1, i, j)
        checkArea(2, i, j)
    case 2: // 밑, 왼
        checkArea(2, i, j)
        checkArea(3, i, j)
    default: // 왼, 위
        checkArea(3, i, j)
        checkArea(0, i, j)
    }
}

func checkCCTV4(_ cctv: CCTV) {
    let (i, j, dir) = (cctv.x, cctv.y, cctv.dir)
    switch dir {
    case 0: // 왼, 위, 오
        checkArea(3, i, j)
        checkArea(0, i, j)
        checkArea(1, i, j)
    case 1: // 위, 오, 밑
        checkArea(0, i, j)
        checkArea(1, i, j)
        checkArea(2, i, j)
    case 2: // 오, 밑, 왼
        checkArea(1, i, j)
        checkArea(2, i, j)
        checkArea(3, i, j)
    default: // 밑, 왼, 위
        checkArea(2, i, j)
        checkArea(3, i, j)
        checkArea(0, i, j)
    }
}

func checkCCTV5(_ cctv: CCTV) {
    // 모든 방향 감시
    let (i, j) = (cctv.x, cctv.y)
    checkArea(0, i, j)
    checkArea(1, i, j)
    checkArea(2, i, j)
    checkArea(3, i, j)
}

// 실행하기
backtracking(0)
print(mn)
