//
//  [백준 2839] 설탕배달.swift
//  Algorithm
//
//  Created by 김민 on 12/9/23.
//
// 2839 설탕 배달 https://www.acmicpc.net/problem/2839

/*
1.
최대한 적은 개수의 봉지를 들고 가려면, 5kg의 설탕을 최대한 많이 가지고 가야 한다. -> 그리디
따라서, 목표인 Nkg에 가장 가까운 5의 배수를 만들고, N과 그 수의 차이를 target으로 지정했다.
그리고 이 target이 3의 배수로 나눠질 수 있다면 바로 답을 구하고, 나누어지지 않는다면,
target에 5를 더해가며 만족하는지를 구한다. (기존에 최대한 가까운 5의 배수에서 시작했으므로)
target이 N을 초과하면, 3과 5로는 N을 만들 수 없다는 의미이므로 result로 -1을 출력한다.

*/

//var N = Int(readLine()!)!
//var tmp = N / 5
//var result = tmp
//var target = N - (tmp * 5)
//
//while true {
//    if target > N {
//        result = -1
//        break
//    }
//
//    if target % 3 == 0 {
//        let share = target / 3
//        target -= 3 * share
//        result += share
//        break
//    } else {
//        target += 5
//        result -= 1
//    }
//}
//
//print(result)

/*
2.
5kg으로 최대한 많이 운반하기 위해서 5kg을 최대한 많이 사용할 수 있는 조건을 찾을 때까지 3을 계속해서 빼준다.
조건을 찾지 못해서 N이 0이 아닌 수가 된다면 -1을 출력한다.
*/

var N = Int(readLine()!)!
var count = 0

while N > 0 {
    if N % 5 == 0 {
        count += N / 5
        N = 0
        break
    } else {
        N -= 3
        count += 1
    }
}

print(N == 0 ? count : -1)
