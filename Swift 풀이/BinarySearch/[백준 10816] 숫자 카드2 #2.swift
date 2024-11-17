//
//  [백준 10816] 숫자 카드2 #2.swift
//  Algorithm
//
//  Created by 김민 on 8/10/24.
//
// 백준 10816 숫자 카드2 https://www.acmicpc.net/problem/10816

/*
[📌 전략]
 재시도!

 숫자 카드들의 개수가 500,000개로 완전 탐색은 불가능하다고 판단
 정렬된 데이터에서 특정 데이터를 logN에 찾을 수 있는 이분 탐색 사용.

 입력받은 N개의 숫자 카드를 오름차순으로 정렬하고 찾고 싶은 숫자가 처음 등장하는 인덱스, 마지막으로 등장하는 인덱스+1 을
 이분탐색으로 구하기. 마지막으로 등장하는 인덱스+1을 구하면 바로 숫자 카드가 몇 개인지 알 수 있음
*/

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map { Int($0)! }

func lowerIdx(_ target: Int) -> Int {
    var st = 0
    var en = numbers.count

    while st < en {
        let mid = (st+en)/2

        if numbers[mid] < target { st = mid + 1 }
        else { en = mid }
    }

    return st
}

func upperIdx(_ target: Int) -> Int {
    var st = 0
    var en = numbers.count

    while st < en {
        let mid = (st+en)/2

        if numbers[mid] <= target { st = mid + 1 }
        else { en = mid }
    }

    return st
}

var result = ""

arr.forEach {
    result += "\(upperIdx($0) - lowerIdx($0)) "
}

print(result)
