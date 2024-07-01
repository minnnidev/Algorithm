//
//  [백준 11279] 최대 힙.swift
//  Algorithm
//
//  Created by 김민 on 7/1/24.
//
// 백준 11279 최대 힙 https://www.acmicpc.net/problem/11279

/*
[📌 전략]
 최대 힙 자료구조를 이용한 풀이
*/

// MARK: - Heap
struct Heap<T: Comparable> {
    private var heap: Array<T> = []
    private let comparer: (T, T) -> Bool

    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
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

var maxHeap = Heap<Int>(comparer: >)

let n = Int(readLine()!)!

for _ in 0..<n {
    let num = Int(readLine()!)!

    if num == 0 {
        if let elem = maxHeap.pop() {
            print(elem)
        } else {
            print(0)
        }
    } else {
        maxHeap.push(num)
    }
}
