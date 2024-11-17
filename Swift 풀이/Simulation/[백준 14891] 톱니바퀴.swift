//
//  [백준 14891] 톱니바퀴.swift
//  Algorithm
//
//  Created by 김민 on 3/3/24.
//
// 백준 14891 톱니바퀴 https://www.acmicpc.net/problem/14891

/*
[📌 전략]
 1. 회전을 시작하는 톱니바퀴를 기준으로 극이 다를 경우에만 회전이 이어질 수 있다. 이때 회전 방향은 반대이다.
 2. 극이 같을 경우에는 그 이후로 이어지는 톱니바퀴는 회전할 수 없다.
 3. 모든 톱니바퀴의 회전 여부는 톱니바퀴를 회전시킨 이후가 아닌 회전을 시작하기 전 초기 상태에서 결정한다.
 4. 시계 방향 & 반시계 방향 회전의 알맞은 인덱스 처리
 4가지 포인트를 고려하여 문제를 풀이한다.

[✅ 풀이]
 시작하는 톱니바퀴를 기준으로 왼쪽 방향, 오른쪽 방향으로 나눠 회전 여부를 결정한다.
 while 문으로 범위 내인지 체크하며
 - 왼쪽 방향으로 이어지는 톱니바퀴의 회전 여부를 판단할 때는, 현재 index 톱니바퀴의 9시 방향(입력받은 톱니바퀴의 6번째 인덱스),
   왼쪽 톱니바퀴의(index-1) 3시 방향(2번째 인덱스)를 비교하여 극이 다른지 체크하고, 극이 다르다면 다음 왼쪽 톱니바퀴도 회전 가능 여부를 판단한다.
 - 오른쪽 방향으로 이어지는 톱니바퀴의 회전 여부를 판단할 때는,
   현재 index 톱니바퀴의 3시 방향(2번째 인덱스)와 오른쪽 톱니바퀴의 9시 방향(6번째 인덱스)를 비교하여 극이 다른지 체크하고 반복한다.

 최종적으로 결정된 4개의 톱니바퀴를의 회전 여부를 하나씩 순회하며 시계, 반시계 방향에 따라 회전시킨다.
 시계 방향 회전은 배열에서 마지막 인덱스를 배열의 첫 번째 인덱스로 넣어주며 구현할 수 있고,
 반시계 방향 회전은 배열에서 첫 번째 인덱스를 제거하여 배열의 마지막에 넣어주며 구현할 수 있다.
*/

var gear1 = readLine()!.map { Int(String($0))! }
var gear2 = readLine()!.map { Int(String($0))! }
var gear3 = readLine()!.map { Int(String($0))! }
var gear4 = readLine()!.map { Int(String($0))! }
let k = Int(readLine()!)!
var gears = [gear1, gear2, gear3, gear4]

// 시계 방향 회전
func spinCW(_ gear: [Int]) -> [Int] {
    var g = gear
    let last = g.popLast()!
    g.insert(last, at: 0)
    return g
}

// 반시계 방향 회전
func spinCCW(_ gear: [Int]) -> [Int] {
    var g = gear
    let first = g.removeFirst()
    g.append(first)
    return g
}

func spinGear(_ startGear: Int, _ startDir: Int) {
    var dirs = [0, 0, 0, 0]
    dirs[startGear] = startDir

    // 시작하는 톱니바퀴 기준 왼쪽 톱니바퀴들을 회전시킬지 판단하기
    var idx = startGear
    while idx > 0 && gears[idx][6] != gears[idx-1][2] {
        dirs[idx-1] = -dirs[idx]
        idx -= 1
    }

    // 시작하는 톱니바퀴 기준 오른쪽 톱니바퀴들을 회전시킬지 판단하기
    idx = startGear
    while idx < 3 && gears[idx][2] != gears[idx+1][6] {
        dirs[idx+1] = -dirs[idx]
        idx += 1
    }

    for i in 0..<4 {
        if dirs[i] == -1 { gears[i] = spinCCW(gears[i]) }
        else if dirs[i] == 1 { gears[i] = spinCW(gears[i]) }
    }
}

for _ in 0..<k {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (num, dir) = (line[0], line[1])

    spinGear(num-1, dir)
}

var sum = 0
if gears[0][0] == 1 { sum += 1 }
if gears[1][0] == 1 { sum += 2 }
if gears[2][0] == 1 { sum += 4 }
if gears[3][0] == 1 { sum += 8 }
print(sum)
