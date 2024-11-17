//
//  [백준 11653] 소인수분해.swift
//  Algorithm
//
//  Created by 김민 on 3/1/24.
//
// 백준 11653 소인수분해 https://www.acmicpc.net/problem/11653

/*
[✅ 1번 풀이]
가장 기본적인 풀이
2부터 n까지 순회하면서 입력받은 n을 i로 나눌 수 있을 때까지 최대한 나눈다.
n이 1이 되면 탈출
*/

// 1-1
//var n = Int(readLine()!)!
//
//for i in 2..<n+1 {
//    if n == 1 { break }
//
//    while n % i == 0 {
//        n /= i
//        print(i)
//    }
//}


//var n = Int(readLine()!)!
//var cnt = 2
//
//while n > 1 {
//    if n % cnt == 0 {
//        n /= cnt
//        print(cnt)
//    } else {
//        cnt += 1
//    }
//}

/*
[✅ 2번 풀이] - 1번 풀이 최적화
소수 판정법과 마찬가지로 나누려는 숫자 i의 i*i 값이 현재 n보다 크다면 더이상 소인수분해 불가
따라서 n이 1이 아닐 경우에는 n을 출력하면 답이 된다.
*/

var n = Int(readLine()!)!

for i in 2..<n+1  {
    if i*i > n { break }
    while n % i == 0 {
        n /= i
        print(i)
    }
}

if n != 1 { print(n) }
