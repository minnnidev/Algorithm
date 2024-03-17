//
//  [백준 3151] 합이 0.swift
//  Algorithm
//
//  Created by 김민 on 3/17/24.
//
// 백준 3151 합이 0 https://www.acmicpc.net/problem/3151

/*
[📌 전략]
 3중 for문으로 3개의 수를 모두 선택하는 완전 탐색은 시간상 불가능하다.
 하지만 두 수를 완전 탐색을 통해 선택하고, 합했을 때 0이 되는 나머지 수를 이분 탐색으로 구하는 것은 가능
 중복 숫자가 있을 수 있으므로 이분 탐색을 통해 찾아야 하는 결과가 여러 개.
 따라서 해당 타겟의 첫 인덱스와 마지막 인덱스를 찾아야 한다.

[📝 기록]
 시간 제한이 4초임을 통해 이중 for문으로 두 수를 선택하는 것은 가능하다는 것을 캐치한 뒤 이분탐색으로 나머지 한 수를 구하는 과정이 너무 어려웠다.
 이러한 부분을 잘 새겨두어야겠다는 생각이 들었던 문제
*/

let n = Int(readLine()!)!
var scores = readLine()!.split(separator: " ").map { Int($0)! }

scores.sort() // 탐색을 위한 sort

// 타겟이 처음 등장하는 인덱스 찾기
func lowerIdx(_ start: Int, _ target: Int) -> Int {
    var st = start
    var en = n

    while st < en {
        let mid = (st+en)/2
        if scores[mid] >= target { en = mid }
        else { st = mid + 1 }
    }

    return st
}

// 타겟이 마지막으로 등장하는 인덱스를 찾는 로직이지만, 개수를 편하게 찾기 위해 마지막 등장 인덱스+1을 구함
func upperIdx(_ start: Int, _ target: Int) -> Int {
    var st = start
    var en = n

    while st < en {
        let mid = (st+en)/2
        if scores[mid] > target { en = mid }
        else { st = mid + 1 }
    }

    return st
}

var ans = 0
for i in 0..<n-1 { // 두 수를 이중 for문으로 구하기
    for j in i+1..<n {
        let target = 0 - (scores[i]+scores[j]) // 찾아야 하는 타겟
        let lIdx = lowerIdx(j+1, target)
        let uIdx = upperIdx(j+1, target)
        ans += (uIdx - lIdx)
    }
}

print(ans)
