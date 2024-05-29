//
//  [백준 13414] 수강신청.swift
//  Algorithm
//
//  Created by 김민 on 5/29/24.
//
// 백준 13414 수강신청 https://www.acmicpc.net/problem/13414

/*
[✅ 풀이]
 딕셔너리로 풀이 -> key: 학번, value: 대기열 순서
 updateValue로 이미 대기열로 들어와 있는 상태이면 대기열의 맨 뒤로 수정
 대기열에 없다면 딕셔너리에 새로 저장

 딕셔너리를 value가 작은 순으로 정렬한 뒤 앞에서부터 순서대로 k명의 학번을 출력
 수강 학생이 k보다 작은 경우도 존재하기 때문에 min(k, dic.count)을 사용했다.
 ex. 2 3
     2014
     2014
     2014
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (k, l) = (line[0], line[1])
var dic = [String:Int]()

for i in 1...l {
    let st = readLine()!

    dic.updateValue(i, forKey: st)
}


let sortedDic = dic.sorted { $0.value < $1.value }
let cnt = min(k, dic.count)

for i in 0..<cnt {
    print(sortedDic[i].key)
}
