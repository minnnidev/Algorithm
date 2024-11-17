//
//  [백준 11656] 접미사 배열.swift
//  Algorithm
//
//  Created by 김민 on 2/20/24.
//
// 백준 11656 접미사 배열 https://www.acmicpc.net/problem/11656

/*
[✅ 풀이]
입력받은 s를 n번 순회하며 맨 첫 글자를 제거하며 접미사 배열에 추가한다.
사전순 출력이므로 접미사 배열을 sort한 후 출력하면 된다.
*/

var s = readLine()!
let n = s.count
var words = [String]()

for _ in 0..<n {
    words.append(s)
    s.removeFirst()
}

words.sort()
words.forEach {
    print($0)
}

/*
[📌 전략]
s의 최대 길이가 1000이므로 n만큼 순회하며 범위만큼 잘라서 접미사 배열에 append해도 된다.
 */
//
//let s = Array(readLine()!)
//let n = s.count
//var words = [String]()
//
//for i in 0..<n {
//    words.append(String(s[i...n-1]))
//}
//
//words.sort()
//words.forEach {
//    print($0)
//}
