//
//  [백준 17219] 비밀번호 찾기.swift
//  Algorithm
//
//  Created by 김민 on 5/29/24.
//
// 백준 17219 비밀번호 찾기 https://www.acmicpc.net/problem/17219

/*
[📌 전략]
 배열을 통해 모두 접근해서 풀면 O(n^2) -> 시간초과
 O(1)로 탐색할 수 있는 딕셔너리를 사용하여 풀이했다.

[✅ 풀이]
 1. 딕셔너리 생성 -> key: 사이트 주소 / value: 비밀번호
 2. 주어진 사이트 주소와 비밀번호로 딕셔너리를 값 추가
 3. 사이트 주소로 딕셔너리를 참조하여 value(비밀번호) 값 출력
*/


let nums = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nums[0], nums[1])
var dic = [String: String]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    dic.updateValue(input[1], forKey: input[0])
}

for _ in 0..<m {
    let site = readLine()!
    print(dic[site]!)
}

