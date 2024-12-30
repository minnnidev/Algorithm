//
//  [백준 1092] 배.swift
//  Algorithm
//
//  Created by 김민 on 3/19/24.
//
// 백준 1092 배 https://www.acmicpc.net/problem/1092

/*
[📌 전략]
 모든 박스를 옮기는데 걸리는 최솟값을 구하기 위해선 한번에 최대한 무게 제한에 가까운 박스들을 옮겨야 한다.
 따라서 박스를 정렬시켜서 무게 제한에 가장 가까운 박스들을 우선 옮긴다.
 박스들 중 크레인 무게 제한의 최댓값보다 큰 박스가 존재하면, 모든 박수를 옮길 수 없다.
*/

let n = Int(readLine()!)!
var cranes = readLine()!.split(separator: " ").map { Int($0)! }
let _ = Int(readLine()!)!
var boxes = readLine()!.split(separator: " ").map { Int($0)! }
var cnt = 0

cranes.sort(by: >)
boxes.sort(by: >) // 정렬

func solution() {
    if boxes.contains(where: { $0 > cranes[0] }) { // 크레인 무게 제한보다 큰 박스가 존재하면 이동 불가
        cnt = -1
        return
    }

    while !boxes.isEmpty { // 박스를 다 옮길 때까지
        for crane in cranes {
            for i in 0..<boxes.count {
                if crane >= boxes[i] { // 무게 제한보다 작은 박스가 존재하면 박스 이동
                    boxes.remove(at: i)
                    break
                }
            }
        }
        cnt += 1
        // 모든 크레인은 동시에 작업하므로 for문이 끝난 이후 cnt 갱신
        // 박스를 옮길 수 없는 경우는 앞에서 예외 처리를 했으므로, 다른 조건 없이 cnt 갱신해도 됨.
    }
}

solution()
print(cnt)
