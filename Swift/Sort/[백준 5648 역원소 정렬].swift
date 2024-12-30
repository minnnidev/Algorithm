//
//  [백준 5648 역원소 정렬].swift
//  Algorithm
//
//  Created by 김민 on 2/12/24.
//
// 백준 5648 역원소 정렬 https://www.acmicpc.net/problem/5648

/*
[📌 전략]
거꾸로 뒤집는 처리는 문자열에서 reversed()를 사용함을 알면 쉽게 풀리는 문제

[✅ 풀이]
String 타입으로 수를 입력받아, 각 수에 reversed()를 하여 거꾸로 뒤집는 처리를 해 주고,
정렬 시에 Int 타입으로 변환하여 비교 및 0이 맨 처음에 오면 생략하는 작업을 진행함.
*/

var line = readLine()!.split(separator: " ")
let n = Int(line.removeFirst())!
var nums = line.map { String($0.reversed()) }

while let line = readLine() {
    nums += line.split(separator: " ").map { String($0.reversed()) }
}

nums.map { Int($0)! }.sorted().forEach {
    print($0)
}
