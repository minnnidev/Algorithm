//
//  [백준 16165] 걸그룹 마스터 준석이.swift
//  Algorithm
//
//  Created by 김민 on 7/9/24.
//
// 백준 16165 걸그룹 마스터 준석이 https://www.acmicpc.net/problem/16165

/*
[📌 전략]
 입력받은 그룹 이름을 key, 각 그룹의 멤버를 value로 딕셔너리를 정의하여, 퀴즈에서 해당 딕셔너리에 접근하여 풀이

[✅ 풀이]
 입력받은 그룹 이름을 key, 각 그룹의 멤버를 value로 딕셔너리로 정의
 퀴즈를 할 때, 입력받은 숫자를 0과 1로 구분
 0일 때는 속한 팀의 멤버 이름을 사전순으로 출력
    입력받은 그룹 이름을 key값으로 딕셔너리에 접근하여 value값들을 정렬하여 출력
 1일 때는 멤버가 속한 팀의 이름을 출력
    딕셔너리를 순회하며 value들 중 멤버가 속하는 팀(key)를 구하고 출력
[📝 기록]
 나는 딕셔너리 하나만 가지고 해결했는데, 팀 딕셔너리, 멤버 딕셔너리 두 가지로 해결하여 퀴즈 반복문에서 효율적으로 계산하신 분들도 많았다.
*/

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var group = [String: [String]]()

for _ in 0..<n {
    let team = readLine()!
    let num = Int(readLine()!)!

    for _ in 0..<num {
        let name = readLine()!
        group[team, default: []].append(name)
    }
}

for _ in 0..<m {
    let name = readLine()!
    let num = Int(readLine()!)!

    if num == 0 { // 속한 팀의 멤버 이름 사전 순으로 출력
        var members = group[name]!
        members.sorted().forEach { print($0) }

    } else { // 멤버가 속한 팀 이름 출력
        for team in group {
            if team.value.contains(name) {
                print(team.key)
                break
            }
        }
    }
}
