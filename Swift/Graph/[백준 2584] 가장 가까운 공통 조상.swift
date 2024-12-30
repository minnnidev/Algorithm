//
//  [백준 2584] 가장 가까운 공통 조상.swift
//  Algorithm
//
//  Created by 김민 on 10/9/24.
//
// 백준 2584 가장 가까운 공통 조상 https://www.acmicpc.net/problem/3584

/*
[📌 전략]
 기준이 되는 가장 가까운 공통 조상으로부터 출발하여 노드의 부모 노드들을 전부 파악 -> dfs
 파악한 부모 노드들을 비교하여, 일치하는 부모 노드들 중 가장 빠르게 나타나는 것 선택

[✅ 풀이]
 1. 인덱스 기준으로 각 인덱스 노드의 부모 노드를 저장하는 p 배열 선언
    root 선언 및 구하기 (나는 p 배열의 초깃값을 -1로 지정하여, 루트는 p가 -1인 노드)
 2. 전체 부모 노드들 파악하기 (dfs)
    입력받은 출발 노드를 기준으로 출발하여, root까지 탐색
 3. 두 개의 노드 각각 dfs 탐색을 실시하여, 전체 부모 노드들을 비교
    일치하는 부모 노드들 중 가장 먼저 나오는 것을 최종 답으로 출력
*/


let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var p = Array(repeating: -1, count: n+1)

    for _ in 1..<n {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        p[line[1]] = line[0]
    }

    let line = readLine()!.split(separator: " ").map { Int($0)! }

    let root = p.dropFirst().firstIndex(of: -1)!

    func dfs(cur: Int) -> [Int] {
        if root == cur { return [root] }

        return [cur] + dfs(cur: p[cur])
    }

    let a = dfs(cur: line[0])
    let b = dfs(cur: line[1])

    print(a.first { num in b.contains(num) }!)
}
