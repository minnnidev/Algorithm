//
//  [백준 11729] 하노이 탑 이동 순서.swift
//  Algorithm
//
//  Created by 김민 on 1/13/24.
//
// 백준 11729 하노이 탑 이동 순서 https://www.acmicpc.net/problem/11729

/*
[📝 기록]
재귀와 관련된 하노이탑 문제. 귀납적으로 고민해 보는 것이 너무 어려웠다. 😭

[📌 전략]
case 1) 원반이 1개 / 이동 횟수: 1
case 2) 원반이 2개 / 이동 횟수: 3
1번 원반을 2번 기둥에 (n-1개의 원반을 옮기는 작업)
2번 원반을 3번 기둥에 (n번째 원반을 옮기는 작업)
1번 원반을 3번 기둥에 (n-1개의 원반을 옮기는 작업)
case 3) 원반이 3개 / 이동 횟수: 7
1번 원반을 3번 기둥에, 2번 원반을 2번 기둥에, 1번 원반을 2번기둥에 (n-1개의 원반을 옮기는 작업)
3번 원반을 3번 기둥에 (n번째 원반을 옮기는 작업)
1번 원반을 1번 기둥에, 2번 원반을 3번 기둥에, 1번 원반을 3번 기둥에 (n-1개의 원반을 옮기는 작업)

1. n-1번째의 작업을 n번째 작업에도 그대로 적용한다. -> 재귀로 풀 수 있다.
2. n개를 옮기는데 필요한 동작 횟수 = 2^n-1
f(n)을 n개를 옮기는 데 필요한 동작의 수라고 하면, f(n) = 1 + 2f(n-1)이다.
n-1개를 먼저 보조 기둥(빈 기둥)으로 옮기는 횟수 f(n-1)
n번째 원반을 목적지 기둥으로 옮기는 횟수 1
n-1개를 보조 기둥(빈 기둥)에서 목적지 기둥으로 옮기는 횟수 f(n-1)
이를 더하면 1 + 2f(n-1)이고, f(n)을 일반화하면 2^n-1이다!

[✅ 풀이]
전략을 그대로 코드로 구현해 주기만 하면 된다.
첫 번째 풀이에서는 횟수를 직접 세었고, 두 번째 풀이에서는 횟수를 일반화식을 통해 먼저 구했다.
move함수를 start 기둥에서 dest 기둥으로 옮기는 방법을 출력하는 함수로 정의한다.
n이 1이 되면 이동 방법을 출력한 후 return

n-1개의 원판을 start에서 6-start-dest(빈 기둥)로 옮기기
n번째 원판을 start에서 dest로 옮기기
n-1개의 원판을 6-start-dest에서 dest로 옮기기
*/

// 1.
let n = Int(readLine()!)!
var count = 0
var answer = ""

// 방법을 출력하고 횟수 갱신
func addAnswer(_ start: Int, _ dest: Int) {
    answer += "\(start) \(dest)\n"
    count += 1
}

func move(_ start: Int, _ dest: Int, _ n: Int) {
    if n == 1 {
        addAnswer(start, dest)
        return
    }
    move(start, 6-start-dest, n-1)
    addAnswer(start, dest)
    move(6-start-dest, dest, n-1)
}

move(1, 3, n)
print(count)
print(answer)


// 2.
//import Foundation
//
// 읽반화 식 이용
//let n = Int(readLine()!)!
//print(pow(2, n) - 1)
//
//func move(_ start: Int, _ dest: Int, _ n: Int) {
//    if n == 1 {
//        print("\(start) \(dest)")
//        return
//    }
//    move(start, 6-start-dest, n-1)
//    print("\(start) \(dest)")
//    move(6-start-dest, dest, n-1)
//}
//
//move(1, 3, n)
