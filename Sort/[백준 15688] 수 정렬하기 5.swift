//
//  [백준 15688] 수 정렬하기 5.swift
//  Algorithm
//
//  Created by 김민 on 2/5/24.
//
// 백준 15688 수 정렬하기 5 https://www.acmicpc.net/problem/15688

/*
[📌 전략]
- 수 범위가 1 ≤ N ≤ 1,000,000라서, counting sort로 풀이
- 빠른 입출력 필요

[✅ 풀이]
1. 각 수의 등장 횟수를 세는 freqs 배열 만듦.
2. 입력받을 때 해당 입력의 인덱스에 1을 더하여 등장 횟수 더해 주기
   - 각 수는 절댓값이 1,000,000보다 작거나 같은 정수이므로 편리한 계산을 위해 인덱스+1000000
3. freq 배열을 순회하며 각 수의 등장 횟수만큼 차례로 출력
   - 인덱스+1000000을 사용하므로 출력 시에는 인덱스-1000000
*/

import Foundation

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
var freqs = Array(repeating: 0, count: 2000002)
var result = ""

// 등장 횟수 세기
for _ in 0..<n {
    freqs[fIO.readInt()+1000000] += 1
}

// 차례대로 각 수를 등장 횟수만큼 출력하기
for i in 0..<2000002 {
    while freqs[i] > 0 {
        result += "\(i-1000000)\n"
        freqs[i] -= 1
    }
}

print(result)


