//
//  [백준 18870] 좌표 압축 #2.swift
//  Algorithm
//
//  Created by 김민 on 7/9/24.
//
// 백준 18870 좌표 압축 #2 https://www.acmicpc.net/problem/18870

/*
[📌 전략]
 1 ≤ N ≤ 1,000,000라서, 이중 for문은 불가하겠다. -> 이분 탐색의 lowerBound를 사용해 보자
 (lowerBound: target이 처음 등장하는 인덱스를 찾기)

[✅ 풀이]
 1. 좌표들을 입력받고, Set을 통해 중복 제거 후, 오름차순으로 정렬한다.
    - 중복 제거를 하지 않으면, target이 처음 등장하는 인덱스를 제대로 찾을 수 없다.
    - target보다 작은 수들 중  중복되는 값들은 하나로 취급하기 때문
 2. 입력받은 nums를 기준으로 lowerBound를 구한다.
    - lowerBound는 이분 탐색으로 구현했다.
[📝 기록]
 다시 도전한 거였는데 잘 풀려서... 뿌듯
*/

let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
let sortedNums = Set(nums).sorted(by: <)
var ans = ""

func lowerBound(_ target: Int) -> Int {
    var st = 0
    var en = sortedNums.count-1

    while st < en {
        let mid = (st+en)/2

        if sortedNums[mid] < target {
            st = mid + 1
        } else {
            en = mid
        }
    }

    return st
}

nums.forEach {
    ans += "\(lowerBound($0)) "
}

print(ans)
