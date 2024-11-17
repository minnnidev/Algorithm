//
//  [백준 12100] 2048(Easy).swift
//  Algorithm
//
//  Created by 김민 on 2/7/24.
//
// 백준 12100 2048(Easy) https://www.acmicpc.net/problem/12100

/*
[✅ 풀이] 첫 번째
1. 최대 5번의 이동을 모두 지정해 줬기 때문에, 상하좌우 4방향으로 5개를 뽑는 모든 조합 구하기(백트래킹)
2. 모든 조합을 각 방향에 따라 움직이기
    2-1. 수 합치기
         이동하려는 방향과 반대 방향으로 순회하며 합칠 수 있는 경우에 합치기.
         ex. 왼쪽으로 움직이는 경우 자기보다 오른쪽에 있는 수 중, 가까운 수부터 탐색하여 기준 수와 같은 경우 합침.
         합쳤으면 탈출하여 다음 수에 대해 탐색하여 합치기 과정 실시
         탐색 중에 0이 아닌 자신과 다른 수가 오면, 해당 수는 충돌하여 합칠 수 없다는 의미이므로
    2-2. 이동시키기
         모든 수는 움직이려는 방향으로 이동해야 함. 이동하는 방향에 0이 있다면 그곳에 위치할 수도 있음.
         이동하는 방향쪽으로 0을 제외한 숫자들을 먼저 두고, 뒤에 원래 0의 개수만큼 0을 위치시키기
         ex. 0을 제외한 숫자들은 모두 왼쪽으로 이동, 뒤에 남은 0들 모두 붙이기
*/

//let N = Int(readLine()!)!
//var matrix = Array(repeating: Array(repeating: 0, count: N), count: N)
//var result = -1
//
//for i in 0..<N {
//    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
//}
//
//var tmpMatrix = matrix
//
//enum Direction: CaseIterable {
//    case up, right, down, left
//}
//
//// 상하좌우 조합 구하기
//var directionCombis = [[Direction]]()
//var arr = Array(repeating: Direction.up, count: 5)
//
//func backtracking(_ k: Int) {
//    if k == 5 {
//        directionCombis.append(arr)
//        return
//    }
//
//    for dir in Direction.allCases {
//        arr[k] = dir
//        backtracking(k+1)
//    }
//}
//
//func moveToLeft() {
//    for i in 0..<N {
//        // 1. 합치기
//        for j in 0..<N where tmpMatrix[i][j] != 0 {
//            var tmpIdx = j+1
//
//            while tmpIdx < N {
//                if tmpMatrix[i][j] == tmpMatrix[i][tmpIdx] {
//                    tmpMatrix[i][j] += tmpMatrix[i][j]
//                    tmpMatrix[i][tmpIdx] = 0
//                    break
//                }
//
//                if tmpMatrix[i][tmpIdx] != 0 {
//                    break
//                }
//
//                tmpIdx += 1
//            }
//        }
//
//        // 2. 이동시키기
//        let nonZero = tmpMatrix[i].filter { $0 != 0 }
//        let zeroCount = N - nonZero.count
//        tmpMatrix[i] = nonZero + Array(repeating: 0, count: zeroCount)
//    }
//}
//
//func moveToRight() {
//    for i in 0..<N {
//        // 1. 합치기
//        for j in (0..<N).reversed() where tmpMatrix[i][j] != 0 {
//            var tmpIdx = j-1
//
//            while tmpIdx > -1 {
//                if tmpMatrix[i][j] == tmpMatrix[i][tmpIdx] {
//                    tmpMatrix[i][j] += tmpMatrix[i][j]
//                    tmpMatrix[i][tmpIdx] = 0
//                    break
//                }
//
//                if tmpMatrix[i][tmpIdx] != 0 {
//                    break
//                }
//
//                tmpIdx -= 1
//            }
//        }
//
//        // 2. 이동시키기
//        let nonZero = tmpMatrix[i].filter { $0 != 0 }
//        let zeroCount = N - nonZero.count
//        tmpMatrix[i] = Array(repeating: 0, count: zeroCount) + nonZero
//    }
//}
//
//func moveToUp() {
//    for i in 0..<N {
//        // 1. 합치기
//        for j in 0..<N where tmpMatrix[j][i] != 0 {
//            var tmpIdx = j+1
//
//            while tmpIdx < N {
//                if tmpMatrix[j][i] == tmpMatrix[tmpIdx][i] {
//                    tmpMatrix[j][i] += tmpMatrix[j][i]
//                    tmpMatrix[tmpIdx][i] = 0
//                    break
//                }
//
//                if tmpMatrix[tmpIdx][i] != 0 {
//                    break
//                }
//
//                tmpIdx += 1
//            }
//        }
//
//        // 2. 이동시키기
//        var verticalTmpArr = Array(repeating: 0, count: N)
//        for j in 0..<N {
//            verticalTmpArr[j] = tmpMatrix[j][i]
//        }
//        let nonZero = verticalTmpArr.filter { $0 != 0 }
//        let resultArr = nonZero + Array(repeating: 0, count: N - nonZero.count)
//        for j in 0..<N {
//            tmpMatrix[j][i] = resultArr[j]
//        }
//    }
//}
//
//func moveToDown() {
//    for i in 0..<N {
//        // 1. 합치기
//        for j in (0..<N).reversed() where tmpMatrix[j][i] != 0 {
//            var tmpIdx = j-1
//
//            while tmpIdx > -1 {
//                if tmpMatrix[j][i] == tmpMatrix[tmpIdx][i] {
//                    tmpMatrix[j][i] += tmpMatrix[j][i]
//                    tmpMatrix[tmpIdx][i] = 0
//                    break
//                }
//
//                if tmpMatrix[tmpIdx][i] != 0 {
//                    break
//                }
//
//                tmpIdx -= 1
//            }
//        }
//
//        // 2. 이동시키기
//        var verticalTmpArr = Array(repeating: 0, count: N)
//        for j in 0..<N {
//            verticalTmpArr[j] = tmpMatrix[j][i]
//        }
//        let nonZero = verticalTmpArr.filter { $0 != 0 }
//        let resultArr = Array(repeating: 0, count: N - nonZero.count) + nonZero
//        for j in 0..<N {
//            tmpMatrix[j][i] = resultArr[j]
//        }
//    }
//}
//
//func move() {
//    for combi in directionCombis {
//        tmpMatrix = matrix
//        for dir in combi {
//            switch dir {
//            case .up:
//                moveToUp()
//            case .right:
//                moveToRight()
//            case .down:
//                moveToDown()
//            case .left:
//                moveToLeft()
//            }
//        }
//
//        result = max(result, tmpMatrix.flatMap { $0 }.max()!)
//    }
//}
//
//backtracking(0)
//move()
//print(result)

/*
[✅ 풀이] 두 번째
첫 번째 풀이에서 기반하여
합치고 이동하는 함수는 왼쪽 방향 하나만 만들고,
게임판을 회전해서 쉽게 구현할 수 있도록 함.

이동 방향이 위쪽이면 게임판을 270도 회전시켜 왼쪽으로 이동한 것과 같음
이동 방향이 오른쪽이면 게임판을 180도 회전시켜 왼쪽으로 이동한 것과 같음
이동 방향이 아래쪽이면 게임판을 90도 회전시켜 왼쪽으로 이동한 것과 같음

Direction enum의 int형 rawValue를 활용하여
left: 0, down; 1, right: 2, up: 3

rawValue 횟수만큼 90도씩 시계방향으로 회전시킨 후에 하나의 함수를 사용하여 수를 합치고 이동시키기
*/

let N = Int(readLine()!)!
var matrix = Array(repeating: Array(repeating: 0, count: N), count: N)
var result = -1

for i in 0..<N {
    matrix[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var tmpMatrix = Array(repeating: Array(repeating: 0, count: N), count: N)
var roatedMatrix = Array(repeating: Array(repeating: 0, count: N), count: N)

enum Direction: Int, CaseIterable {
    case left = 0, down, right, up
}

var directionCombis = [[Direction]]()
var arr = Array(repeating: Direction.up, count: 5)

func backtracking(_ k: Int) {
    if k == 5 {
        directionCombis.append(arr)
        return
    }

    for dir in Direction.allCases {
        arr[k] = dir
        backtracking(k+1)
    }
}

func rotate() {
    var tmp = Array(repeating: Array(repeating: 0, count: N), count: N)
    for i in 0..<N {
        for j in 0..<N {
            tmp[j][N-1-i] = roatedMatrix[i][j]
        }
    }
    roatedMatrix = tmp
}


func combine(_ dir: Int) {
    var tmpDir = dir
    while tmpDir > 0 {
        rotate()
        tmpDir -= 1
    }

    tmpMatrix = roatedMatrix

    for i in 0..<N {
        // 1. 부딪혀서 합치기
        for j in 0..<N where tmpMatrix[i][j] != 0 {
            var tmpIdx = j+1

            while tmpIdx < N {
                if tmpMatrix[i][j] == tmpMatrix[i][tmpIdx] {
                    tmpMatrix[i][j] += tmpMatrix[i][j]
                    tmpMatrix[i][tmpIdx] = 0
                    break
                }

                if tmpMatrix[i][tmpIdx] != 0 {
                    break
                }

                tmpIdx += 1
            }
        }

        // 2. 해당 방향으로 숫자 움직이기
        let nonZeroArr = tmpMatrix[i].filter { $0 != 0 }
        tmpMatrix[i] = nonZeroArr + Array(repeating: 0, count: N - nonZeroArr.count)
    }
}

func solution() {
    for combi in directionCombis {
        tmpMatrix = matrix
        for dir in combi {
            roatedMatrix = tmpMatrix
            combine(dir.rawValue)
        }
        result = max(result, tmpMatrix.flatMap { $0 }.max()!)
    }
}

backtracking(0)
solution()
print(result)
