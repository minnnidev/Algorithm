//
//  [백준 11728] 배열 합치기.swift
//  Algorithm
//
//  Created by 김민 on 2/1/24.
//
// 백준 11728 배열 합치기 https://www.acmicpc.net/problem/11728

/*
[📝 기록]
merge sort의 merge 단계를 공부할 수 있는 문제
*/

// 1.
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
let a = readLine()!.split(separator: " ").map { Int($0)! }
let b = readLine()!.split(separator: " ").map { Int($0)! }

var resultArr = ""
var (indexA, indexB) = (0, 0) // 비교를 위한 배열a의 현재 위치, 배열b의 현재 위치를 저장할 변수

for _ in 0..<n+m { // n+m만큼 순회
    if indexB == m { // 배열b의 현재 위치가 끝에 도달함. (배열 b는 합치기 끝남)
        resultArr += "\(a[indexA]) " // 배열a의 현재 위치의 수 합치기
        indexA += 1 // 인덱스를 한칸 이동시켜 다음 합치기 준비
    } else if indexA == n { // 배열a의 현재 위치가 끝에 도달함. (배열 a는 합치기 끝남)
        resultArr += "\(b[indexB]) " // 배열b의 현재 위치의 수 합치기
        indexB += 1 // 인덱스를 한칸 이동시켜 다음 합치기 준비
    } else if a[indexA] <= b[indexB] { // 배열a의 수가 작으면, 배열a의 수를 합친 후 a 인덱스 한칸 이동
        resultArr += "\(a[indexA]) "
        indexA += 1
    } else { // 배열b의 수가 작으면, 배열b의 수를 합친 후 b 인덱스 한칸 이동
        resultArr += "\(b[indexB]) "
        indexB += 1
    }
}

print(resultArr)


// 2. 빠른 입출력
//import Foundation
//
//final class FileIO {
//    private let buffer:[UInt8]
//    private var index: Int = 0
//
//    init(fileHandle: FileHandle = FileHandle.standardInput) {
//
//        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
//    }
//
//    @inline(__always) private func read() -> UInt8 {
//        defer { index += 1 }
//
//        return buffer[index]
//    }
//
//    @inline(__always) func readInt() -> Int {
//        var sum = 0
//        var now = read()
//        var isPositive = true
//
//        while now == 10
//                || now == 32 { now = read() } // 공백과 줄바꿈 무시
//        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
//        while now >= 48, now <= 57 {
//            sum = sum * 10 + Int(now-48)
//            now = read()
//        }
//
//        return sum * (isPositive ? 1:-1)
//    }
//
//    @inline(__always) func readString() -> String {
//        var now = read()
//
//        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
//
//        let beginIndex = index-1
//
//        while now != 10,
//              now != 32,
//              now != 0 { now = read() }
//
//        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
//    }
//
//    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
//        var now = read()
//
//        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
//
//        let beginIndex = index-1
//
//        while now != 10,
//              now != 32,
//              now != 0 { now = read() }
//
//        return Array(buffer[beginIndex..<(index-1)])
//    }
//}
//
//let fIO = FileIO()
//let (n, m) = (fIO.readInt(), fIO.readInt())
//var a = Array(repeating: 0, count: n)
//var b = Array(repeating: 0, count: m)
//
//for i in 0..<n {
//    a[i] = fIO.readInt()
//}
//
//for i in 0..<m {
//    b[i] = fIO.readInt()
//}
//
//var resultArr = [Int]()
//var (indexA, indexB) = (0, 0)
//
//while true {
//    if indexA == n { // 배열a의 합치기가 모두 끝났다면 배열b의 남은 부분 합치기
//        resultArr.append(contentsOf: b[indexB...m-1])
//        break
//    }
//
//    if indexB == m { // 배열b의 합치기가 모두 끝났다면 배열a의 남은 부분 합치기
//        resultArr.append(contentsOf: a[indexA...n-1])
//        break
//    }
//
//    if a[indexA] > b[indexB] { // 배열a의 현재 인덱스의 수와 배열b의 현재 인덱스의 수 비교 - 배열b의 수가 작다면
//        resultArr.append(b[indexB]) // 배열b의 수를 먼저 넣어주고, b인덱스 +1
//        indexB += 1
//    } else { //배열a의 현재 인덱스의 수가 작다면
//        resultArr.append(a[indexA]) // 배열a의 수를 먼저 넣어주고, a인덱스 +1
//        indexA += 1
//    }
//}
//
//print(resultArr.map { String($0) }.joined(separator: " "))
