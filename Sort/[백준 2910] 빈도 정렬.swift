//
//  [백준 2910] 빈도 정렬.swift
//  Algorithm
//
//  Created by 김민 on 2/13/24.
//
// 백준 2910 빈도 정렬 https://www.acmicpc.net/problem/2910

/*
[📌 전략]
등장하는 횟수가 큰 순서대로 정렬하되, 횟수가 같다면 입력받을 당시 순서로 정렬해야 함
-> 입력받을 때 처음 숫자가 등장하는 순서대로 횟수를 저장해야 한다.

[✅ 풀이]
(입력받은 숫자: 등장 횟수)로 튜플을 만들고
입력받은 숫자들을 순회하며, 이미 등장한 적이 있다면 횟수를 +1, 등장한 적이 없다면 (해당 숫자, 1)을 freqs 배열에 추가하여
등장하는 순서대로 횟수를 저장

이를 횟수가 큰 순서대로 sort하여 출력.
(swift의 sort는 stable sort이므로 자동으로 빈도가 같다면 먼저 나온 숫자가 앞에 있게 된다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, c) = (line[0], line[1])
var nums = readLine()!.split(separator: " ").map { String($0) }
var freqs = [(String, Int)]() // (입력받은 숫자: 등장 횟수)

for i in 0..<n {
    var isAppeared = false
    // freqs 배열을 순회하며 해당 숫자가 등장한 적 있는지 확인
    for j in 0..<freqs.count where freqs[j].0 == nums[i] {
        freqs[j].1 += 1
        isAppeared = true // 등장한 숫자라고 표시
        break
    }

    // 처음 등장했다면
    if !isAppeared { freqs.append((nums[i], 1)) }
}

// 등장 횟수가 큰 순서대로 sort
freqs.sort { $0.1 > $1.1 }

var result = ""
for freq in freqs {
    for _ in 0..<freq.1 {
        result += "\(freq.0) "
    }
}

print(result)
