//
//  [프로그래머스] 피로도.swift
//  Algorithm
//
//  Created by 김민 on 9/27/24.
//
// 프로그래머스 피로도 https://school.programmers.co.kr/learn/courses/30/lessons/87946

/*
[📌 전략]
 탐험할 수 있는 최대 던전 수 찾기

[✅ 풀이]
 sol1) dfs로 완전 탐색하기
    dfs 탐색
    - 아직 0~n-1의 순서들 중 아직 방문하지 않았고, 현재 피로도가 던전의 최소 피로도보다 클 때는 던전 탐험 가능 -> 방문 처리, 재귀 함수 호출
    - 탐험이 끝나면 visited 값을 false로 변경

 sol2) 모든 조합을 구해서 그중 최대 던전 수찾기
    - 0~n-1로 만들 수 있는 길이 n개의 모든 조합 구함(백트래킹)
    - 전부 순회하며 탐험할 수 있는 던전의 최댓값을 찾음

 [📝 기록]
 sol1이 훨씬 빨랐다. (당연한 말이지만!)
 그치만 여러 상황을 대비하여 모든 조합을 구하는 방식도 시도해 본 문제.
*/

func sol1() {
    var visited = [Bool]()
    var ans = 0

    func dfs(_ n: Int, _ k: Int, _ dungeons: [[Int]], _ cnt: Int) {
        ans = max(ans, cnt)

        for i in 0..<n {
            let (minP, consumeP) = (dungeons[i][0], dungeons[i][1])
            if visited[i] { continue }
            if minP > k { continue }

            visited[i] = true
            dfs(n, k-consumeP, dungeons, cnt + 1)
            visited[i] = false
        }
    }

    func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
        let n = dungeons.count
        visited = Array(repeating: false, count: n+3)

        dfs(n, k, dungeons, 0)

        return ans
    }
}

func sol2() {
    var arr = [Int]()
    var isUsed = [Bool]()
    var combis = [[Int]]()

    func combi(_ k: Int, _ n: Int) {
        if k == n {
            combis.append(arr)
            return
        }

        for i in 0..<n {
            if isUsed[i] { continue }

            arr[k] = i
            isUsed[i] = true
            combi(k+1, n)
            isUsed[i] = false
        }
    }

    func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
        let n = dungeons.count
        arr = Array(repeating: 0, count: n)
        isUsed = Array(repeating: false, count: n+3)

        combi(0, n)

        var mx = -1

        for combi in combis {
            var curK = k
            var cnt = 0

            for num in combi {
                let (minP, consumeP) = (dungeons[num][0], dungeons[num][1])

                if curK >= minP {
                    cnt += 1
                    curK -= consumeP
                } else { break }
            }

            if cnt > mx { mx = cnt }
        }

        return mx
    }

}
