//
//  [백준 1991] 트리 순회.swift
//  Algorithm
//
//  Created by 김민 on 7/24/24.
//
// 백준 1991 트리 순회 https://www.acmicpc.net/problem/1991

/*
[📌 전략]
 전위, 중위, 후위 트리 순회의 결과를 출력하는 문제
 이를 위해서 lc(왼쪽 자식 노드), rc(오른쪽 자식 노드) 배열을 만들고 재귀 함수로 풀이하였음
 순회 로직보다 입력 로직이 조금 더 까다로웠음

[✅ 풀이]
 1. 입력받기
    문자들을 ascii 값으로 변환하여 배열의 인덱스로 넣어주었음
    lc[0] -> "A"의 왼쪽 자식노드 / rc[0] -> "A"의 오른쪽 자식 노드
    형식으로 저장됨
 2. 전위, 중위, 후위 순회 실시
    문제에 써저있는 로직대로 재귀함수 실시
*/


let n = Int(readLine()!)!
var lc = Array(repeating: 0, count: 28)
var rc = Array(repeating: 0, count: 28)
var ans = ""

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { String($0) }
    let (c, l, r) = (line[0], line[1], line[2])

    let asciiC = Int(UnicodeScalar(c)!.value)
    let asciiL = Int(UnicodeScalar(l)!.value)
    let asciiR = Int(UnicodeScalar(r)!.value)

    if l != "." { lc[asciiC-65] = asciiL-65 }
    if r != "." { rc[asciiC-65] = asciiR-65 }
}

func preorder(_ cur: Int) {
    ans += String(UnicodeScalar(cur + 65)!)

    if lc[cur] != 0 { preorder(lc[cur]) }
    if rc[cur] != 0 { preorder(rc[cur]) }
}

func inorder(_ cur: Int) {
    if lc[cur] != 0 { inorder(lc[cur]) }

    ans += String(UnicodeScalar(cur + 65)!)

    if rc[cur] != 0 { inorder(rc[cur]) }
}

func postorder(_ cur: Int) {
    if lc[cur] != 0 { postorder(lc[cur]) }
    if rc[cur] != 0 { postorder(rc[cur]) }

    ans += String(UnicodeScalar(cur + 65)!)
}

preorder(0)
ans += "\n"
inorder(0)
ans += "\n"
postorder(0)

print(ans)
