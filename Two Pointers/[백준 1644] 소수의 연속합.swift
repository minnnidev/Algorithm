//
//  [백준 1644] 소수의 연속합.swift
//  Algorithm
//
//  Created by 김민 on 3/22/24.
//
// 백준 1644 소수의 연속합 https://www.acmicpc.net/problem/1644

/*
[📌 전략]
 에라토스테네스의 체를 활용하여 소수를 구하고,
 해당 소수들과 투포인터를 활용하여 해당하는 합의 개수를 구하는 문제
*/
// [✅ 풀이 1]
let n = Int(readLine()!)!
var isPrime = Array(repeating: true, count: n+1)
var primes = [Int]()

// 에라토스테네스의 체를 활용하여 n까지의 소수 구하기
func findPrimes() {
    for i in 1...n {
        if i == 1 { // 1은 소수가 아니다
            isPrime[1] = false
            continue
        }

        if isPrime[i] { // 소수일 경우에는 i*i부터 n까지 중 i의 간격으로 합성수들을 걸러줌
            for j in stride(from: i*i, through: n, by: i) {
                isPrime[j] = false
            }
        }
    }

    for i in 1..<n+1 { // 소수만을 찾은 배열 primes에 저장
        if isPrime[i] { primes.append(i) }
    }
}

func solution() {
    let cnt = primes.count
    var en = 0

    var total = 0 // 소수들의 합을 나타낼 total
    if let first = primes.first { total += first }
    var ans = 0

    for st in 0..<cnt { // st를 기준으로
        while en < cnt && total < n {
            en += 1 // total이 n보다 작을 때 en을 오른쪽으로 이동
            if en != cnt { total += primes[en] } // 이동한 en이 범위 내라면 total에 더햊ㅁ
        }

        if total == n { ans += 1 } // total이 n과 같아지면 ans 갱신
        if en == cnt { break } // 범위 내에 있지 않다면 탈출

        total -= primes[st] // 다음 탐색을 위해 st 위치의 소수 제거
    }

    print(ans)
}

findPrimes()
solution()

// [✅ 풀이 2]
//let n = Int(readLine()!)!
//var isPrime = Array(repeating: true, count: n+1)
//var primes = [Int]()
//
//// 에라토스테네스의 체를 사용한 n까지의 소수 구하기
//func findPrimes() {
//    for i in 1...n {
//        if i == 1 {
//            isPrime[1] = false
//            continue
//        }
//
//        if isPrime[i] {
//            for j in stride(from: i*i, through: n, by: i) {
//                isPrime[j] = false
//            }
//        }
//    }
//
//    for i in 1..<n+1 {
//        if isPrime[i] { primes.append(i) }
//    }
//}
//
//func solution() {
//    if n == 1 { // 1일 때는 소수 배열이 존재하지 않으므로 return
//        print(0)
//        return
//    }
//
//    let cnt = primes.count
//    var total = primes[0]
//    var st = 0
//    var en = 0
//    var ans = 0
//
//    // en이 범위 내에 있고 st <= en일 때
//    while en < cnt && st <= en {
//        if total < n { // total이 n보다 작을 때는 en을 오른쪽으로 이동시켜 total을 키운다
//            en += 1
//            if en != cnt { total += primes[en] }
//        } else { // total >= n
//            if total == n { ans += 1 } // 같을 경우에는 카운트해 주고
//            total -= primes[st] // total에서 st 위치의 소수를 빼어 다시 탐색한다
//            st += 1
//        }
//    }
//
//    print(ans)
//}
//
//findPrimes()
//solution()
