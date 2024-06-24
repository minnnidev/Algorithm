//
//  [백준 20366] 같이 눈사람 만들래?.swift
//  Algorithm
//
//  Created by 김민 on 6/20/24.
//
// 백준 20366 같이 눈사람 만들래? https://www.acmicpc.net/problem/20366

/*
[📌 전략]
 언니의 눈사람이 될 수 있는 눈덩이 2개를 고르고, 안나의 눈덩이는 투포인터로 최소 차이 찾기

[✅ 풀이]
 1. 이중 for문으로 언니의 눈덩이 고정하고 언니 눈사람 길이 저장
 2. st, en 2개의 포인터를 두고, 각각 0과 n-1 인덱스에서 시작
    - 눈덩이가 동일할 수 없으므로 while st < en 조건문 설정
    - 언니의 눈덩이와 겹친다면 포인터 이동
    - 안나의 눈사람 길이와 언니의 눈사람 길이의 차이가 최소인 것을 갱신하기
    - 언니의 눈사람 길이가 더 길다면, 차이를 최소화하기 위해 st를 더 크게 (오른쪽으로 이동)
    - 안나의 눈사람 길이가 더 길다면, 차이를 최소화하기 위해 en을 더 작게 (왼쪽으로 이동)

[📝 기록]
 언니 눈덩이와 겹칠 때를 해결하지 못하여 틀린 문제.
 포인터를 알맞게 이동시키면 되는 거였다... 😥
*/

let n = Int(readLine()!)!
var snows = readLine()!.split(separator: " ").map { Int($0)! }
var ans = Int.max

snows.sort()

func twoPointer() {
    for i in 0..<n {
        for j in i+1..<n {
            var st = 0
            var en = n-1
            let elzaHeight = snows[i] + snows[j]

            while st < en {
                if st == i || st == j {
                    st += 1
                    continue
                } else if en == i || en == j {
                    en -= 1
                    continue
                }

                let annaHeight = snows[st] + snows[en]
                let diff = abs(annaHeight-elzaHeight)

                if diff < ans { ans = diff }

                if elzaHeight > annaHeight {
                    st += 1
                } else if elzaHeight < annaHeight {
                    en -= 1
                } else {
                    ans = 0
                    return
                }
            }
        }
    }
}

twoPointer()
print(ans)
