//
//  [백준 22862] 가장 긴 짝수 연속한 부분 수열.swift
//  Algorithm
//
//  Created by 김민 on 3/29/24.
//
// 백준 22862 가장 긴 짝수 연속한 부분 수열 https://www.acmicpc.net/problem/22862

/*
[📌 전략]
 k개 이하의 홀수를 포함하는 가장 긴 수열을 찾는다.
 k개 이하의 홀수를 포함하면, 문제에서 주어진 제거를 통해 짝수의 개수를 구할 수 있다.
 실제로 제거를 하지 않아도 짝수의 개수만 세면 된다.
 가장 긴 수열은 투 포인터를 통해 찾는다.
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (line[0], line[1])
let nums = readLine()!.split(separator: " ").map { Int($0)! }

var en = 0
var cnt = nums[0] % 2 == 0 ? 0 : 1 // 맨 첫 숫자가 홀수이면 cnt 1부터 시작
var ans = 0

for st in 0..<n { // st를 기준으로 탐색해보자
    while en < n && cnt <= k { // 아직 제거할 수 있는 홀수의 개수이고 en이 범위 내이면
        en += 1 // en을 이동시킨다
        if en != n && nums[en] % 2 != 0 { cnt += 1 } // 이동시킨 en이 홀수이면 cnt 추가
    }

    if en == n { // 가장 긴 짝수 배열이 맨 끝까지 도달한 경우
        ans = max(ans, en - st - cnt)
        break
    }

    ans = max(ans, en - st + 1 - cnt) // en - st + 1로 가장 긴 수열 개수 - 홀수 개수를 통해 max값 갱신
    cnt -= (nums[st] % 2 == 0 ? 0 : 1) // nums[st]가 홀수이면 cnt에서 1 빼주기
}

print(ans)

/*
[✅ 풀이]
 투 포인터 구현 시 en < n-1 일 때로 while 조건을 수정하면 en이 n이 됐을 때를 따로 고려하지 않아도 된다.
*/


//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, k) = (line[0], line[1])
//let nums = readLine()!.split(separator: " ").map { Int($0)! }
//
//var en = 0
//var cnt = nums[0] % 2 == 0 ? 0 : 1
//var ans = 0
//
//for st in 0..<n {
//    while en < n-1 && cnt <= k {
//        en += 1
//        if nums[en] % 2 != 0 { cnt += 1 }
//    }
//
//    ans = max(ans, en - st + 1 - cnt)
//    cnt -= (nums[st] % 2 == 0 ? 0 : 1)
//}
//
//print(ans)
