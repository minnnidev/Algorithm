//
//  [백준 1431] 시리얼 번호.swift
//  Algorithm
//
//  Created by 김민 on 2/10/24.
//
// 백준 1431 시리얼 번호 https://www.acmicpc.net/problem/1431

let n = Int(readLine()!)!
var nums = Array(repeating: "", count: n)

for i in 0..<n {
    nums[i] = readLine()!
}

nums.sort {
    let (c0 ,c1) = ($0.count, $1.count)
    if c0 == c1 { // 길이가 같으면 -> 숫자의 합을 봐야 함
        // nil 값은 제거한 결과를 반환하는 compactMap을 사용하여 합 구하기
        let sum0 = $0.compactMap { Int(String($0)) }.reduce(0, +)
        let sum1 = $1.compactMap { Int(String($0)) }.reduce(0, +)
        // 합이 같으면 사전순 정렬, 합이 같지 않으면 합이 작은순으로 정렬
        return sum0 == sum1 ? $0 < $1 : sum0 < sum1
    } else {
        return c0 < c1 // 길이가 같지 않으면 길이순으로 정렬
    }
}

nums.forEach {
    print($0)
}

/*
 [📝 기록]
 sum을 구할 때
 let sum0 = $0.compactMap(\.wholeNumberValue).reduce(0, +)
 let sum1 = $1.compactMap(\.wholeNumberValue).reduce(0, +)

 이렇게 wholeNumber라는 프로퍼티를 사용할 수 있다고 한다.
 이 프로퍼티는 문자가 정수일 경우 해당 문자의 숫자 값을 나타낼 수 있다고 함.
 */
