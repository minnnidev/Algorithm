//
//  [프로그래머스] K번째 수.swift
//  Algorithm
//
//  Created by 김민 on 2/22/24.
//
// 프로그래머스 K번째 수 https://school.programmers.co.kr/learn/courses/30/lessons/42748

/*
[✅ 1번 풀이]
문제에 주어진 그대로 배열 인덱스가 0으로 시작하는 점을 고려하여
command[0]-1 ~ command[1]-1 만큼 주어진 array를 자르고,
자른 array에서 k-1번째 수를 결과 배열에 저장
*/

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    for command in commands {
        let (i, j, k) = (command[0]-1, command[1]-1, command[2]-1)
        var slicedArr = Array(array[i...j])
        slicedArr.sort()
        answer.append(slicedArr[k])
    }
    return answer
}

/*
 [✅ 2번 풀이]
 map을 이용한 간단한 풀이
 */

//func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
//    return commands.map { e in array[e[0]-1...e[1]-1].sorted()[e[2]-1] }
//}
