//
//  [백준 1929] 소수 구하기.swift
//  Algorithm
//
//  Created by 김민 on 3/1/24.
//
// 백준 1929 소수 구하기 https://www.acmicpc.net/problem/1929

/*
 [✅ 1번 풀이]
 num이 소수인지 아닌지 판별하기 위해서는 2부터 루트 n까지만 판별해 보면 된다.
 */
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (m, n) = (line[0], line[1])
//
//func isPrime(_ num: Int) -> Bool {
//    if num == 1 { return false }
//
//    for i in 2..<num {
//        if i*i > num { break }
//        if num % i == 0 { return false }
//    }
//    return true
//}
//
//for num in m...n {
//    if isPrime(num) { print(num) }
//}

 /*
[✅ 2번 풀이]
소수 판정법 알고리즘 - 에라토스테네스의 체
체로 무언가를 거르는 것처럼 쇼수의 배수들을 걸러내어 소수를 찾는 알고리즘
알고리즘 특성상 범위 내의 모든 수의 소수 여부를 판정할 수 있기 때문에, 범위가 주어진 경우 효율적

1부터 n까지 배열을 순회하며 소수 여부가 true인 수 차례에서, 해당 수의 배수들은 모두 합성수가 된다.
따라서 모든 배수들의 소수 여부를 false로 바꿔준다.
  */
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (m, n) = (line[0], line[1])
//var isPrimes = Array(repeating: true, count: n+3)
//
//for i in 1...n {
//    if i == 1 { isPrimes[1] = false; continue }
//
//    guard isPrimes[i] else { continue }
//    for j in stride(from: i*2, through: n, by: i) {
//        isPrimes[j] = false
//    }
//}
//
//var answer = ""
//for i in m...n {
//    if isPrimes[i] { answer += "\(i)\n" }
//}
//print(answer)

/*
[✅ 3번 풀이] - 2번 풀이 최적화
 2번 풀이에서 for문 순회, 인덱스를 i라고 할 때,
 i가 소수여서 해당 수의 배수를 모두 제거하려고 하는 경우
 i*i 이전 수들은 전부 이전 소수들에 의해 제거된 상태이므로 i*2부터 배수를 제거하는 것이 아닌 i*i부터 배수를 제거하여 최적화 가능.
 */
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (line[0], line[1])
var isPrimes = Array(repeating: true, count: n+3)

for i in 1...n {
    if i == 1 { isPrimes[1] = false; continue }

    guard isPrimes[i] else { continue }
    for j in stride(from: i*i, through: n, by: i) {
        isPrimes[j] = false
    }
}

var answer = ""
for i in m...n {
    if isPrimes[i] { answer += "\(i)\n" }
}
print(answer)
