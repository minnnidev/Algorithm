//
//  [백준 5568] 카드 놓기.swift
//  Algorithm
//
//  Created by 김민 on 10/11/24.
//
// 백준 5568 카드 놓기 https://www.acmicpc.net/problem/5568

/*
[📌 전략]
 n개의 숫자들 중에서 k개를 선택하여 만들 수 있는 모든 정수의 개수 구하기
 -> 중복된 값이 나올 수 있으므로, 만들어진 정수를 set에 추가하여 중복 없앤 후 최종 답 도출 필요

[✅ 풀이]
 1. n, k, 숫자 입력
 2. 백트래킹 실시 (cur: 현재 k개를 선택했다는 이미)
    1. cur이 k와 같아지면, 더이상 숫자를 뽑을 수 없으므로 set에 추가 후 탈출
    2. 아직 방문하지 않은 숫자라면, 방문 체크 후 다시 백트래킹 실시
       후에는 방문 처리를 해제하여 다시 뽑을 수 있도록 함
 3. backtracking(0) 호출
[📝 기록]
*/

func sol1() {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    var nums = [Int]()

    for _ in 0..<n {
        let num = Int(readLine()!)!
        nums.append(num)
    }

    var ansArr = Set<Int>()
    var arr = Array(repeating: 0, count: k)
    var isUsed = Array(repeating: false, count: n)

    func backtracking(_ cur: Int) {
        if cur == k {
            let num = Int(arr.map { String($0) }.joined())!
            ansArr.insert(num)
            return
        }

        for i in 0..<n {
            if isUsed[i] { continue }
            isUsed[i] = true
            arr[cur] = nums[i]
            backtracking(cur+1)
            isUsed[i] = false
        }
    }

    backtracking(0)
    print(ansArr.count)
}

func sol2() {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!
    var nums = [Int]()

    for _ in 0..<n {
        let num = Int(readLine()!)!
        nums.append(num)
    }

    var ansArr = Set<Int>()
    var isUsed = Array(repeating: false, count: n)

    func backtracking(_ cur: Int, _ num: String) {
        if cur == k {
            ansArr.insert(Int(num)!)
            return
        }

        for i in 0..<n {
            if isUsed[i] { continue }
            isUsed[i] = true
            backtracking(cur+1, num + "\(nums[i])")
            isUsed[i] = false
        }
    }

    backtracking(0, "")
    print(ansArr.count)
}
