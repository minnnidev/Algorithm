//
//  [백준 2295] 세 수의 합.swift
//  Algorithm
//
//  Created by 김민 on 3/6/24.
//
// 백준 2295 세 수의 합 https://www.acmicpc.net/problem/2295

/*
 [📌 전략]
 이분 탐색을 사용하여 데이터를 찾을 때 시간을 단축시키기

 [✅ 풀이]
 입력받은 집합 U를 arr 배열 이라 할 때

 arr[x] + arr[y] + arr[z] = arr[k]
 -> arr[x] + arr[y] = arr[k] - arr[z]로 나타낼 수 있다.

 arr[x] + arr[y]의 모든 경우를 구하고,
 arr[k]-arr[z]가 arr[x]+arr[y]에 존재하는지 구하면 된다.
 arr[k]-arr[z]가 존재하는지 탐색하는 과정에서 이분 탐색을 사용하여 시간을 단축시킬 수 있다.

 arr[k]가 큰 순으로 탐색하여 최대 d 발견 시에 탈출하도록 구현한다.

 [📝 기록]
 식을 써서 풀이 방법을 생각해낼 수 있음을 느꼈다.
 */

let n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n)

for i in 0..<n { arr[i] = Int(readLine()!)! }
arr.sort()

var sums = [Int]()

for i in 0..<n {
    for j in 0..<n {
        sums.append(arr[i] + arr[j])
    }
}

sums.sort()

func binarySearch(_ target: Int) -> Bool {
    var st = 0
    var en = sums.count-1

    while st <= en {
        let mid = (st+en)/2

        if sums[mid] > target {
            en = mid - 1
        } else if sums[mid] < target {
            st = mid + 1
        } else {
            return true
        }
    }
    return false
}

func solution() {
    for i in (0..<n).reversed() {
        for j in 0..<i {
            if binarySearch(arr[i]-arr[j]) {
                print(arr[i])
                return
            }
        }
    }
}

solution()
