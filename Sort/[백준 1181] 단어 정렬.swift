//
//  [백준 1181] 단어 정렬.swift
//  Algorithm
//
//  Created by 김민 on 2/12/24.
//
// 백준 1181 단어 정렬 https://www.acmicpc.net/problem/1181

/*
[📌 전략]
중복된 값을 입력받지 않기 위해 set collection을 사용했다.
swift의 sort 알고리즘은 stable sort이므로 정렬을 진행했을 때, 중복된 값의 순서가 바뀌지 않음을 의미한다.
따라서 먼저 사전순으로 정렬해 준 뒤, 길이가 짧은 순으로 다시 한번 정렬했다.

[📝 기록]
set collection은 순서가 없으니 막연하게 정렬이 안 될 것이라 생각하고, 처음에 배열로 바꿔서 정렬했는데
Set<String>은 sorted 사용이 가능하고 이는 [String]을 반환한다.
*/

let n = Int(readLine()!)!
var inputs = Set<String>()

for _ in 0..<n {
    inputs.insert(readLine()!)
}

var words = inputs.sorted()
words.sort { $0.count < $1.count }

/*
 var words = Array(inputs)
 words.sort()
 words.sort { $0.count < $1.count }
 */

print(words.joined(separator: "\n"))
