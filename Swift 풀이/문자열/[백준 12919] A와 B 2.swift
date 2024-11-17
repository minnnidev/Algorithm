//
//  [백준 12919] A와 B 2.swift
//  Algorithm
//
//  Created by 김민 on 10/4/24.
//
// 백준 12919 A와 B 2 https://www.acmicpc.net/problem/12919

/*
[📌 전략]
 처음에 맨 앞이 B이면 무조건 2번 연산, 아니면 1번 연산일 거라 생각했는데, BA -> BAA 반례가 있었음
 -> 두 연산을 모두 대응하기 위해서는 t -> s로 갈 때 bfs, dfs를 활용해야겠다

[✅ 풀이]
 1. bfs
    - t를 큐에 넣고 bfs 탐색
    - 큐에서 꺼낸 값 f의 길이가 s 길이보다 작으면 더이상 탐색하지 않아도 됨 -> 탈출
    - f와 s가 동일하면 변환 성공 -> 1 출력 후 return
    - 마지막 문자가 A일 때: 이전 문자열에 1번 연산을 실시한 것이므로 마지막 문자를 제거하고 큐에 넣어 재탐색
    - 첫 번째 문자가 B일 때: 이전 문자열에 2번 연산을 실시한 것이므로, 첫 번째 문자 제거 후 뒤집기 (reverse)

 2. dfs
    - 파라미터 str과 s의 길이가 같을 땓 str과 s가 동일하면 true, 아니면 false return
    - 마지막 문자가 A일 때, dfs(마지막 문자를 제거한 문자열, s)가 true일 때만 true return
    - 첫 번째 문자가 B일 때, dfs(첫 번째 문자 제거 후 뒤집기, s)가 true일 때만 true return
*/


let s = Array(readLine()!)
let t = Array(readLine()!)

func bfs(_ t: [Character], _ s: [Character]) {
    var q = [t]

    while !q.isEmpty {
        let f = q.removeFirst()

        // 두 조건 모두 가능
        if f.count < s.count { break }
//        if f.isEmpty { break }

        if f == s {
            print(1)
            return
        }

        if f.last! == Character("A") {
            var subStr = f
            _ = subStr.removeLast()
            q.append(Array(subStr))
        }

        if f[0] == Character("B") {
            var subStr = f
            _ = subStr.removeFirst()
            q.append(Array(subStr.reversed()))
        }

    }

    print(0)
}

func dfs(_ str: [Character], _ s: [Character]) -> Bool {
    if str.count == s.count { return str == s }

    if str.last! == Character("A") && dfs(str.dropLast(), s) { return true }

    if str[0] == Character("B") && dfs(str.dropFirst().reversed(), s) { return true }

    return false
}


bfs(t, s) // BFS 풀이 시 호출

print(dfs(t, s) ? 1 : 0)// DFS 풀이 시 호출
