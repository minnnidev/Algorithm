//
//  [백준 1477] 휴게소 세우기.swift
//  Algorithm
//
//  Created by 김민 on 5/30/24.
//
// 백준 1477 휴게소 세우기 https://www.acmicpc.net/problem/1477

/*
[📌 전략]
 가능한 휴게소 간격을 기준으로 알맞은 값을 찾는 이분 탐색을 실시하기

[✅ 풀이]
 입력받은 휴게소 위치를 오름차순으로 정렬
 휴게소 간격의 차이를 구할 때 0과 l에 대한 정보도 필요하므로 해당 요소 삽입

 가능한 휴게소 간격을 기준으로 이분탐색 실시. 첫 범위는 (1~l-1)

 입력받은 휴게소끼리의 차에서 mid를 나누어 추가할 수 있는 휴게소 개수를 구하기
 만들어진 휴게소 개수가 m보다 크면 간격을 더 크게 해야 함 -> st를 mid+1로
 만들어진 휴게소 개수가 m보다 작거나 같다면 간격을 더 작게 -> en을 mid-1로

[📝 기록]
 휴게소의 위치를 기준으로 이분탐색을 실시하려 했는데, 간격을 기준으로 탐색할 수도 있다는 것을 알게 되었다.
*/


let line = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, l) = (line[0], line[1], line[2])
var pos = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

pos.insert(0, at: 0)
pos.append(l)

var st = 1
var en = l-1

while st <= en {
    let mid = (st+en)/2
    var cnt = 0

    for i in 1...n+1 {
        let diff = pos[i] - pos[i-1] - 1
        cnt += diff / mid
    }

    if cnt > m {
        st = mid + 1
    } else {
        en = mid - 1
    }
}

print(st)
