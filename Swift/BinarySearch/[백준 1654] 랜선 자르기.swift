//
//  [백준 1654] 랜선 자르기.swift
//  Algorithm
//
//  Created by 김민 on 3/8/24.
//
// 백준 1654 랜선 자르기 https://www.acmicpc.net/problem/1654

/*
[📌 전략]
 K개의 랜선들을 N개보다 크거나 같은 길이의 랜선으로 만드는 문제.
 최대 길이 s를 구하는 문제이므로 k개의 랜선 중 max값까지 모두 탐색하여 가능한 길이를 찾아야 한다.
 max값의 최대는 2^31-1이므로 logN 풀이가 필요하다 생각하여 이분 탐색으로 풀이했다.

[✅ 풀이]
 입력받은 k개의 랜선 중 max값을 찾는다.
 1부터 해당 max까지 중 최대 길이를 찾기 위해 이분 탐색을 실시한다.
 st, en, mid값을 정하고 입력받은 랜선 길이들을 순회하며 나눌 수 있을 때는 나눠 가능한 랜선의 길이를 구해 더한다.
 개수가 n개보다 부족하면 더 작은 범위를 탐색하고, n개보다 크다면 큰 범위를 탐색하여 가능한 최대 길이를 구한다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (k, n) = (line[0], line[1])
var lengths = [Int]()

(0..<k).forEach { _ in
    lengths.append(Int(readLine()!)!)
}

var result = 0
var st = 1
var en = lengths.max()!

while st <= en {
    let mid = (st+en)/2

    var sum = 0
    for length in lengths where length >= mid {
        sum += length / mid
    }

    if sum < n { en = mid-1 }
    else { st = mid+1 }
}

print(st-1)
