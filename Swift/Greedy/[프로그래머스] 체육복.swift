//
//  [프로그래머스] 체육복.swift
//  Algorithm
//
//  Created by 김민 on 10/24/24.
//
// 프로그래머스 체육복 https://school.programmers.co.kr/learn/courses/30/lessons/42862

/*
[📌 전략]
 체육복이 있어서 체육수업을 들을 수 있는 학생의 최댓값 구하기
 -> lost의 학생은 나보다 1 작은 수나 1 큰 수의 학생을 선택하기 -> 그리디

[✅ 풀이]
 1. 체육복을 가져온 사람이 도난 당한 경우를 처리
    lost, reserve에서 동일하게 존재하는 번호를 구하고 reserve, lost에서 해당 값을 제거해 줌
 2. 체육수업을 들을 수 있는 학생의 수 ans 선언
    체육복을 잃어버린 학생 빼고는 전부 들을 수 있으므로 n - 잃어버린 학생 수의 수로 초기화
 3. 정렬
    올바른 계산을 위해 newReserve, newLost 오름차순으로 저렬
 4. 체육복을 빌려줄 수 있는 경우를 탐색
    newLost를 순회 (번호 lst)
    lst 하갱은 lst-1, lst+1 학생으로부터 체육복을 빌릴 수 있음
    newReserve에 lst-1이 존재할 경우, ans를 1 추가하고, newReserve에서 제거
    lst +1이 존재할 경우, ans를 1 추가하고, newReserve에서 제거
 5. 최종 답안 ans 리턴
*/

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 체육복을 가져온 사람이 도난당한 경우
    var stolen = [Int]()
    for l in lost {
        for r in reserve {
            if l == r { stolen.append(r) }
        }
    }

    // 도난 당한 사람과 빌려줄 수 있는 사람을 비교
    var newReserve = reserve.filter { !stolen.contains($0) }
    var newLost = lost.filter { !stolen.contains($0) }
    var ans = n - newLost.count

    newReserve.sort()
    newLost.sort()

    for lst in newLost {
        let l = lst-1
        let r = lst+1

        if newReserve.contains(where: { $0 == l }) {
            ans += 1
            newReserve.removeAll(where: { $0 == l })
        } else if newReserve.contains(where: { $0 == r }) {
            ans += 1
            newReserve.removeAll(where: { $0 == r })
        }
    }

    return ans
}
