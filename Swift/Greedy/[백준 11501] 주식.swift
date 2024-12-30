//
//  [백준 11501] 주식.swift
//  Algorithm
//
//  Created by 김민 on 12/17/23.
//
// 백준 11501 주식 https://www.acmicpc.net/problem/11501

/*
현재 구입하는 시점 이후에 가장 비쌀 때 판다.
날짜가 중요한 문제이기에 정렬을 하면 안 될 것 같다고 생각했다.
*/

/*
1. 시간 초과가 난 접근
- 현 시점을 제외하고 이후 날에 현 시점보다 큰 주가가 있다면 팔고 최대 이익에 (그날 주가 - 현 주가)를 더 해준다.
- 현 시점보다 큰 주가가 없다면 아무것도 하지 않는다. (사지도 팔지도 않는다)
라고 생각하여 코드를 구현하였다. removeFirst()를 해주기에, if let을 통해 인덱스 범위 처리를 했다.
시간 초과가 난 이유를 찾아보니 swift의 removeFirst()는 시간 복잡도가 O(N)이다.
max() 메소드도 O(N)이므로 최종 시간 복잡도는 O(N^2)이다.
*/
//let T = Int(readLine()!)!
//
//for _ in 0..<T {
//    let N = Int(readLine()!)!
//    var prices = readLine()!.split(separator: " ").map { Int($0)! }
//    var result = 0
//
//    while !prices.isEmpty {
//        let today = prices.removeFirst()
//        if let maxPrice = prices.max() {
//            if maxPrice > today { result += (maxPrice - today) }
//        }
//    }
//
//    print(result)
//}

/*
2. 시간 복잡도를 줄일 수 있는 방법을 오래 생각해 봤는데, 결국 답을 찾지 못해서 풀이를 참고했다.
답은 주가 배열을 역순으로 순회하였다.
역순으로 순회하면서, 현 주가가 저장한 max 값보다 크다면 갱신한다.
크지 않다면, 해당 시점의 max값에 팔면 되므로, 결과에 max - 현 주가를 더해 준다.
*/
let T = Int(readLine()!)!

for _ in 0..<T {
    let N = Int(readLine()!)!
    var prices = readLine()!.split(separator: " ").map { Int($0)! }
    var maxPrice = 0
    var result = 0

    for price in prices.reversed() {
        if price > maxPrice {
            maxPrice = price
        } else {
            result += (maxPrice - price)
        }
    }

    print(result)
}

/*
✅ 배열을 역순으로 순회하며 최대값을 갱신하는 전략을 쉽게 생각하지 못했어서, 잘 기억해 두어야겠다.
*/
