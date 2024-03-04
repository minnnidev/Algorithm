//
//  [백준 10816] 숫자 카드 2.swift
//  Algorithm
//
//  Created by 김민 on 3/4/24.
//
// 백준 10816 숫자 카드 2 https://www.acmicpc.net/problem/10816

/*
[📌 전략]
이분 탐색을 사용해서 풀이해 보기.
등장 횟수는 해당 값을 정렬되어 있는 배열에 오름차순 순서가 유지되도록 삽입하려 할 때
처음으로 삽입할 수 있는 곳(기존 정렬 배열에서 해당 값이 첫 번째로 등장하는 인덱스),
마지막으로 삽입할 수 있는 곳(기존 정렬 배열에서 해당 값이 마지막으로 등장하는 인덱스의 다음 인덱스)
를 구하여 마지막으로 삽입할 수 있는 곳 - 처음으로 삽입할 수 있는 곳 으로 구할 수 있다.
이는 마찬가지로 등장하지 않을 때도 성립한다.
*/

/*
 [✅ 1번 풀이] 이분 탐색
 */
let _ = Int(readLine()!)!
var arr1 = readLine()!.split(separator: " ").map { Int($0)! }
arr1.sort()

let _ = Int(readLine()!)!
var arr2 = readLine()!.split(separator: " ").map { Int($0)! }

// 처음으로 삽입할 수 있는 곳 구하는 함수 - 기존 정렬 배열에서 해당 값이 첫 번째로 등장하는 인덱스
func lowerIdx(_ target: Int) -> Int {
    var st = 0
    var en = arr1.count
    while st < en {
        var mid = (st+en)/2
        if arr1[mid] >= target { en = mid } // arr1[mid]가 타겟보다 크거나 같다면 en은 mid가 될 수 있다
        else { st = mid + 1 }
    }
    return st
}

// 마지막으로 삽입할 수 있는 곳 구하기 - 기존 정렬 배열에서 해당 값이 마지막으로 등장하는 인덱스의 다음 인덱스
func upperIdx(_ target: Int) -> Int {
    var st = 0
    var en = arr1.count
    while st < en {
        var mid = (st+en)/2
        if arr1[mid] > target { en = mid } // arr1[mid]가 타겟보다 크다면 같다면 en은 mid가 될 수 있다
        else { st = mid + 1 }
    }
    return st
}

var result = ""
arr2.forEach {
    result += "\(upperIdx($0) - lowerIdx($0)) "
}

print(result)

/*
 [✅ 2번 풀이] 
 딕셔너리를 이용하여 입력받은 n개의 수를 빈도수를 직접 카운트한다.
 2번째로 입력받은 배열의 값에 해당하는 key의 value를 순서대로 출력한다.
 */
//let _ = Int(readLine()!)!
//var arr1 = readLine()!.split(separator: " ").map { Int($0)! }
//
//let _ = Int(readLine()!)!
//var arr2 = readLine()!.split(separator: " ").map { Int($0)! }
//var freqs = [Int: Int]()
//
//arr1.forEach {
//    freqs[$0, default: 0] += 1
//}
//
//var result = ""
//for num in arr2 {
//    guard let freq = freqs[num] else { result += "0 "; continue }
//    result += "\(freq) "
//}
//print(result)
