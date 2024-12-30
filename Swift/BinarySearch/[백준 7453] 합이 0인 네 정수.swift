//
//  [백준 7453] 합이 0인 네 정수.swift
//  Algorithm
//
//  Created by 김민 on 3/18/24.
//

// 백준 7453 합이 0인 네 정수 https://www.acmicpc.net/problem/7453

/*
[📌 전략]
 a&b 배열에서 만들 수 있는 각 조합들의 합, c&d 배열에서 만들 수 있는 각 조합들의 합
 a&b 배열의 합을 기준으로 c&d 배열의 요소를 더했을 때 합이 0이 될 수 있는 요소를 찾기.
 이때 시간 단축을 위해 이분 탐색을 실시한다.
 c&d 합배열에서 같은 요소가 여러 개일 수 있으므로 lowerBound, upperBound를 통해 찾아야 한다.
*/

let n = Int(readLine()!)!
var nums = Array(repeating: [Int](), count: n)
var a = Array(repeating: 0, count: n)
var b = Array(repeating: 0, count: n)
var c = Array(repeating: 0, count: n)
var d = Array(repeating: 0, count: n)

for i in 0..<n {
    nums[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

for i in 0..<n {
    a[i] = nums[i][0]
    b[i] = nums[i][1]
    c[i] = nums[i][2]
    d[i] = nums[i][3]
}

var sum1 = [Int]()
var sum2 = [Int]()

for i in 0..<n {
    for j in 0..<n {
        sum1.append(a[i] + b[j])
        sum2.append(c[i] + d[j])
    }
}

sum1.sort()
sum2.sort()

// target이 처음 등장하는 인덱스를 찾는 함수
func lowerIdx(_ target: Int) -> Int {
    var st = 0
    var en = n*n

    while st < en {
        let mid = (st+en)/2

        if sum2[mid] >= target { en = mid  }
        else { st = mid + 1 }
    }

    return st
}

// taget이 마지막으로 등장하는 인덱스+1을 리턴하는 함수
func upperIdx(_ target: Int) -> Int {
    var st = 0
    var en = n*n

    while st < en {
        let mid = (st+en)/2

        if sum2[mid] > target { en = mid }
        else { st = mid + 1 }
    }

    return st
}

var cnt = 0
for i in 0..<sum1.count { // sum1을 기준으로 순회
    let target = -sum1[i]
    // upperIdx, lowerIdx 차이를 구하여 0이 될 수 있는 합의 개수만큼 cnt 증가
    cnt += (upperIdx(target) - lowerIdx(target))
}

print(cnt)
