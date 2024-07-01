//
//  [백준 13975] 파일 합치기 3 .swift
//  Algorithm
//
//  Created by 김민 on 7/1/24.
//
// 백준 13975 파일 합치기 3 https://www.acmicpc.net/problem/13975

/*
[📌 전략]
 K (3 ≤ K ≤ 1,000,000) 범위가 크기 때문에 힙으로 풀이
 작은 크기의 파일부터 합쳐야 한다는 그리디적 접근 필요 -> 최소 힙 사용

[✅ 풀이]
 1. 힙 구현 및 최소 힙 선언
 2. 입력받은 파일들을 힙에 넣어주기
 3. 최소 힙에서 2개를 pop해여 합한 후 다시 힙에 넣어 풀이

[📝 기록]
 1715 카드 정렬하기와 동일한 문제
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


let t = Int(readLine()!)!

for _ in 0..<t {
    let _ = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    var ans = 0

    var minHeap = Heap<Int>(comparer: <)

    nums.forEach {
        minHeap.push($0)
    }

    while minHeap.heap.count > 2 {
        let elem1 = minHeap.pop()!
        let elem2 = minHeap.pop()!

        minHeap.push(elem1+elem2)

        ans += (elem1+elem2)
    }

    print(ans)
}
