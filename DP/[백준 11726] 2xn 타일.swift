//
//  [백준 11726] 2xn 타일.swift
//  Algorithm
//
//  Created by 김민 on 2/17/24.
//
// 백준 11726 2xn 타일 https://www.acmicpc.net/problem/11726

/*
[📌 전략]
맨 왼쪽을 먼저 채운다고 가정해 보자.
맨 왼쪽을 2x1 타일로 채우면, 나머지를 채우는 방법의 개수는 d[n-1]개와 같다.
맨 왼쪽을 1x2 타일로 채우면, 자동으로 그밑에도 1x2 타일로 채울 수 밖에 없다.
나머지를 채우는 방법의 개수는 d[n-2]개와 같다.

따라서 2xi 크기의 직사각형을 채우는 방법의 개수는
d[i] = d[i-1] + d[i-2]개와 같고, 방법의 개수를 10007로 나눈 값을 출력해야 하니
d[i] = (d[i-1] + d[i-2]) % 10007와 같게 된다.
이때 d[1] = 1, d[2] = 2으로 초깃값을 설정한다.
*/


let n = Int(readLine()!)!
var d = Array(repeating: 0, count: n+1)

for i in 1...n {
    if i == 1 {
        d[1] = 1
    } else if i == 2 {
        d[2] = 2
    } else {
        d[i] = (d[i-1] + d[i-2]) % 10007
    }
}

print(d[n])
