//
//  [백준 10815] 숫자 카드.swift
//  Algorithm
//
//  Created by 김민 on 3/11/24.
//
// 백준 10815 숫자 카드 https://www.acmicpc.net/problem/10815

/*
[📌 전략]
 M(1 ≤ M ≤ 500,000) 이므로 직접 탐색 불가, 이분 탐색 사용하여 풀이
*/

let n = Int(readLine()!)!
var arr1 = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var arr2 = readLine()!.split(separator: " ").map { Int($0)! }

arr1.sort() // 이분 탐색 위해 오름차순 정렬

func binarySearch(_ target: Int) -> Int { // 이분 탐색 실시
    var st = 0
    var en = n-1

    while st <= en {
        let mid = (st+en)/2

        if arr1[mid] > target { en = mid - 1 } // mid 인덱스의 값보다 타겟이 작은 경우 작은 범위 탐색
        else if arr1[mid] < target { st = mid + 1 } // mid 인덱스의 값보다 타겟이 큰 경우 큰 범위 탐색
        else { return 1 } // 일치할 경우 1 반환
    }
    return 0 // 일치하는 값이 없을 경우 0 반환
}

var result = ""
arr2.forEach {
    result += "\(binarySearch($0)) "
}

print(result)
