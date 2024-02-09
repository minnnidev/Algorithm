//
//  [백준 11650] 좌표 정렬하기.swift
//  Algorithm
//
//  Created by 김민 on 2/9/24.
//
// 백준 11650 좌표 정렬하기 https://www.acmicpc.net/problem/11650

/*
[✅ 풀이]
x 좌표가 증가하는 순, x 좌표가 같으면 y좌표가 증가하는 순으로 정렬
sort: 파라미터로 오는 클로저는 첫 번째 인수가 두 번째 인수 앞에 정렬되어야 하는 경우 true를 반환하는 클로저
따라서 첫 번째 인수와 두 번째 인수의 x 좌표가 같은 경우, $0[1] < $1[1]를 반환
나머지 경우는 $0[0] < $1[0]를 반환
*/


let n = Int(readLine()!)!
var coordinates = [[Int]]()

for _ in 0..<n {
    coordinates.append(readLine()!.split(separator: " ").map { Int($0)! })
}

// 첫 번째 인수가 두 번째 인수 앞에 정렬되어야 하는 경우 true를 반환하도록 조건 만들기
coordinates.sort {
    if $0[0] == $1[0] {
        return $0[1] < $1[1]
    } else {
        return $0[0] < $1[0]
    }
}

coordinates.forEach {
    print($0[0], $0[1])
}
