//
//  [백준 11286] 절댓값 힙.swift
//  Algorithm
//
//  Created by 김민 on 6/24/24.
//
// 백준 11286 절댓값 힙 https://www.acmicpc.net/problem/11286

/*
[📌 전략]
 Swift에는 내장되어 있지 않은 heap을 직접 구현한 뒤,
 [배열에서 절댓값이 가장 작은 값을 출력하고, 그 값을 배열에서 제거한다. 절댓값이 가장 작은 값이 여러개일 때는, 가장 작은 수를 출력하고, 그 값을 배열에서 제거한다.]
 조건에 맞게 비교하기
*/

// MARK: - Heap
struct Heap<T: Comparable> {
    var heap: Array<T> = []
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

var absHeap = Heap<Int> {
    if abs($0) < abs($1) { // 절댓값이 작을 땐 <
        return true
    } else if abs($0) == abs($1) { // 절댓값이 같을 때는 가장 작은 수가 제일 작은 수로 취급
        return $0 < $1
    } else {
        return false
    }
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let num = Int(readLine()!)!

    if num == 0 {
        if let deletedElem = absHeap.pop() {
            print(deletedElem)
        } else {
            print("0")
        }
    } else {
        absHeap.push(num)
    }
}
