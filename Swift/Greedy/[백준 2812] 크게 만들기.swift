//
//  [백준 2812] 크게 만들기.swift
//  Algorithm
//
//  Created by 김민 on 2/15/24.
//
// 백준 2812 크게 만들기 https://www.acmicpc.net/problem/2812

/*
[📌 전략]
 스택을 활용한 그리디 문제

 처음에 남겨둘 수 있는 범위의 수들 중 최댓값을 뽑고, 해당 수 이후부터 다시 탐색을 반복하는 구조로 풀이했더니 시간초과
 따라서, 스택의 마지막 값과의 비교만을 통해 탐색 범위를 줄인다.

[📝 기록]
 스택을 사용해야겠다는 생각이 바로 들지 않아서 오랫동안 시간초과와 씨름했다. 💦
*/

let line = readLine()!.split(separator: " ").map { Int($0)! }
var (n, k) = (line[0], line[1])
var number = readLine()!.map { $0 }
var stack = [Character]() // 결과를 저장할 스택

// 입력받은 number을 순회
for num in number {
    /*
     k: 지울 수 있는 수의 개수
     아직 수를 지울 수 있고, 스택이 비어있지 않아 스택의 마지막 값과 비교하여
     마지막 값이 현재 num 보다 작으면 stack에서 삭제하고 지우기
     */
    while k > 0 && !stack.isEmpty && stack.last! < num {
        _ = stack.popLast()
        k -= 1
    }

    stack.append(num)
}

// 아직 더 지울 수 있다면, 스택에 append된 k개의 수를 지운다.
(0..<k).forEach {_ in
    stack.removeLast()
}

print(String(stack))
