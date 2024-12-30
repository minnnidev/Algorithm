//
//  [백준 14888] 연산자 끼워넣기.swift
//  Algorithm
//
//  Created by 김민 on 8/11/24.
//
// 백준 14888 연산자 끼워넣기 https://www.acmicpc.net/problem/14888

/*
[📌 전략]
 백트래킹을 사용하여 모든 연산자 조합을 구한 뒤, 연산자 조합에 따라서 완전 탐색으로 계산하기

[✅ 풀이]
 1. 백트래킹으로 연산자 조합 구하기
 2. 계산 함수 구현
    유의해야 할 부분은 나눗셈 부분. 음수로 양수를 나눌 때는 음수를 양수로 바꿔준 뒤 몫을 구하고, 몫을 음수로 변경해야 한다고 해서
    사실 직접 구현했는데, 직접 구현하지 않아도 일반적인 나눗셈에서 적용되는 것이었음.
 3. 연산자 조합을 기준으로 입력받은 숫자들의 계산을 수행

[📝 기록]
 조합과 완전 탐색으로 쉽게 구현했다.
 신기했던 점은 앞서 내가 나눗셈을 직접 구현했다고 했는데, 그냥 일반 나눗셈은 시간 초과가 뜸. 아슬아슬하게 통과했나보다.
 그래서 더 빠른 풀이로 고민해 봄. 하단 풀이2 참고
*/

//// 입력
//let n = Int(readLine()!)!
//let nums = readLine()!.split(separator: " ").map { Int($0)! }
//let operInput = readLine()!.split(separator: " ").map { Int($0)! }
//var opers = [Int]()
//
//for i in 0..<operInput.count {
//    for _ in 0..<operInput[i] {
//        opers.append(i)
//    }
//}
//
//// 조합 구하기
//var operCombis = [[Int]]()
//var combi = Array(repeating: -1, count: opers.count)
//var isUsed = Array(repeating: false, count: opers.count)
//
//func backtracking(k: Int) {
//    if k == opers.count {
//        operCombis.append(combi)
//        return
//    }
//
//    for j in 0..<opers.count {
//        if !isUsed[j] {
//            isUsed[j] = true
//            combi[k] = opers[j]
//            backtracking(k: k+1)
//            isUsed[j] = false
//        }
//    }
//}
//
//// 계산
//func calculate(first: Int, oper: Int, second: Int) -> Int {
//    switch oper {
//    case 0:
//        return first + second
//    case 1:
//        return first - second
//    case 2:
//        return first * second
//    case 3:
//        if first < 0 {
//            return -(-first / second)
//        } else {
//            return first / second
//        }
//    default:
//        return 0
//    }
//}
//
//
//// 적용
//var ans = [Int]()
//
//backtracking(k: 0)
//
//for operCombi in operCombis {
//    var tmpNums = nums
//
//    for i in 0..<n-1 {
//        var res = 0
//        res = calculate(first: tmpNums[i], oper: operCombi[i], second: tmpNums[i+1])
//        tmpNums[i+1] = res
//    }
//
//    ans.append(tmpNums[n-1])
//}
//
//print(ans.max()!)
//print(ans.min()!)

/*
[📌 전략]
 백트래킹으로 조합만 구하는 게 아니라 dfs로 계산까지 전부 한번에

[✅ 풀이]
 1. dfs 함수 구현
    파라미터: ans - 현재 계한 답 / k - 계산된 숫자 수
    숫자가 모두 계산되면(k == n) 최대, 최소 갱신하고 함수 반환

    연산자를 나타내는 int형 0~3을 순회하며 dfs로 계산 실시
*/

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var operCnt = readLine()!.split(separator: " ").map { Int($0)! }
var mx = Int.min
var mn = Int.max

func dfs(ans: Int, k: Int) {
    if k == n {
        mx = max(mx, ans)
        mn = min(mn, ans)
        return
    }

    for i in 0..<4 {
        if operCnt[i] < 1 { continue }

        operCnt[i] -= 1

        switch i {
        case 0:
            dfs(ans: ans + nums[k] , k: k+1)
        case 1:
            dfs(ans: ans - nums[k] , k: k+1)
        case 2:
            dfs(ans: ans * nums[k] , k: k+1)
        case 3:
            dfs(ans: ans / nums[k] , k: k+1)
        default:
            break
        }

        operCnt[i] += 1
    }
}

dfs(ans: nums[0], k: 1)

print(mx)
print(mn)
