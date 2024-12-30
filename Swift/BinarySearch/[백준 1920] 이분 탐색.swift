//
//  [백준 1920] 이분 탐색.swift
//  Algorithm
//
//  Created by 김민 on 3/3/24.
//
// 백준 1920 이분 탐색 https://www.acmicpc.net/problem/1920

/*
[📌 전략]
이분 탐색의 개념을 알아볼 수 있는 연습 문제
*/

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }
arr.sort() // 이분 탐색을 위해서는 오름차순 정렬이 필요하다

func binarySearch(_ target: Int) -> Int {
    var st = 0
    var en = arr.count-1

    while st <= en { // st가 en을 가로지르지 않는 경우에만
        let mid = (st+en)/2

        // target이 mid의 값보다 크다면 mid의 오른쪽 범위 탐색(mid+1 ~ en)
        if target > arr[mid] {
            st = mid+1
        } else if target == arr[mid] { // 같다면 리턴
            return 1
        } else { // target이 mid 값보다 작다면 mid의 왼쪽 범위 탐색(st ~ mid-1)
            en = mid-1
        }
    }
    return 0
}

var m = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
nums.forEach {
    print(binarySearch($0))
}

