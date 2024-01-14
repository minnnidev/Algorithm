//
//  [백준 1074] Z.swift
//  Algorithm
//
//  Created by 김민 on 1/14/24.
//
// 백준 1074 Z

/*
[📝 기록]
재귀 알고리즘 문제를 풀기 위해서 귀납적으로 생각하는 게 아직 너무 어렵다. 💦
결국 풀지 못해서 바킹독님의 풀이를 참고했다.(https://youtu.be/8vDDJm5EewM?si=WkgxMUu4Vx_92vMD)

[📌 전략]
(r, c)의 위치가 4등분된 사각형 중 몇 번째 사각형에 속하는지를 알아야 한다.
또한, 2^n-1 * 2^n-1 하나의 크기의 사각형에 (r, c)의 위치를 대응해 보면, (r, c) 위치를 방문하는 순서는
첫 번째 사각형에 속할 때, 첫 번째 사각형에서 (r, c)의 방문 순서
두 번째 사각형에 속할 때, 첫 번째 사각형을 모두 방문하고(2^n-1 * 2^n-1번) 두 번째 사각형에서 (r, c-2^n-1)을 방문한 순서
세 번째 사각형에 속할 때, 첫 번째, 두 번째 사각형을 모두 방문하고(2^n-1 * 2^n-1 * 2번) 세 번째 사각형에서 (r-2^n-1, c)을 방문한 순서
네 번째 사각형에 속할 때, 첫 번째~세 번째 사각형을 모두 방문하고(2^n-1 * 2^n-1 * 3번) 네 번째 사각형에서 (r-2^n-1, c-2^n-1)을 방문한 순서
와 같다.
-> n-1일 때의 결과를 n의 결과를 구할 때 이용.

[✅ 풀이]
2^n*2^n 배열에서 (r, c)를 방문하는 순서를 반환하는 함수 findOrder을 선언한다.
n이 0일 때는 0을 반환한다.
각 사분면에서 (r, c)에 대응하는 위치를 찾아 해당 위치를 findOrder의 파라미터로 넣어 반환한다.
*/

import Foundation

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (N, r, c) = (line[0], line[1], line[2])

func findOrder(_ n: Int, _ r: Int, _ c: Int) -> Int {
    if n == 0 { return 0 }
    let half = Int(pow(2.0, Double(n-1)))
    if (r < half && c < half) { return findOrder(n-1, r, c) }
    if (r < half && c >= half) { return findOrder(n-1, r, c-half) + half * half }
    if (r >= half && c < half) { return findOrder(n-1, r-half, c) + half * half * 2 }
    return findOrder(n-1, r-half, c-half) + half * half * 3
}

print(findOrder(N, r, c))
