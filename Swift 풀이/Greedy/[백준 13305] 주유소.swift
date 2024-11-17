//
//  [백준 13305] 주유소.swift
//  Algorithm
//
//  Created by 김민 on 1/13/24.
//
// 백준 13305 주유소 https://www.acmicpc.net/problem/13305

/*
[📌 전략]
제일 왼쪽 도시에서 제일 오른쪽 도시로 이동할 때 주유 최소 비용 구하기
-> 남은 이동 중 주유 가격이 싼 곳에서 최대한 많은 기름을 주유해야 한다.

1번 도시에서는 무조건 다음 이동거리만큼은 주유해야 한다.
1번 도시의 가격을 저장하고, 2번 도시로 이동했을 때 1번 도시보다 주유 가격이 싸다면 2번 도시에서 주유를 한다.
다음 도시에서도 비교를 하기 위해, 더 싼 값인 2번 주유 가격으로 갱신한다.
2번 도시로 이동했을 때 2번 도시보다 1번 도시의 주유 가격이 싸다면, 저장해 둔 1번 도시 가격으로 주유를 한다.
1번 도시 가격이 더 싸므로 저장한 가격의 갱신은 필요없다.
이를 N-1만큼 반복한다. (마지막 도시에서는 다시 이동하지 않으므로)

[✅ 풀이]
roads에 도로 길이, oilPrices에 주유 가격을 저장한다.
price에 가격 비교에 사용할 수를 저장하고, 초깃값은 1번 도시의 주유 가격이다.
도로 개수만큼 순회한다.
현재 도시의 주유 가격이 저장해온 price보다 싸다면, 현재 도시의 주유 가격으로 갱신한다. price = oilPrices[i]
최소 비용에 현재 도시에서 다음 도시로 이동하는 거리 * price를 더한다.
*/

let N = Int(readLine()!)!
var roads = readLine()!.split(separator: " ").map { Int($0)! }
var oilPrices = readLine()!.split(separator: " ").map { Int($0)! }
var price = oilPrices[0]
var result = 0

for i in 0..<N-1 {
    if price > oilPrices[i] {  price = oilPrices[i] }
    result += roads[i] * price
}

print(result)
