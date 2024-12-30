//
//  [백준 1700] 멀티탭 스케줄링.swift
//  Algorithm
//
//  Created by 김민 on 12/19/23.
//
// 백준 1700 멀티탭 스케줄링 https://www.acmicpc.net/problem/1700

/*
플러그를 빼는 횟수를 최소화하는 방법 찾기
-> 처음에는 자주 사용하는 전기 용품을 최대한 뽑지 않는 전략을 짰는데, 순서에 따라서 반례가 발생할 수 있었다.
따라서 남은 전기 용품 중 가장 나중에 사용하는 코드를 뽑아야 한다고 생각했다.

[풀이]
1.
입력받은 전기용품의 순서를 고려하며, 가장 처음 등장하는 인덱스를 firstPost 배열에 저장을 했다.
firstPos 배열은 인덱스를 쉽게 대응해 주기 위해, K+1개의 -1로 구성했고, firstPost[1]에는 전기용품1의 첫 번째 등장 인덱스를 저장했다.
ex. input: 2 3 2 3 1 2 7 / firstPost = [-1, 4, 0, 1, -1, -1, -1, 6]

2.
K번을 순회하며 멀티탭에 코드를 꽂는다.
멀티탭이 비어 있다면 멀티탭에 코드를 꽂아주는데, 이때 해당 전기 용품이 이미 꽂혀 있는 경우는 고려하지 않아야 한다.
멀티탭에 코드를 꽂고, 해당 전기 용품을 그다음으로 사용해야 하는 순서를 찾아 firstPos를 갱신한다.
만약에 그후에 등장을 하지 않는다면, 해당하는 전기 용품의 firstPos 요소를 -1로 갱신한다.

3.
멀티탭에 해당하는 코드가 이미 꽂혀 있는 경우,
코드를 꽂지 않아도 되니 2번과 같은 방식으로 firstPost를 갱신하기만 하면 된다.

4.
멀티탭이 비어있지 않고, 멀티탭에 해당하는 코드가 꽂혀 있지 않다면 코드를 하나 뽑아야 한다.
멀티탭에 현재 꽂혀 있는 코드 중 가장 나중에 사용해야 하는 코드를 뽑는다.
멀티탭에 꽂혀 있는 전기용품에 해당하는 firstPos 요소를 순회하며 가장 큰 것을 찾는다. (큰 것 == 가장 나중에 사용하는 것)
다만 순회 중 요소가 -1이라면, 앞으로 사용하지 않는 전기 용품이므로 해당 코드를 뽑는다.
멀티탭에 해당 전기 용품을 꽂은 뒤, 2번과 같은 방식으로 firstPost를 갱신한다.
*/

let lines = readLine()!.split(separator: " ").map { Int($0)! }
let (N, K) = (lines[0], lines[1])
var orders = readLine()!.split(separator: " ").map { Int($0)! }
var firstPos = Array(repeating: -1, count: K+1)
var multiTab = [Int]()
var count = 0

for i in 0..<K {
    if firstPos[orders[i]] == -1 {
        firstPos[orders[i]] = i
    }
}

for i in 0..<K {
    if multiTab.count < N {
        if !multiTab.contains(orders[i]) {
            multiTab.append(orders[i])
        }
    } else if !multiTab.contains(orders[i]) {
        var farIndex = -1
        var index = -1
        for j in 0..<N {
            if firstPos[multiTab[j]] == -1 {
                index = j
                break
            }

            if firstPos[multiTab[j]] > farIndex {
                farIndex = firstPos[multiTab[j]]
                index = j
            }
        }

        multiTab[index] = orders[i]
        count += 1
    }

    // 모든 케이스에서 꽂는 전기 용품의 firstPost를 갱신하므로 분리하여 공통으로 사용한다
    var isExist = false
    for j in i+1..<K {
        if orders[j] == orders[i] { // 나중에 사용할 때
            firstPos[orders[i]] = j
            isExist = true
            break
        }
    }
    if !isExist { firstPos[orders[i]] = -1 } // 나중에 사용하지 않으면 -1로 갱신
}

print(count)
