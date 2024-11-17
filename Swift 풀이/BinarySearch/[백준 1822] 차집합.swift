//
//  [백준 1822] 차집합.swift
//  Algorithm
//
//  Created by 김민 on 3/11/24.
//
// 백준 1822 차집합 https://www.acmicpc.net/problem/1822

/*
[📌 전략]
 1 ≤ n(A), n(B) ≤ 500,000 이므로 완전 탐색 O(n*m) 풀이는 어렵다.
 따라서 O(logn) 시간 복잡도를 가지는 이분 탐색으로 풀이

[✅ 풀이]
 집합 A를 순회하며 집합 A의 요소가 B에 존재하는지 체크한다.
 이때 이분 탐색을 사용하여 알맞은 데이터를 찾기.
 존재한다면 continue, 존재하지 않는다면 최종 결과 출력 배열에 저장한다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
var setA = readLine()!.split(separator: " ").map { Int($0)! }
var setB = readLine()!.split(separator: " ").map { Int($0)! }

setA.sort()
setB.sort()

func binarySearch(_ target: Int) -> Bool  {
    var st = 0
    var en = line[1]-1

    while st <= en {
        let mid = (st+en)/2

        if setB[mid] > target { en = mid - 1 }
        else if setB[mid] < target { st = mid + 1 }
        else { return true }
    }

    return false
}

var answer = [Int]()
for num in setA {
    if binarySearch(num) { continue }
    answer.append(num)
}

print(answer.count)
print(answer.map { "\($0)" }.joined(separator: " "))
