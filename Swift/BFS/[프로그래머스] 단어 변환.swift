//
//  [프로그래머스] 단어 변환.swift
//  Algorithm
//
//  Created by 김민 on 7/2/24.
//
// 프로그래머스 단어 변환 https://school.programmers.co.kr/learn/courses/30/lessons/43163#

/*
[📌 전략]
 최소 변환 과정(최소 거리)를 찾는 문제. bfs 문제로 풀이.
 변환 과정을 그림으로 그려보면, 그래프 형식이 되고 bfs 형식으로 풀이할 수 있음을 알 수 있음.

[✅ 풀이]
 1. 한번에 한 개의 알파벳을 바꿀 수 있으므로 처리하는 로직 만들기
    Swift 특성상 문자열 처리가 까다로워 배열로 매핑하는 과정 필요
    순회하며 변환 전 단어, 변환 후 단어(words에 존재하는)의 다른 글자가 1개이면 true를 return
    그외의 경우는 false를 return
 2. begin을 큐에 담고 bfs 탐색 실시
    words를 순회하기
    이미 방문했던 단어라면 continue하여 시간 단축
    안에 있는 단어와 큐에서 dequeue한 단어가 변환이 가능하다면, enqueue 후 방문 처리
    dequeue한 요소가 target과 같으면 단계 출력
    쉬운 단계 출력을 위해 큐에 넣을 때 (변환 후 단어, 변환 단계 수) 형식으로 넣음
 3. words에 target이 없을 경우의 예외 처리 필요
 4. 방문 처리를 하지 않고도 풀이가 가능해서 처음에 그렇게 풀이했는데 시간 초과 발생함.
*/


func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var ans = 0

    func checkPossible(_ word1: String, _ word2: String) -> Bool {
        var diff = 0
        let cnt = word1.count
        let arr1 = word1.map { $0 }
        let arr2 = word2.map { $0 }

        for i in 0..<cnt {
            if arr1[i] != arr2[i] { diff += 1 }

            if diff > 1 { return false }
        }

        if diff == 1 {
            return true
        }

        return false
    }

    func bfs() {
        var q = [(begin, 0)]
        var visited = Array(repeating: false, count: 53)


        while !q.isEmpty {
            let f = q.removeFirst()
            let (txt, cnt) = (f.0, f.1)

            if txt == target {
                ans = cnt
                break
            }

            for i in 0..<txt.count {
                for (idx, word) in words.enumerated() {
                    if visited[idx] { continue }

                    let valid = checkPossible(txt, word)
                    if valid {
                        visited[idx] = true
                        q.append((word, cnt+1))
                    }
                }
            }
        }
    }

    if words.contains(target) { bfs() }

    return ans
}
