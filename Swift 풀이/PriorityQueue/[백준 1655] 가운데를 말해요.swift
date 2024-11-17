//
//  [백준 1655] 가운데를 말해요.swift
//  Algorithm
//
//  Created by 김민 on 7/3/24.
//
// 백준 1655 가운데를 말해요 https://www.acmicpc.net/problem/1655

/*
[📌 전략]
 가장 먼저 생각한 간단한 로직은 입력받을 때마다 정렬을 실시해서, 가운데 숫자를 뽑기였다.
 n이 100,000보다 작고, 시간 제한이 0.1초이기 때문에 당연히 시간 초과가 발생한다.

 정렬된 것 중에 값을 찾기 위해 빠른 자료구조인 heap을 사용해야겠다는 생각이 들었다.
 하지만 어떻게 중간값을 구해야 할지에 막혀서 결국엔 혼자 풀이하지 못했다.

 찾아본 결과 maxHeap과 minHeap을 같이 사용하여 maxHeap의 top을 중간값으로 활용하는 풀이를 찾을 수 있었다.

[✅ 풀이]
 1. maxHeap의 top을 중간값으로 만들기 위해 만들어야 할 로직
    1-0. Swift에는 내장된 heap이 없으므로 구현 필요하다.
    1-1. maxHeap과 minHeap 2개를 모두 사용한다.
    1-2. heap에 push를 할 때 항상 maxHeap에 먼저 push한다.
         -> maxHeap.count <= minHeap.cout 조건에는 maxHeap.push() / 이외에는 minHeap.push()
    1-3. maxHeap.top > minHeap.top 인 경우에는 올바른 중간값 출력을 위해 둘의 자리를 바꾼다.
         처음에 진짜로 요소만 바꾸는 로직을 구현했는데, heap이 다시 정렬되어야 하기 때문에 pop()한 뒤 다른 heap에 push해 줘야 한다.
 2. 1번 로직을 입력받을 때마다 반복한다.

[📝 기록]
 빠른 입출력을 사용하면 시간을 더 단축할 수 있다.
 문제에서 꼭 힙을 하나만 쓰지 않을 수도 있다는 것을 알게 되었다.
 너무 어려웠지만, 재밌었던 문제이다. 많이 응용할 수 있을 것 같다.
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
var minHeap = Heap<Int>(comparer: <)

let n = Int(readLine()!)!
var ans = ""

for _ in 0..<n {
    let num = Int(readLine()!)!

    if maxHeap.size == minHeap.size {
        maxHeap.push(num)
    } else {
        minHeap.push(num)
    }

    if minHeap.size > 0 && (maxHeap.top > minHeap.top) {
        let mx = maxHeap.pop()!
        let mn = minHeap.pop()!

        minHeap.push(mx)
        maxHeap.push(mn)
    }

    ans += "\(maxHeap.top)\n"
}

print(ans)
