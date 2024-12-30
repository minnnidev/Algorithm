//
//  [백준 10610] 30.swift
//  Algorithm
//
//  Created by 김민 on 2/1/24.
//
// 백준 10610 30 https://www.acmicpc.net/problem/10610

/*
[📌 전략]
입력받는 N이 최대 10^5개의 숫자로 구성되어 있다는 점. (100000까지 입력을 받는 것 x)
3의 배수는 각 자리의 합이 3의 배수인 경우
30의 배수는 마지막 자리의 수가 0이고, 앞의 수들의 합이 3의 배수인 경우
이를 사용하여 풀이하면 된다.

[✅ 풀이]
1. 숫자를 배열로 나타낸 nums 배열 만들기
2. 마지막 수가 0인지, 혹은 마지막에 가장 큰 30의 배수를 구할 때 쉽게 사용할 수 있도록 nums를 내림차순 정렬
3. 마지막 수가 0인지 체크
4. nums의 누적합이 3의 배수인지 체크 (이 조건에 온 경우 마지막 수가 0이므로 전체 nums 배열의 누적합을 사용해도 결과에 영향이 없다.)
5. 여기까지 왔다는 것은 30의 배수를 만들 수 있다는 말이므로, 정렬 결과를 사용하여 가장 큰 수 출력
[📝 기록]
*/

var nums = readLine()!.map { $0 }.map { Int(String($0))! }
nums.sort(by: >) // 내림차순 정렬

func solve() {
    guard nums.last == 0 else { print(-1); return } // 마지막이 0인지 체크
    guard nums.reduce(0, +) % 3 == 0 else { print(-1); return } // nums 합이 3의 배수인지 체크
    print(nums.map { String($0) }.joined()) // 가장 큰 30의 배수 만들기
}

solve()
