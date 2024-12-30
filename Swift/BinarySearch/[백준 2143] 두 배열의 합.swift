//
//  [백준 2143] 두 배열의 합.swift
//  Algorithm
//
//  Created by 김민 on 4/2/24.
// 백준 2143 두 배열의 합 https://www.acmicpc.net/problem/2143

/*
[✅ 풀이]
 각 배열을 누적합을 구한 후, 이를 이용하여 부배열의 합들읆 모두 구한다.
 배열 A의 하나의 부배열 합을 기준으로 t를 만들기 위한 데이터를 찾기 위해 이분 탐색을 사용했다.
 동일한 수가 여러 개 있을 수 있으므로, lowerBound와 upperBound를 통해 알맞은 데이터 개수를 구한다.
*/


let t = Int(readLine()!)!
let n = Int(readLine()!)!
var arr1 = [0] + readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var arr2 = [0] + readLine()!.split(separator: " ").map { Int($0)! }

// 누적합 구하기
for i in 1...n {
    arr1[i] += arr1[i-1]
}

for i in 1...m {
    arr2[i] += arr2[i-1]
}

var sum1 = [Int]()
var sum2 = [Int]()

// 모든 부분합 조합 구하기
for i in 1...n {
    for j in 0..<i {
        sum1.append(arr1[i]-arr1[j])
    }
}

for i in 1...m {
    for j in 0..<i {
        sum2.append(arr2[i]-arr2[j])
    }
}


sum1.sort()
sum2.sort()

// target이 처음 등장하는 인덱스
func lowerBound(_ target: Int) -> Int {
    var st = 0
    var en = sum2.count

    while st < en {
        let mid = (st+en)/2

        if sum2[mid] >= target { en = mid }
        else { st = mid + 1 }
    }

    return st
}

// target이 마지막으로 등장하는 인덱스+1
func upperBound(_ target: Int) -> Int {
    var st = 0
    var en = sum2.count

    while st < en {
        let mid = (st+en)/2

        if sum2[mid] > target { en = mid }
        else { st = mid + 1 }
    }

    return st
}

var ans = 0

for i in 0..<sum1.count {
    let diff = t - sum1[i]
    // 부배열의 합들 배열인 sum2에서 diff의 개수를 구하여 ans에 더한다.
    ans += upperBound(diff) - lowerBound(diff)
}

print(ans)
