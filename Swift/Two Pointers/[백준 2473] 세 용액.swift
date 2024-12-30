//
//  [백준 2473] 세 용액.swift
//  Algorithm
//
//  Created by 김민 on 3/18/24.
//
// 백준 2473 세 용액 https://www.acmicpc.net/problem/2473

/*
[📌 전략]
 한 용액을 두고 2개의 알맞은 두 용액을 찾기 위해 투 포인터 사용

[📝 기록]
 두 개의 용액을 고정해 두고 하나의 타겟을 찾기 위해 이분 탐색을 실시하는 풀이에 계속 도전했는데 실패했다. 해당 풀이는 밑에 남겨둠.
*/

let n = Int(readLine()!)!
var v = readLine()!.split(separator: " ").map { Int($0)! }
var mn = Int.max
var ans = Array(repeating: 0, count: 3)
v.sort()

func find(_ first: Int, _ start: Int) -> Bool {
    var st = start
    var en = n-1

    while st < en {
        let sum = first + v[st] + v[en] // 세 용액의 합을 구한다

        if mn > abs(sum) { // 합의 절댓값이 기존 mn보다 작다면 갱신
            mn = abs(sum)
            ans = [first, v[st], v[en]]
        }

        if sum > 0 { en -= 1 } // sum이 0보다 크다면 작아져야 하므로, en을 한칸 작게 이동시켜 탐색
        else if sum < 0 { st += 1 } // sum이 0보다 작다면 커져야 하므로, st를 한칸 크게 이동시켜 탐색
        else { return true } // sum이 0이면 탐색 종료
    }
    return false
}

for i in 0..<n-1 {
    if find(v[i], i+1) { break } // true로 반환되면 합이 0인 세 용액이 발견됐으므로 종료
}

print(ans[0], ans[1], ans[2])

/*
 // 이분 탐색 풀이
 let n = Int(readLine()!)!
 var v = readLine()!.split(separator: " ").map { Int($0)! }
 var mn = Int.max
 var ans = Array(repeating: 0, count: 3)

 v.sort()

 func binarySearch(_ first: Int, _ second: Int, _ start: Int) -> Bool {
     var st = start
     var en = n-1

     while st <= en {
         let mid = (st+en)/2
         let sum = first + second + v[mid]

         if mn > abs(sum) {
             mn = abs(sum)
             ans = [first, second, v[mid]]
         }

         if sum > 0 { en -= 1 }
         else if sum < 0 { st += 1 }
         else { return true }
     }

     return false
 }

 func solution() {
     for i in 0..<n-1 {
         for j in i+1..<n {
             if binarySearch(v[i], v[j], j+1) { return }
         }
     }
 }

 solution()
 print(ans[0], ans[1], ans[2])
 */
