//
//  [백준 1978] 소수 찾기.swift
//  Algorithm
//
//  Created by 김민 on 3/1/24.
//
// 백준 1978 소수 찾기 https://www.acmicpc.net/problem/1978

/*
[📌 전략]
1과 자기 자신만을 약수로 가지는 소수의 성질만을 이용하여 풀이
1은 소수가 아니다.
*/

/*
[✅ 풀이]
소수가 아닌 수들의 개수를 구하여 n개에서 배주기
2부터 해당 숫자-1까지 순회하며 나눴을 때 나머지가 0이 될 경우 개수를 카운트해 주고 탈출
 */
let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map { Int($0)! }
var notPrimeCnt = 0

for num in nums {
    if num == 1 {
        notPrimeCnt += 1
        continue
    }

    for i in 2..<num {
        if num % i == 0 {
            notPrimeCnt += 1
            break
        }
    }
}

print(n - notPrimeCnt)

/*
[✅ 풀이]
소수인 수를 구하기
함수를 만들어 2부터 해당 숫자-1까지 순회하며 나눠떨어지는 경우 false, 나눠떨어지지 않을 때는 해당 범위 내에 약수가 없단 뜻으로 true 반환
 true일 때는 소수 개수 카운트
 */
//let n = Int(readLine()!)!
//var nums = readLine()!.split(separator: " ").map { Int($0)! }
//var result = 0
//
//func check(_ num: Int) -> Bool {
//    for i in 2..<num {
//        if num % i == 0 { return false }
//    }
//    return true
//}
//
//for num in nums {
//    guard num > 1 else { continue }
//
//    result += check(num) ? 1 : 0
//}
//
//print(result)
