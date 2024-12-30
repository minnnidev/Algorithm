//
//  [백준 2461] 대표선수.swift
//  Algorithm
//
//  Created by 김민 on 5/9/24.
//
// 백준 2461 대표선수 https://www.acmicpc.net/problem/2461

import Foundation

/*
[✅ 풀이 1]
투포인터를 사용해서 풀이하기 위해 모든 반의 학생을 (능력치, 반) 형태로 하나의 배열로 합쳐 정렬했다.
그리고 st, en 포인터를 두어 순회하며 차이가 가장 작은 경우를 찾는다
이때 만족해야 할 조건은, st와 en 포인터 범위 안에 있는 학생들은 모든 반에서 한 명 이상 해당되어야 한다는 점이다.
이점만 조심해서 풀이하면 된다.

다 풀고 난 뒤 살펴보니 다른 풀이들보다 효율적이지 못한 풀이라는 것을 발견했다.
*/


func solution1() {
    final class FileIO {
        private let buffer:[UInt8]
        private var index: Int = 0

        init(fileHandle: FileHandle = FileHandle.standardInput) {

            buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        }

        @inline(__always) private func read() -> UInt8 {
            defer { index += 1 }

            return buffer[index]
        }

        @inline(__always) func readInt() -> Int {
            var sum = 0
            var now = read()
            var isPositive = true

            while now == 10
                    || now == 32 { now = read() } // 공백과 줄바꿈 무시
            if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
            while now >= 48, now <= 57 {
                sum = sum * 10 + Int(now-48)
                now = read()
            }

            return sum * (isPositive ? 1:-1)
        }

        @inline(__always) func readString() -> String {
            var now = read()

            while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

            let beginIndex = index-1

            while now != 10,
                  now != 32,
                  now != 0 { now = read() }

            return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
        }

        @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
            var now = read()

            while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

            let beginIndex = index-1

            while now != 10,
                  now != 32,
                  now != 0 { now = read() }

            return Array(buffer[beginIndex..<(index-1)])
        }
    }

    let fIO = FileIO()
    let n = fIO.readInt()
    let m = fIO.readInt()
    var arr = [(Int, Int)]()

    for i in 0..<n {
        for _ in 0..<m {
            arr.append((fIO.readInt(), i))
        }
    }

    arr.sort { $0.0 < $1.0 }

    var en = 0
    let cnt = n*m
    var visited = Array(repeating: false, count: n)
    var mn = Int.max
    var diff = 0

    for st in 0..<cnt {
        visited[arr[st].1] = true

        while en < cnt && !visited.allSatisfy({ $0 == true }) {
            en += 1

            if en < cnt { visited[arr[en].1] = true }
        }

        if en < cnt {
            diff = arr[en].0 - arr[st].0
        }

        if en == cnt { break }
        if mn > diff { mn = diff }

        if !arr[st+1...en].contains(where: { $0.1 == arr[st].1 }) {
            visited[arr[st].1] = false
        }
    }

    print(mn)

}

/*
[✅ 풀이]
 ⚠️ 백준 시간 초과를 아직 해결 못했음!!!!!!!!!!!
 2개의 포인터가 아닌 각 반에 하나씩의 포인터를 두는 것으로 풀이한다.
 각 반의 능력치를 오름차순으로 정렬하고, 각 반의 최소 수를 비교하는 형태이다.
 최대 - 최소를 구해 갱신하고, 최소 능력치에 해당하는 반에서는 인덱스를 오른쪽으로 이동시켜 다시 탐색한다.

[📝 기록]
투포인터 문제는 2개의 포인터만 사용할 것이라는 생각으로 풀이했었데 고정관념을 깨준 풀이였다.
*/


func solution2() {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (line[0], line[1])
    var arr = Array(repeating: [Int](), count: n)
    var pointers = Array(repeating: 0, count: n)
    var result = Int.max

    for i in 0..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
        arr[i] = line
    }

    while true {
        var mn = Int.max
        var mx = -1
        var mnIdx = 0

        for i in 0..<n {
            if mn > arr[i][pointers[i]] {
                mn = arr[i][pointers[i]]
                mnIdx = i
            }

            if mx < arr[i][pointers[i]] {
                mx = arr[i][pointers[i]]
            }
        }

        result = min(mx-mn, result)
        pointers[mnIdx] += 1

        if pointers[mnIdx] == m {
            break
        }
    }

    print(result)
}
