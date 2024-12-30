//
//  [백준 22856] 트리 순회.swift
//  Algorithm
//
//  Created by 김민 on 8/7/24.
//
// 백준 22856 트리 순회 https://www.acmicpc.net/problem/22856

/*
[📌 전략]
 * point 1. 트리 중위 순회 문제
 문제에서 중위 순회에서 살짝 변경된 로직을 제공해서 그대로 구현하면 됨

 * point 2. 유사 중위 순회의 끝
 주어진 로직을 그려 보면 유사 중위 순회의 끝은 트리의 가장 오른쪽 노드
 유사 중위 순회 전에 순회이 끝 노드를 먼저 구해두고 순회 시 조건으로 사용하기

[✅ 풀이 1]
 1. 현재(자신) 노드, 왼쪽 자식 노드, 오른쪽 자식 노드, 부모 노드 정보 필요
    현재 노드는 인덱스를 기준으로 하여 왼쪽 자식, 오른쪽 자식, 부모 노드 정보를 저장할 배열을 각각 만듦.
 2. 유사 중위 순회의 끝 노드 구하기
    가장 오른쪽 노드를 구하면 됨.
 3. 유사 중위 순회
    왼쪽 자식 노드가 존재하면(-1이 아니라면) 방문하고 횟수 추가
    오른쪽 자식 노드가 존재하면(-1이 아니라면) 방문하고 횟수 추가
    현재 노드가 유사 중위 순회의 끝이라면 flag true로 변경
    flag가 true라면 return
    모든 위의 케이스를 지나쳐 왔다면, 부모 노드로 이동하는 것이므로 횟수 추가
*/


let n = Int(readLine()!)!
let mx = 100_002
var lcArr = Array(repeating: -1, count: mx)
var rcArr = Array(repeating: -1, count: mx)
var pArr = Array(repeating: -1, count: mx)
var visited = Array(repeating: false, count: mx)

for _ in 1...n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (node, lc, rc) = (line[0], line[1], line[2])

    if lc != -1 {
        lcArr[node] = lc
        pArr[lc] = node
    }

    if rc != -1 {
        rcArr[node] = rc
        pArr[rc] = node
    }
}

var endNode = 1
var flag = false
var ans = 0

while rcArr[endNode] != -1 {
    endNode = rcArr[endNode]
}

func inorder(node: Int) {
    if lcArr[node] != -1 {
        ans += 1
        inorder(node: lcArr[node])
    }

    if rcArr[node] != -1 {
        ans += 1
        inorder(node: rcArr[node])
    }

    if node == endNode { flag = true }
    if flag { return }

    ans += 1
}

inorder(node: 1)
print(ans)

/*
[✅ 풀이 2]
 재귀 함수 대신 while문 사용
 투표인터 문제처럼 노드를 이동시키기만 하면 돼서 시간, 메모리 단축됨
*/


//let n = Int(readLine()!)!
//let mx = 100_010
//var lcArr = Array(repeating: 0, count: mx)
//var rcArr = Array(repeating: 0, count: mx)
//var pArr = Array(repeating: 0, count: mx)
//var visited = Array(repeating: false, count: mx)
//
//for _ in 1...n {
//    let line = readLine()!.split(separator: " ").map { Int($0)! }
//    let (node, lc, rc) = (line[0], line[1], line[2])
//
//    lcArr[node] = lc
//    rcArr[node] = rc
//
//    if lc != -1 { pArr[lc] = node }
//    if rc != -1 { pArr[rc] = node }
//}
//
//var ans = 0
//let root = 1
//var node = root
//var endNode = root
//pArr[root] = -1
//
//while rcArr[endNode] != -1 {
//    endNode = rcArr[endNode]
//}
//
//while true {
//    visited[node] = true
//    ans += 1
//
//    if lcArr[node] != -1 && !visited[lcArr[node]] {
//        node = lcArr[node]
//    } else if rcArr[node] != -1 && !visited[rcArr[node]] {
//        node = rcArr[node]
//    } else {
//        if node == endNode {
//            break
//        } else {
//            node = pArr[node]
//        }
//    }
//}
//
//print(ans-1)
