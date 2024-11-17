//
//  [백준 1715] 카드 정렬하기.swift
//  Algorithm
//
//  Created by 김민 on 6/26/24.
//
// 백준 1715 카드 정렬하기 https://www.acmicpc.net/problem/1715

/*
[📌 전략]
 처음에는 그리디로 그냥 접근했다가 시간 초과 발생
 힙의 삽입과 삭제의 시간 복잡도가 O(logn)임을 사용하여 풀이한 문제

[✅ 풀이]
 1. 적은 개수의 카드 묶음끼리 먼저 묶어야 한다는 그리디적인 접근으로 시작
 2. 카드 묶음 배열에서 앞의 2개를 먼저 더한 뒤, 다시 배열에 넣어줌
 3. 다시 배열에 넣어준 후에는 다시 한번 그리디적 접근을 위해 정렬 필요
 4. 이를 반복
 -> 이것을 힙 자료구조를 활용하여 시간초과가 나지 않게 개선

[📝 기록]
 힙 사용 문제에 대해 감을 잡을 수 있었던 문제
*/

// 틀린 풀이
//let n = Int(readLine()!)!
//var nums = [Int]()
//var ans = 0
//
//for _ in 0..<n {
//    nums.append(Int(readLine()!)!)
//}
//
//nums.sort()
//var i = 0
//
//while true {
//    if nums.count < 2 { break }
//
//    let (a, b) = (nums.removeFirst(), nums.removeFirst())
//    nums.append(a+b)
//    nums.sort()
//
//    ans += (a+b)
//}
//
//print(ans)

// 힙을 사용한 맞는 풀이
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

var minHeap = Heap<Int>(comparer: <)

let n = Int(readLine()!)!
var ans = 0

for _ in 0..<n {
    minHeap.push(Int(readLine()!)!)
}

while minHeap.heap.count > 2 {
    let elem1 = minHeap.pop()!
    let elem2 = minHeap.pop()!

    minHeap.push(elem1+elem2)

    ans += (elem1+elem2)
}

print(ans)
