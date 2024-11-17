//
//  [백준 14889] 스타트와 링크.swift
//  Algorithm
//
//  Created by 김민 on 9/8/24.
//
// 백준 14889 스타트와 링크 https://www.acmicpc.net/problem/14889

/*
[📌 전략]
 백트래킹으로 팀 조합을 구하고, 팀 내의 조합에 따른 능력치를 구하는 문제

[✅ 풀이]
 1. 백트래킹으로 2개의 팀 조합을 구함
    - 오름차순으로 n/2명을 스타트팀 구하도록 백트래킹 구현
    - getOtherTeam 메서드로 링크팀 구함 (1~n 중에 스타트팀에 속하지 않는 팀원)
    - 스타트팀의 첫 번째 사람이 링크팀의 첫 번째 사람보다 번호가 작을 경우에만 팀 조합으로 포함하여, 스타트팀 인원 그대로가 링크팀으로 가는 경우를 제외시킴
 2. 각 팀의 능력치를 구하기
    - 각팀에서 2명(i, j)를 뽑고 능력치의 합(Sij, Sji) 구하기 위해 2중 for문 순회하여 각 팀의 능력치 합 찾기
    - 외부 for문 범위를 0..<n/2, 내부 for문 범위를 i+1..<n/2로 하여 중복된 조합을 뽑지 않도록 함
    - 능력치의 차이가 최소인 경우로 갱신하기

[📝 기록]
 처음엔 2번도 백트래킹으로 구현했는데, 반복문으로 돌리니 훨씬 빠름. 유연한 사고를 가지자
*/


let n = Int(readLine()!)!
var arr = Array(repeating: [Int](), count: n+1)

for i in 1...n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i] = [0] + line
}

// n/2명 뽑고, 나머지도 구해서 팀 2개로 나누기
var tmpArr = Array(repeating: 0, count: n/2)
var isUsed = Array(repeating: false, count: n+1)
var teams = [([Int], [Int])]()

func makeTwoTeams(_ k: Int, _ i: Int, _ cnt: Int) {
    if k == n/2 {
        let otherTeam = getOtherTeam(tmpArr)

        if tmpArr[0] < otherTeam[0] { teams.append((tmpArr, otherTeam)) }
        return
    }

    for i in i...n {
        if isUsed[i] { continue }

        isUsed[i] = true
        tmpArr[k] = i
        makeTwoTeams(k+1, i, cnt + 1)
        isUsed[i] = false
    }
}

func getOtherTeam(_ arr: [Int]) -> [Int] {
    var result = [Int]()

    for num in 1...n {
        if arr.contains(num) { continue }

        result.append(num)

    }

    return result
}

makeTwoTeams(0, 1, 0)

var min = Int.max

for team in teams {
    let (team1, team2) = (team.0, team.1)
    var (team1V, team2V) = (0, 0)

    for i in 0..<n/2 {
        for j in i+1..<n/2 {
            team1V += arr[team1[i]][team1[j]] + arr[team1[j]][team1[i]]
            team2V += arr[team2[i]][team2[j]] + arr[team2[j]][team2[i]]
        }
    }

    let diff = abs(team1V - team2V)
    if diff < min { min = diff }
}

print(min)
