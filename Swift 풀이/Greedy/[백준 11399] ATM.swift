//
//  [백준 11399] ATM.swift
//  Algorithm
//
//  Created by 김민 on 12/14/23.
//
// 백준 11399 ATM https://www.acmicpc.net/problem/11399

/*
ex. 순서: [1, 2, 3, 4, 5]
3
3 + 1
3 + 1 + 4
3 + 1 + 4 + 3
3 + 1 + 4 + 3 + 2
순서가 앞일 수록 더하는 빈도가 많아진다 -> 빨리 걸리는 사람 먼저 인출하는 게 최선의 선택이다.
입력받은 시간들을 오름차순으로 정렬한 뒤, 시간과 더해지는 개수만큼 곱해서 합을 구한다.
첫 번째 순서는 N번, 두 번째 순서는 N-1번, ... 마지막 순서는 1번 더해진다. 
*/

/*
1. result 변수를 만들어서 각 순서의 걸리는 시간과 더해지는 개수만큼 직접 곱했다.
 */
//let N = Int(readLine()!)!
//var times = readLine()!.split(separator: " ").map { Int($0)! }
//var result = 0
//
//times.sort()
//
//for i in 0..<N {
//    result += (times[i] * (N - i))
//}
//
//print(result)

/*
2. 2번째 요소부터 순회하며, 누적합 개념으로 더한다.
답은 배열의 요소들의 총합이 된다.
*/

let N = Int(readLine()!)!
var times = readLine()!.split(separator: " ").map { Int($0)! }

times.sort()

for i in stride(from: 1, to: N, by: 1) {
    times[i] += times[i-1]
}

print(times.reduce(0, +))
