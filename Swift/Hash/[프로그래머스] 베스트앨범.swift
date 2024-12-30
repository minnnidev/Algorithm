//
//  [프로그래머스] 베스트앨범.swift
//  Algorithm
//
//  Created by 김민 on 10/1/24.
//
// 프로그래머스 베스트앨범 https://school.programmers.co.kr/learn/courses/30/lessons/42579

/*
[📌 전략]
 각 장르를 기준으로 노래를 모으기 -> 해시
 특정한 기준으로 노래 수록하기 -> 정렬

[✅ 풀이]
 1. [장르: [(고유 번호, 노래 재생 횟수)]로 입력받기
 2. 속한 노래가 많이 재생된 장르를 먼저 수록하므로 해당 기준으로 먼저 정렬 -> genreSorted
    - 각 장르의 모든 노래 저장 횟수를 reduce 함수로 더한 후 정렬
 3. genreSorted를 순회하며 다음 기준에 따라 정렬
    - 많이 재생된 노래를 먼저 수록
    - 재생 횟수가 같으면 고유 번호로 비교
 4. 각 장르에서 정렬된 최대 2개의 노래를 ans 배열에 append -> prefix(2) 사용
*/

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dic = [String: [(Int, Int)]]()
    var ans = [Int]()

    for (num, play) in plays.enumerated() {
        dic[genres[num], default: []].append(contentsOf: [(num, play)])
    }

    var genreSorted = dic.sorted { a, b in
        return a.value.map { $0.1 }.reduce(0, +) > b.value.map { $0.1 }.reduce(0, +)
    }

    for genreDic in genreSorted {
        let tmp = genreDic.value.sorted {
            if $0.1 > $1.1 {
                return true
            } else if $0.1 == $1.1 {
                return $0.0 < $1.0
            } else {
                return false
            }
        }

        ans.append(contentsOf: tmp.prefix(2).map { $0.0 })
    }

    return ans
}
