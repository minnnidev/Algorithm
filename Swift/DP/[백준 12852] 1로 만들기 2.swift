//
//  [백준 12852] 1로 만들기 2.swift
//  Algorithm
//
//  Created by 김민 on 2/19/24.
//
// 백준 12852 1로 만들기 2 https://www.acmicpc.net/problem/12852

/*
[📌 전략]
1로 만들기 문제에서 그 경로까지 같이 출력해야 하는 문제.
n까지의 최소 연산 횟수를 dp 알고리즘으로 구하고, 경로는 n부터 역순으로 찾아나가는 풀이와
한번에 연산 횟수와 경로까지 구하는 2가지 풀이로 구현했다.
*/

/*
[✅ 1번 풀이]
dp 테이블을 숫자 x까지 필요한 최소 연산의 횟수로 정의하여
n까지 순회하며
현재 인덱스가
1. 3으로 나누어지는 경우에는 d[i] = d[i/3] + 1
2. 2로 나누어지는 경우에는 d[i] = d[i/2] + 1
3. 모든 경우에 d[i] = d[i-1] + 1
이 중 최솟값을 구하여 d[i]에 저장해 준다.
이를 반복하며 d[n]의 값을 구해준다.

경로를 구하기 위해 n부터 역순으로 찾아간다.
d[i/3], d[i/2], d[i-1] 중 최솟값이, i로 도달하기 위한 경로이다.
따라서 해당 경우로 인덱스를 갱신한 후, 갱신한 인덱스부터 다시 탐색을 시작하여 모든 경로를 구한다.
 */
//let n = Int(readLine()!)!
//var d = Array(repeating: 0, count: n+1)
//
//for i in 1...n {
//    if i == 1 { continue }
//    if i == 2 {
//        d[2] = 1
//        continue
//    }
//
//    var cnt = Int.max
//    if i % 3 == 0 { cnt = min(cnt, d[i/3]) }
//    if i % 2 == 0 { cnt = min(cnt, d[i/2]) }
//    cnt = min(cnt, d[i-1])
//
//    d[i] = cnt + 1
//}
//
//var index = n
//var paths = [n]
//while index > 1 {
//    var (d3, d2, d1) = (Int.max, Int.max, Int.max)
//    if index % 3 == 0 { d3 = d[index / 3] }
//    if index % 2 == 0 { d2 = d[index / 2] }
//    d1 = d[index-1]
//
//    let min = min(d3, d2, d1)
//    if min == d3 {
//        index /= 3
//    } else if min == d2 {
//        index /= 2
//    } else {
//        index -= 1
//    }
//
//    paths.append(index)
//}
//
//print(d[n])
//print(paths.map { String($0) }.joined(separator: " "))

/*
 [✅ 2번 풀이]
 prev라는 변수를 만들어 i까지 오기 위해 i/3, i/2, i-1 인덱스 중 어느 경로를 통해 도달하였는지
 저장한다.
 prev 변수는 path 배열에 저장하여 경로 출력 시에 사용한다.
 따라서 path[i]는 i에 도달하기 전에 path[i] 숫자를 거쳤다는 의미가 된다.
 */
let n = Int(readLine()!)!
var d = Array(repeating: 0, count: n+1)
var path = Array(repeating: 0, count: n+1)

for i in 2..<n+1 {
    d[i] = d[i-1] + 1
    var prev = n-1

    if i % 3 == 0 && d[i/3] + 1 < d[i] {
        d[i] = d[i/3] + 1
        prev = i/3
    }

    if i % 2 == 0 && d[i/2] + 1 < d[i] {
        d[i] = d[i/2] + 1
        prev = i/2
    }

    path[i] = prev
}

var x = n
var answer = ""

while x > 0 {
    answer += "\(x) "
    x = path[x]
}

print(d[n])
print(answer.map { String($0) }.joined(separator: " "))
