//
//  [백준 12015] 가장 긴 증가하는 부분 수열2.swift
//  Algorithm
//
//  Created by 김민 on 5/7/24.
//
// 백준 12015 가장 긴 증가하는 부분 수열2 https://www.acmicpc.net/problem/12015

/*
[📌 전략]
 dp로는 시간 초과로 풀 수 없다. 이분 탐색으로 풀이 가능.

[✅ 풀이]
 1. 가장 긴 증가하는 부분수열을 저장할 seq 배열 만들기
 2. 입력받은 수열을 순회한다.
    - 요소가 seq 배열의 마지막보다 큰 수라면 증가하는 부분 수열이다. seq 배열에 append한다.
    - 요소가 seq 배열의 마지막보다 작거나 같은 수라면 seq 배열에서 이분 탐색을 수행하여 알맞게 replace할 자리를 찾는다.

[📝 기록]
 이분 탐색은 정렬이 필수적인데? 여기서 이분 탐색을 어떻게 사용해야 하지? 라며 입력받은 배열에서만 알고리즘을 적용하려 하였어서 오랫동안 풀이를 하지 못했던 문제였다.
*/

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var seq = [0] // 쉬운 비교를 위해 미리 0 추가

// 이분 탐색을 통해 알맞은 인덱스를 리턴
func getIndex(_ num: Int) -> Int {
    var st = 0
    var en = seq.count-1

    while st <= en {
        let mid = (st+en)/2

        if num == seq[mid] {
            return mid
        } else if num > seq[mid] {
            st = mid + 1
        } else {
            en = mid - 1
        }
    }

    return st
}

for num in nums {
    if num > seq.last! { // num이 클 경우 증가하는 부분 수열에 추가
        seq.append(num)
    } else { // 이외의 경우에는 교체
        let idx = getIndex(num)
        seq[idx] = num
    }
}

print(seq.count-1) // 0을 제외한 개수 출력
