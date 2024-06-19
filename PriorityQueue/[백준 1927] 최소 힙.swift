//
//  [백준 1927] 최소 힙.swift
//  Algorithm
//
//  Created by 김민 on 6/19/24.
//
// 백준 1927 최소 힙 https://www.acmicpc.net/problem/1927

import Foundation

// MARK: - 최소 힙 구현해 보기
var heap = Array(repeating: -1, count: 100_005)
var sz = 0 // heap size

// MARK: - 추가
func push(_ x: Int) {
    sz += 1
    heap[sz] = x

    var idx = sz

    // 부모로 올라가며 자리를 바꿔야 하는 경우 바꾸기
    while (idx != 1) {
        let par = idx / 2
        if heap[par] <= heap[idx] { break }
        heap.swapAt(par, idx)
        idx = par
    }
}

// MARK: - 비었는지 확인
func isEmpty() -> Bool {
    return heap[1] == -1
}

// MARK: - 최솟값 확인
func top() -> Int {
    return heap[1]
}

// MARK: - 삭제
func pop() {
    // 1. 가장 마지막 위치와 자리를 바꾸고 제거
    heap[1] = heap[sz]
    heap[sz] = -1
    sz -= 1
    var idx = 1

    // 2. 알맞은 자리 찾아가기
    // 왼쪽 자식의 인덱스(2*idx)가 sz보다 크면 idx는 리프
    while (2 * idx <= sz) {
        let lc = 2 * idx // 왼쪽 자식
        let rc = 2 * idx + 1 // 오른쪽 자식
        var minChild = lc

        if (rc <= sz && heap[rc] < heap[lc]) {
            minChild = rc
        }

        if (heap[idx] <= heap[minChild]) { break }
        heap.swapAt(idx, minChild)
        idx = minChild
    }
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let num = Int(readLine()!)!

    if num == 0 {
        if isEmpty() {
            print("0")
        } else {
            print(top())
            pop()
        }
    } else {
        push(num)
    }
}
