//
//  [백준 9466] 텀 프로젝트.swift
//  Algorithm
//
//  Created by 김민 on 5/14/24.
//
// 백준 9466 텀 프로젝트 https://www.acmicpc.net/problem/9466

/*
[📌 전략]
 싸이클을 만들어야 하나의 팀이 될 수 있다. 따라서 그래프로 풀이해야겠다고 생각했다.
*/


let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let nums = [0] + readLine()!.split(separator: " ").map { Int($0)! }
    var cnt = 0
    var visitied = Array(repeating: false, count: n+1)
    var cycle = [Int]()

    func dfs(_ v: Int) {
        visitied[v] = true
        cycle.append(v) // 싸이클 배열에 정점 추가
        var num = nums[v]

        if visitied[num] { // 방문한 적이 있다면
            if let idx = cycle.firstIndex(of: num) {
                cnt += Array(cycle[idx...]).count // 해당 정점부터 끝까지가 한 싸이클
            }
            return
        } else { // 방문하지 않았다면 dfs 탐색
            dfs(num)
        }
    }

    for i in 1...n where !visitied[i] { // 아직 방문하지 않은 사람부터 dfs 탐색
        cycle = []
        dfs(i)
    }

    print(n-cnt)
}

// 시간 초과 발생 코드
/*
 let t = Int(readLine()!)!

 for _ in 0..<t {
     let n = Int(readLine()!)!
     let nums = [0] + readLine()!.split(separator: " ").map { Int($0)! }
     var cnt = 0
     var visitied = Array(repeating: false, count: n+1)

     func dfs(_ v: Int, _ des: Int) {
         if visitied[des] && v == des {
             cnt += 1
             return
         }

         if !visitied[v] {
             visitied[v] = true
             dfs(nums[v], des)
             visitied[v] = false
         }
     }

     for i in 1...n {
         dfs(i, i)
     }

     print(n-cnt)
 }
 */
