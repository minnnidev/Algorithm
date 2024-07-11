//
//  [백준 2075] N번째 큰 수.swift
//  Algorithm
//
//  Created by 김민 on 7/10/24.
//
// 백준 2075 N번째 큰 수 https://www.acmicpc.net/problem/2075

/*
[📌 전략]
 메모리 제한이 12MB, N이 1500일 때 모두 저장하면 1500*1500인데,
 남는 것 같아 보이지만 이것만 계산하면 안 되고 다른 메모리도 필요하다고 함.
 따라서 숫자들을 모두 저장하지 않고, 정렬로 인해 나는 시간 초과를 피하기 위해 우선순위 큐 사용.
 N^2개를 입력받고, N번째 큰 수를 찾는 문제이므로 힙에 N개만 저장하게 하면 되나? 떠올림

[✅ 풀이]
 1. 최소 힙 선언 (N번째 큰 수를 찾아야 하므로, 최소 힙 선언 시 N개 중에 가장 작은 값을 찾을 수 있다.)
 2. 입력받을 때마다 힙에 push 한다.
 3. 힙 안의 요소의 개수가 N개를 초과할 경우 pop한다.
*/


import Foundation

let fileIO = FileIO()
let n = fileIO.readInt()
var minHeap = Heap<Int>(comparer: <)

for _ in 0..<n {
    for _ in 0..<n {
        let num = fileIO.readInt()

        minHeap.push(num)
        if minHeap.heap.count > n + 1 { _ = minHeap.pop() }
    }
}

print(minHeap.top)

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

struct Heap<T: Comparable> {
    var heap: Array<T> = []
    private let comparer: (T, T) -> Bool

    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }

    var top: T {
        heap[1]
    }

    // MARK: 추가
    mutating func push(_ elem: T) {
        if heap.isEmpty {
            heap.append(elem)
            heap.append(elem)
            return
        }

        heap.append(elem)
        bubbleUp(idx: heap.count - 1)
    }

    mutating private func bubbleUp(idx: Int) {
        var idx = idx

        while idx > 1 && comparer(heap[idx], heap[idx / 2]) {
            heap.swapAt(idx, idx / 2)
            idx /= 2
        }
    }

    // MARK: 삭제
    mutating func pop() -> T? {
        if heap.count < 2 { return nil }

        heap.swapAt(1, heap.count-1)

        let deletedElem = heap.removeLast()

        bubbleDown(idx: 1)

        return deletedElem
    }

    mutating private func bubbleDown(idx: Int) {
        var swapIdx = idx
        var isSwapped = false
        let lIdx = idx * 2
        let rIdx = idx * 2 + 1

        if lIdx < heap.endIndex && comparer(heap[lIdx], heap[swapIdx]) {
            swapIdx = lIdx
            isSwapped = true
        }

        if rIdx < heap.endIndex && comparer(heap[rIdx], heap[swapIdx]) {
            swapIdx = rIdx
            isSwapped = true
        }

        if isSwapped {
            heap.swapAt(swapIdx, idx)
            bubbleDown(idx: swapIdx)
        }
    }
}
