//
//  [백준 1593] 문자 해독.swift
//  Algorithm
//
//  Created by 김민 on 10/9/24.
//
// 백준 1593 문자 해독 https://www.acmicpc.net/problem/1593

/*
[📌 전략]
 w의 모든 순열을 s에서 찾아야 하지만, 이중 for문으로 찾을 시 시간 초과
 크기가 w의 길이로 고정되어 있으니, 슬라이딩 윈도우로 풀이

 w가 s에 포함되는 부분 문자열이라는 것은 어떻게 판단할 수 있을까?
 wArr 선언 - w에 포함되어 있는 A~Z, a~z의 문자 개수를 표현하는 배열. 인덱스가 각 문자의 아스키코드, 각 인덱스의 요소는 해당 문자의 개수
 sArr 선언 - s의 w길이만큼의 부분 수열의 A~Z, a~z의 문자 개수를 표현하는 배열. (위와 같은 로직)
 이 2개의 배열이 같아지면, w가 s의 부분 문자열로 속한다는 뜻

[✅ 풀이]
 1. wArr, sArr선언
 2. setAscii 함수 선언
    - 각 문자의 개수를 세어 알맞은 배열에 추가해 줌.
    - inout을 사용하여 wArr, sArr에서 동시에 사용할 수 있도록 함
    - 대문자일 때는 아스키코드값에서 65(A의 아스키코드)를 빼고, 소문자일 때는 97(a의 아스키코드)을 뺀 후 26을 더해 주어, 대문자 & 소문자 모두를 한 배열에 표현
 3. wArr의 문자 파악
 4. 슬라이딩 윈도우를 사용하여 w가 s에 속하는지 파악하기
    - size: 슬라이딩 윈도우 길이
    - start: 윈도우의 첫 번째 인덱스
             반복문이 수행될 때마다 start를 1 더해주어, 슬라이딩이 일어났음을 나타냄
    - size가 w의 길이와 같아지면, wArr과 sArr이 같은지 파악하고, 같을 시 ans 갱신.
      start를 1 늘려주고, size를 1 빼주어 다음 슬라이딩이 일어났을 때를 위한 대비
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (wCnt, gCnt) = (line[0], line[1])
let w = readLine()!.map { $0 }
let s = readLine()!.map { $0 }

var wArr = Array(repeating: 0, count: 52)
var sArr = Array(repeating: 0, count: 52)

func setAscii(ch: Character, arr: inout [Int], diff: Int) {
    let ascii = Int(ch.asciiValue!)

    if ch >= Character("a") && ch <= Character("z") {
        arr[ascii-97 + 26] += diff
    } else {
        arr[ascii-65] += diff
    }
}

for i in 0..<wCnt {
    // a: 97, A: 65
    setAscii(ch: w[i], arr: &wArr, diff: 1)
}

var size = 0
var ans = 0
var start = 0

for i in 0..<gCnt {
    let ch = s[i]
    setAscii(ch: ch, arr: &sArr, diff: 1)
    size += 1

    if size == wCnt {
        if wArr == sArr { ans += 1 }
        setAscii(ch: s[start], arr: &sArr, diff: -1)
        start += 1
        size -= 1
    }
}

print(ans)
