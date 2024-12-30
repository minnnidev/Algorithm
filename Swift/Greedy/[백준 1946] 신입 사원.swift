//
//  [백준 1946] 신입 사원.swift
//  Algorithm
//
//  Created by 김민 on 1/14/24.
//
// 백준 1946 신입 사원 https://www.acmicpc.net/problem/1946

/*
[📌 전략]
다른 모든 지원자와 비교했을 때 서류심사 성적과 면접시험 성적 중 적어도 하나가 다른 지원자보다 떨어지지 않는 자만 선발한다는 원칙을 세웠다.
즉, 어떤 지원자 A의 성적이 다른 어떤 지원자 B의 성적에 비해 서류 심사 결과와 면접 성적이 모두 떨어진다면 A는 결코 선발되지 않는다.
=> 서류를 다른 지원자보다 못 봤어도, 면접을 다른 지원자들(서류 순위가 자신보다 높은 지원자들)보다 잘 보면 통과다!

지원자들을 서류 심사를 잘 본 순대로 정렬. (입력받는 건 점수가 아니라 순위라는 것! 따라서 오름차순으로 정렬)
현재 지원자보다 이전 지원자들(서류 순위가 높은 지원자들) 중 자신보다 면접 순위가 높은 지원자가 있다면 탈락
현재 지원자의 면접 순위가 이전보다 높은 순위라면 갱신하여 다음 지원자의 탈락 여부를 결정한다.
== 서류 순위가 다른 지원자보다는 낮아도 면접 순위가 높으면 통과할 수 있다.

[✅ 풀이]
시간 초과 방지 위해 빠른 입출력으로 입력받기
서류 심사 순위를 오름차순으로(순위가 높은 순서대로) 정렬한다.
highestRanking 변수를 선언하여, 현재 지원자까지 중 가장 높은 순위의 면접 순위를 저장한다.
지원자 배열을 순회하며, 합격자 수를 구한다.
highestRanking보다 면접 순위가 높다면, 서류 순위는 낮지만 면접 순위는 높으므로 통과할 수 있다.
*/

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

let file = FileIO()
let T = file.readInt()

for _ in 0..<T {
    let N = file.readInt()
    var people = [(Int, Int)]()

    for _ in 0..<N {
        let line = [file.readInt(), file.readInt()]
        people.append((line[0], line[1]))
    }

    // 순위 오름차순으로 정렬
    people.sort { $0.0 < $1.0 }
    var count = 0
    var highestRanking = N + 1

    // minRanking이 현재 지원자의 순위보다 크다면(순위가 낮다면), 갱신 후 합격자 수에 추가
    for person in people where highestRanking > person.1 {
        highestRanking = person.1
        count += 1
    }

    print(count)
}
