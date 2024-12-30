//
//  [백준 17478] 재귀함수가 뭔가요?.swift
//  Algorithm
//
//  Created by 김민 on 1/15/24.
//
// 백준 17478 재귀함수가 뭔가요?  https://www.acmicpc.net/problem/17478

/*
[📝 기록]
재귀함수의 기본 원리를 알아보는 문제

[📌 전략]
1. 재귀 함수의 원리를 이용하여 풀이하고 문자열 구현에서 실수하지 않도록 조심하기
2. ____를 출력하는 길이는 N - 현재 재귀 함수의 파라미터 n과 같다.
ex. 첫 번째 호출됐을 경우 ____는 0개 출력. 두 번째 호출됐을 경우 ___는 1개 출력.

[✅ 풀이]
재귀 함수를 구현한다.
____를 몇 번 출력해야 하는지 먼저 선언한다.
현재 순서에 맞는 ____를 출력하고 각 문장을 출력한다.
라고 답변하였지라는 문구 전에 재귀 함수를 호출하여 모두 종료된 후에 라고 답변하였지가 차례대로 출력되도록 한다.
재귀함수의 파라미터 n이 0이 되면 "재귀함수는 자기 자신을 호출하는 함수라네"라는 진짜 정답을 출력한 뒤 함수를 종료한다.
*/

let N = Int(readLine()!)!

func recursion(_ n: Int) {
    let underline = String(repeating: "____", count: (N-n))
    if n == 0 {
        print(underline, "\"재귀함수가 뭔가요?\"", separator: "")
        print(underline, "\"재귀함수는 자기 자신을 호출하는 함수라네\"", separator: "")
        print(underline, "라고 답변하였지.", separator: "")
        return
    }
    print(underline, "\"재귀함수가 뭔가요?\"", separator: "")
    print(underline, "\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.", separator: "")
    print(underline, "마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.", separator: "")
    print(underline, "그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\"", separator: "")
    recursion(n-1)
    print(underline, "라고 답변하였지.", separator: "")
}

print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")
recursion(N)
