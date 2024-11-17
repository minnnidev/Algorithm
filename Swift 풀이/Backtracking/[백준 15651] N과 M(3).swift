//
//  [백준 15651] N과 M(3).swift
//  Algorithm
//
//  Created by 김민 on 1/18/24.
//
// 백준 15651 N과 M(3) https://www.acmicpc.net/problem/15651

/*
[📝 기록]
가능한 모든 조합을 구하는 문제 + 중복 허용 -> 중복 조합 구하기

[📌 전략]
중복을 허용하니 따로 isUsed나 visited 배열을 사용하지 않고 모든 경우의 수를 조합해 주면 된다고 생각했음.

[✅ 풀이]
findSequence(k:) - k개의 수를 택한 상황에서 nums[k]를 정하는 함수
nums: 뽑은 수열을 차례로 저장하는 함수
1. findSequence(k:) 선언
2. 수열이 m개가 되면 결과를 저장
3. 1부터 n까지 순회
    - nums[k]에 해당 차례의 숫자 할당
   indSequence(k+1)을 호출하여 다음 차례로 올 숫자를 찾음
    - 파라미터로 넣은 수가 m개와 같다면 2번
    - 아니라면 다시 3번 반복문 실행
*/

// 1. 🚨 시간 초과 발생
//let line = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, m) = (line[0], line[1])
//var nums = Array(repeating: 0, count: 10)
//var result = ""
//
//func findSequence(_ k: Int) {
//    if k == m {
//        for i in 0..<m {
//            result += "\(nums[i]) "
//        }
//        result += "\n"
//        return
//    }
//
//    for j in 1...n {
//        nums[k] = j
//        findSequence(k+1)
//    }
//}
//
//findSequence(0)
//print(result)

// 2. 로직이 틀린 건 아닌 것 같아서 최대한 시간을 줄일 수 있는 곳을 찾아 변경했더니 통과
let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (line[0], line[1])
var nums = Array(repeating: "", count: m) // [String]으로 선언
var result = ""

func findSequence(_ k: Int) {
    if k == m { // 수열의 개수가 m개가 됐을 때는 결과 출력을 위해 저장
        result += nums.joined(separator: " ") // joined 사용
        result += "\n"
        return
    }

    for j in 1...n { // 중복 조합이므로 따로 1부터 n까지 순회하면서 모든 경우에 뽑기만 하면 된다
        nums[k] = "\(j)" // String으로 변환해서 할당
        findSequence(k+1)
    }
}

findSequence(0)
print(result)
