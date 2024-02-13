//
//  [백준 7795] 먹을 것인가 먹힐 것인가.swift
//  Algorithm
//
//  Created by 김민 on 2/13/24.
//
// 백준 7795 먹을 것인가 먹힐 것인가 https://www.acmicpc.net/problem/7795

/*
[📌 전략]
b를 오름차순으로 정렬해서, 해당 a의 숫자가 b 숫자보다 크지 않으면 b 순회를 탈출하도록 한다.
b를 정렬했기 때문에 b의 다음 먹이들은 모두 a보다 크므로 더이상 순회하지 않아도 된다.

[✅ 풀이]
1. b를 오름차순으로 정렬
2. a 순회, b 순회를 이중 for문으로 만들어 쌍을 만든다.
  - 해당 a의 숫자가 b 숫자보다 크지 않으면 b 순회를 탈출하도록 한다.
3. 최종 쌍 개수 출력
*/


var t = Int(readLine()!)!

while t > 0 {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    var a = readLine()!.split(separator: " ").map { Int($0)! }
    var b = readLine()!.split(separator: " ").map { Int($0)! }

    b.sort() // b 오름차순 정렬

    var cnt = 0

    for i in a {
        for j in b {
            guard i > j else { break } // i > j가 아니라면 그 다음 b의 먹이들을 볼 필요 없다. 어차피 지금 먹이보다 다 크다!
            cnt += 1 // i > j이면 쌍을 이룰 수 있다
        }
    }

    print(cnt)
    t -= 1
}
