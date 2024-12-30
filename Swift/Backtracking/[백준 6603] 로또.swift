//
//  [백준 6603] 로또.swift
//  Algorithm
//
//  Created by 김민 on 1/28/24.
//
// 백준 6603 로또 https://www.acmicpc.net/problem/6603

/*
[📌 전략]
주어진 조합 S에서 6개로 이루어진 조합을 찾으면 된다.
단, 조합은 오름차순이어야 함.

[✅ 풀이]
로또 수의 개수는 무조건 6개이므로, 조합의 길이가 6개가 되면 return
*/


var arr = [String]()
var nums = [Int]()
var k = 0

// n개의 수를 선택했고, 조합을 완성하기 위해 start부터 수를 뽑는 함수
func backtracking(_ n: Int, _ start: Int) {
    if n == 6 { // 6개의 수를 선택했을 때는 하나의 로또 조합을 완성한 것
        print(arr.joined(separator: " "))
        return
    }

    for i in start..<k { // start부터 탐색하여 뽑힌 수보다 큰 수를 뽑을 수 있도록 함
        arr[n] = "\(nums[i])"
        backtracking(n+1, i+1)
    }
}

while true { // 0이 입력될 때까지 반복
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    guard line[0] != 0 else { break }
    k = line[0]
    nums = Array(line[1...k])
    arr = Array(repeating: "", count: 6)

    backtracking(0, 0) // 현재 0개의 수를 뽑았고, 조합을 완성하기 위해 0부터 수를 뽑을 것
    print() // 하나의 테스트케이스가 끝나면 빈 줄 하나 출력
}
