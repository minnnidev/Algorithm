//
//  [백준 1931] 회의실 배정.swift
//  Algorithm
//
//  Created by 김민 on 12/13/23.
//
// 백준 1931 회의실 배정 https://www.acmicpc.net/problem/1931

/*
각 회의가 겹치지 않게 하면서 회의실을 사용할 수 있는 회의의 최대 개수 -> 최대한 많은 회의
회의가 빨리 끝나야 최대한 많은 회의를 한다 == 종료 시간이 빨라야 한다.
종료 시간이 같은 경우는 예외적인 상황이 된다.
(3, 4) / (4, 4) 회의가 있는 경우에 (4, 4) 회의를 선택하면 회의 개수가 1개이지만, (3, 4)를 선택하면 (4, 4)까지 선택할 수 있다.
따라서 회의 배열의 정렬을 종료 시간이 빠른 순에, 종료 시간이 같을 시에는 시작 시간이 빠른 순으로 정렬한다.
정렬된 배열을 순회하며, 다음 회의의 시작 시간이 현재 회의의 종료된 시간보다 크거나 같은 회의를 선택해서 개수를 구해 주면 된다.
*/

let N = Int(readLine()!)!
var times = [[Int]]()

for _ in 0..<N {
    times.append(readLine()!.split(separator: " ").map { Int($0)! })
}

times.sort {
    if $0[1] == $1[1] {
        return $0[0] < $1[0]
    } else {
        return $0[1] < $1[1]
    }
}

var now = -1
var result = 0

for i in 0..<times.count {
    if times[i][0] >= now {
        now = times[i][1]
        result += 1
    }
}

print(result)
