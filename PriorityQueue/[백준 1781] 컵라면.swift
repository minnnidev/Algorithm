//
//  [백준 1781] 컵라면.swift
//  Algorithm
//
//  Created by 김민 on 7/17/24.
//
// 백준 1781 컵라면 https://www.acmicpc.net/problem/1781

/*
[📌 전략]
 최대한 미룬 날에 최대한 많은 컵라면을 받을 수 있도록 하는 그리디 문제
 데드라인에 맞게 정렬을 해야 하고, 넣고 빼는 과정이 있기 때문에 시간 초과를 예방하여 heap 사용

[✅ 풀이]
 1. 컵라면을 데드라인이 빠른순, 데드라인이 같으면 컵라면을 많이 받는 순으로 정렬
    - 데드라인이 먼저 끝나는 것을 먼저 처리하고, 컵라면을 최대한 많이 받아야 하므로
 2. 받을 수 있는 라면을 담을 minHeap 구현
    - 최대한 많은 컵라면을 받기 위해, 작은 값을 교체해 주어야 하므로 minHeap 선택
 3. 정렬된 배열을 순회
    - minHeap의 크기는 현재 시간으로 생각할 수 있음
    - minHeap의 크기보다 배열 요소의 데드라인이 더 크다면 아직 그만큼 시간이 안 지난 것이므로, 요소의 라면을 push
    - 이외의 경우에는 minHeap의 top과 요소의 라면을 비교하여 요소의 라면이 더 클 시에는 pop 후 push
        - 최대한의 컵라면을 위해서
 4. minHeap에는 받을 수 있는 컵라면의 개수가 요소로 존재하고, 차례로 pop하며 더한 후 총합을 출력

[📝 기록]
 N (1 ≤ N ≤ 200,000) 범위 보고 heap을 사용했는데, 안 쓰고도 풀 수 있는 듯
*/

struct Heap<T: Comparable> {
    private var heap: Array<T> = []
    private let comparer: (T, T) -> Bool

    init(comparer: @escaping (T, T) -> Bool) {
        self.comparer = comparer
    }

    var size: Int {
        heap.count
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

let n = Int(readLine()!)!
var problems = [(Int, Int)]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    problems.append((line[0], line[1]))
}

problems.sort {
    if $0.0 < $1.0 {
        return true
    } else if $0.0 == $1.0 {
        return $0.1 > $1.1
    } else {
        return false
    }
}

var minHeap = Heap<Int>(comparer: <)

for problem in problems {
    let (num, ram) = (problem.0, problem.1)

    if num > minHeap.size - 1 {
        minHeap.push(ram)
    } else {
        if minHeap.top < ram {
            _ = minHeap.pop()
            minHeap.push(ram)
        }
    }
}

var ans = 0
while minHeap.size > 1 {
    ans += minHeap.pop()!
}

print(ans)
